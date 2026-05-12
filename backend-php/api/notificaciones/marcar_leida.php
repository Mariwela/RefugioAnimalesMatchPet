<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

// Verificamos el usuario logeado
$payload = autenticar();
$id_u = $payload['id_usuario'];

// Angular envía los datos en formato JSON, así que lo leemos así:
$data = json_decode(file_get_contents("php://input"));

// Verificamos que venga el ID de la solicitud
if (!isset($data->id)) {
    http_response_code(400);
    echo json_encode(["status" => "error", "message" => "Falta el ID de la notificación"]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    // Actualizamos la base de datos para marcarla como leída (1)
    // También validamos que pertenezca al usuario que está logeado por seguridad
    $stmt = $db->prepare("UPDATE solicitudes 
                          SET notificacion_leida = 1 
                          WHERE id_solicitud = :id AND id_usuario = :id_u");
                          
    $stmt->execute([
        ':id' => $data->id,
        ':id_u' => $id_u
    ]);

    // Devolvemos el status "success" para que Angular sepa que todo salió bien
    echo json_encode(["status" => "success", "message" => "Notificación marcada como leída"]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Error SQL: " . $e->getMessage()]);
}
?>