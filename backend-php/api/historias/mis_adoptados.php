<?php
header('Content-Type: application/json; charset=utf-8');
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

try {
    $payload = autenticar(); 
    $id_usuario = $payload['id_usuario'];

    $database = new Database();
    $db = $database->getConnection();

    $query = "SELECT a.id_animal, a.nombre 
              FROM solicitudes s
              INNER JOIN animales a ON s.id_animal = a.id_animal
              WHERE s.id_usuario = :id_usuario AND s.estado_solicitud = 'Aprobada'";
              
    $stmt = $db->prepare($query);
    $stmt->bindParam(':id_usuario', $id_usuario, PDO::PARAM_INT);
    $stmt->execute();
    
    $animales = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    echo json_encode(["status" => "success", "data" => $animales]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => $e->getMessage()]);
}