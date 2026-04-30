<?php
require_once '../../config/cors.php';
require_once '../../config/auth_middleware.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
requiere_rol('admin');

try {
    $database = new Database();
    $db = $database->getConnection();

    $query = "SELECT h.*, u.email FROM historias_adopcion h 
              LEFT JOIN usuarios u ON h.id_usuario = u.id_usuario 
              WHERE h.estado = 'Pendiente'";
    
    $stmt = $db->prepare($query);
    $stmt->execute();
    
    echo json_encode(["status" => "success", "data" => $stmt->fetchAll(PDO::FETCH_ASSOC)]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => $e->getMessage()]);
}