<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = autenticar();

try {
    $database = new Database();
    $db = $database->getConnection();

    $query = "SELECT a.* 
              FROM animales a
              INNER JOIN favoritos f ON a.id_animal = f.id_animal
              WHERE f.id_usuario = :id_u";

    $stmt = $db->prepare($query);
    
    if (!$stmt->execute([':id_u' => $payload['id_usuario']])) {
        $errorInfo = $stmt->errorInfo();
        throw new Exception("Error en SQL: " . $errorInfo[2]);
    }
    
    $favoritos = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        "status" => "success",
        "total" => count($favoritos),
        "data" => $favoritos
    ]);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode([
        "status" => "error",
        "message" => "Error de Base de Datos: " . $e->getMessage()
    ]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        "status" => "error",
        "message" => "Error General: " . $e->getMessage(),
        "linea" => $e->getLine()
    ]);
}