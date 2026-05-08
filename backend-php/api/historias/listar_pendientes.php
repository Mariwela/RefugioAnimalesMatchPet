<?php
header('Content-Type: application/json; charset=utf-8');
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

try {
    // 1. Solo los admins pueden ver esto
    requiere_rol('admin');

    $database = new Database();
    $db = $database->getConnection();

    // 2. Consulta mejorada
    // Traemos los datos de la historia + el nombre del animal para que el admin sepa de quién es
    $query = "SELECT h.*, a.nombre as nombre_animal 
              FROM historias_adopcion h
              INNER JOIN animales a ON h.id_animal = a.id_animal
              WHERE h.estado = 'Pendiente' 
              ORDER BY h.fecha DESC";
              
    $stmt = $db->prepare($query);
    $stmt->execute();
    
    $historias = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // 3. Devolvemos la lista (aunque sea un array vacío)
    echo json_encode([
        "status" => "success", 
        "data" => $historias
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        "status" => "error", 
        "message" => $e->getMessage()
    ]);
}