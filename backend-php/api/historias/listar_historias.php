<?php
// ¡Nada de espacios ni saltos de línea antes del <?php !
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';

try {
    $database = new Database();
    $db = $database->getConnection();

    // Traemos TODAS las historias aprobadas
    $query = "SELECT h.*, a.nombre AS nombre_animal, u.nombre_completo AS nombre_usuario 
              FROM historias_adopcion h
              JOIN animales a ON h.id_animal = a.id_animal
              LEFT JOIN usuarios u ON h.id_usuario = u.id_usuario
              WHERE h.estado = 'Aprobada'
              ORDER BY h.fecha DESC";

    $stmt = $db->prepare($query);
    $stmt->execute();
    
    $historias = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Devolvemos el JSON exacto que espera Angular
    echo json_encode(["status" => "success", "data" => $historias]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => $e->getMessage()]);
}