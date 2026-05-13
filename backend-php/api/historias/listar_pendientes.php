<?php
header('Content-Type: application/json; charset=utf-8');
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

try {
    requiere_rol('admin');

    $database = new Database();
    $db = $database->getConnection();
    $query = "SELECT h.*, a.nombre as nombre_animal 
              FROM historias_adopcion h
              INNER JOIN animales a ON h.id_animal = a.id_animal
              WHERE h.estado = 'Pendiente' 
              ORDER BY h.fecha DESC";
              
    $stmt = $db->prepare($query);
    $stmt->execute();
    
    $historias = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        "status" => "success", 
        "data" => $historias
    ]);
    exit;

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        "status" => "error", 
        "message" => $e->getMessage()
    ]);
    exit;
}