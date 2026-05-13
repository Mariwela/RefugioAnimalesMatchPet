<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = requiere_rol('admin');

$data = json_decode(file_get_contents('php://input'));

if (!$data || empty($data->id_solicitud) || empty($data->nuevo_estado)) {
    http_response_code(400);
    echo json_encode(["message" => "Datos incompletos."]);
    exit;
}

$estados_permitidos = ['Pendiente', 'Aprobada', 'Rechazada'];
if (!in_array($data->nuevo_estado, $estados_permitidos)) {
    http_response_code(400);
    echo json_encode(["message" => "Estado no válido."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    $query = "UPDATE solicitudes SET estado_solicitud = :estado, comentario_admin = :comentario WHERE id_solicitud = :id";
    $stmt = $db->prepare($query);

    $stmt->execute([
        ':estado' => $data->nuevo_estado,
        ':comentario' => $data->comentario_admin ?? null,
        ':id'     => (int)$data->id_solicitud
    ]);

    echo json_encode(["status" => "success", "message" => "Solicitud actualizada a " . $data->nuevo_estado]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error: " . $e->getMessage()]);
}