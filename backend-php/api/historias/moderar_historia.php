<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = requiere_rol('admin');

$data = json_decode(file_get_contents('php://input'));

if (!$data || empty($data->id_historia) || empty($data->nuevo_estado)) {
    http_response_code(400);
    echo json_encode(["message" => "Faltan datos (id_historia o nuevo_estado)."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    $query = "UPDATE historias_adopcion SET estado = :estado, comentario_admin = :comentario WHERE id_historia = :id";
    $stmt = $db->prepare($query);
    
    $stmt->execute([
        ':estado' => $data->nuevo_estado,
        ':comentario' => $data->comentario_admin ?? null,
        ':id'     => (int)$data->id_historia
    ]);

    echo json_encode([
        "status" => "success", 
        "message" => "La historia ahora está: " . $data->nuevo_estado
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => $e->getMessage()]);
}