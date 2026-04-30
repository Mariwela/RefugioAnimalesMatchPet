<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = autenticar();

$data = json_decode(file_get_contents('php://input'));

if (!$data || empty($data->id_animal)) {
    http_response_code(400);
    echo json_encode(["message" => "ID del animal no proporcionado."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    // Insertar la solicitud
    $query = "INSERT INTO solicitudes (id_usuario, id_animal) VALUES (:id_u, :id_a)";
    $stmt = $db->prepare($query);

    $stmt->execute([
        ':id_u' => $payload['id_usuario'],
        ':id_a' => (int)$data->id_animal
    ]);

    http_response_code(201);
    echo json_encode([
        "status" => "success",
        "message" => "Solicitud enviada correctamente. El refugio la revisará pronto."
    ]);

} catch (PDOException $e) {
    // Si el error es 23000 es por el UNIQUE (ya existe la solicitud)
    if ($e->getCode() == 23000) {
        http_response_code(409);
        echo json_encode(["message" => "Ya has enviado una solicitud para este animal anteriormente."]);
    } else {
        http_response_code(500);
        echo json_encode(["message" => "Error: " . $e->getMessage()]);
    }
}