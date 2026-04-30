<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = autenticar();

try {
    $database = new Database();
    $db = $database->getConnection();

    // Si es admin, ve todas. Si no, solo las suyas.
    if ($payload['rol'] === 'admin') {
        $query = "SELECT s.*, u.nombre_completo, a.nombre AS nombre_animal 
                  FROM solicitudes s
                  JOIN usuarios u ON s.id_usuario = u.id_usuario
                  JOIN animales a ON s.id_animal = a.id_animal
                  ORDER BY s.fecha_solicitud DESC";
        $stmt = $db->prepare($query);
        $stmt->execute();
    } else {
        $query = "SELECT s.*, a.nombre AS nombre_animal 
                  FROM solicitudes s
                  JOIN animales a ON s.id_animal = a.id_animal
                  WHERE s.id_usuario = :id_u
                  ORDER BY s.fecha_solicitud DESC";
        $stmt = $db->prepare($query);
        $stmt->execute([':id_u' => $payload['id_usuario']]);
    }

    $solicitudes = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode(["status" => "success", "data" => $solicitudes]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => $e->getMessage()]);
}