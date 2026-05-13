<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = autenticar(); 

try {
    $database = new Database();
    $db = $database->getConnection();

    $query = "SELECT 
                h.id_historia,
                h.id_animal,
                h.titulo,
                h.contenido,
                h.imagen_url,
                h.estado,
                h.fecha_publicacion,
                a.nombre AS nombre_animal
              FROM historias_adopcion h
              JOIN animales a ON h.id_animal = a.id_animal
              WHERE h.id_usuario = :id_u
              ORDER BY h.fecha_publicacion DESC";

    $stmt = $db->prepare($query);
    $stmt->execute([':id_u' => $payload['id_usuario']]);

    $historias = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        "status" => "success",
        "total" => count($historias),
        "data" => $historias
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error al obtener tus historias: " . $e->getMessage()]);
}