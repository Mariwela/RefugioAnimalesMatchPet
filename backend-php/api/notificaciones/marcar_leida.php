<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = autenticar();
$id_u = $payload['id_usuario'];

$data = json_decode(file_get_contents("php://input"));

if (!isset($data->id)) {
    http_response_code(400);
    echo json_encode(["status" => "error", "message" => "Falta el ID de la notificación"]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    $stmt = $db->prepare("UPDATE solicitudes 
                          SET notificacion_leida = 1 
                          WHERE id_solicitud = :id AND id_usuario = :id_u");
                          
    $stmt->execute([
        ':id' => $data->id,
        ':id_u' => $id_u
    ]);

    echo json_encode(["status" => "success", "message" => "Notificación marcada como leída"]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Error SQL: " . $e->getMessage()]);
}
?>