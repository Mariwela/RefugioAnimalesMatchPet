<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

// Verificamos que el usuario tenga sesión iniciada
$payload = autenticar();

try {
    $database = new Database();
    $db = $database->getConnection();

    // Buscamos los animales vinculados a este usuario cuya solicitud fue 'Aprobada'
    $query = "SELECT a.id_animal, a.nombre, a.foto_portada 
              FROM solicitudes s
              JOIN animales a ON s.id_animal = a.id_animal
              WHERE s.id_usuario = :id_usuario 
              AND s.estado_solicitud = 'Aprobada'";
    
    $stmt = $db->prepare($query);
    $stmt->execute([':id_usuario' => $payload['id_usuario']]);
    
    $adoptados = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        "status" => "success", 
        "data" => $adoptados
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error: " . $e->getMessage()]);
}