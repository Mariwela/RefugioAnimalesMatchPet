<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = autenticar();

$data = json_decode(file_get_contents('php://input'));

if (!$data || empty($data->id_animal)) {
    http_response_code(400);
    echo json_encode(["message" => "ID de animal requerido."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    $query = "DELETE FROM favoritos WHERE id_usuario = :u AND id_animal = :a";
    $stmt = $db->prepare($query);
    $stmt->execute([':u' => $payload['id_usuario'], ':a' => $data->id_animal]);

    echo json_encode(["status" => "success", "message" => "Eliminado de favoritos."]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => $e->getMessage()]);
}