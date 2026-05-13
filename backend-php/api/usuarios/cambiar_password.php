<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = autenticar();

$data = json_decode(file_get_contents('php://input'));

if (!$data || empty($data->password_actual) || empty($data->password_nuevo)) {
    http_response_code(400);
    echo json_encode(["message" => "Faltan datos obligatorios."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();
    $query = "SELECT password FROM usuarios WHERE id_usuario = :id";
    $stmt = $db->prepare($query);
    $stmt->execute([':id' => $payload['id_usuario']]);
    $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$usuario) {
        http_response_code(404);
        echo json_encode(["message" => "Usuario no encontrado."]);
        exit;
    }

    if (!password_verify($data->password_actual, $usuario['password'])) {
        http_response_code(401);
        echo json_encode(["message" => "La contraseña actual es incorrecta."]);
        exit;
    }

    $nuevo_hash = password_hash($data->password_nuevo, PASSWORD_BCRYPT);
    $updateQuery = "UPDATE usuarios SET password = :pass WHERE id_usuario = :id";
    $updateStmt = $db->prepare($updateQuery);
    
    if ($updateStmt->execute([':pass' => $nuevo_hash, ':id' => $payload['id_usuario']])) {
        echo json_encode([
            "status" => "success",
            "message" => "Contraseña actualizada correctamente."
        ]);
    }

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error en el servidor: " . $e->getMessage()]);
}