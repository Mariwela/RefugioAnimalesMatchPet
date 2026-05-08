<?php
header('Content-Type: application/json; charset=utf-8');
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

try {
    // 1. Verificamos usuario
    $payload = autenticar();
    $id_usuario = $payload['id_usuario'];

    // 2. Leemos los datos enviados por Angular (Angular envía JSON en el body)
    $datos_json = file_get_contents("php://input");
    $data = json_decode($datos_json, true);

    // 3. Validamos que lleguen los datos
    if (empty($data['id_animal']) || empty($data['titulo']) || empty($data['contenido'])) {
        throw new Exception("Faltan datos obligatorios para publicar la historia.");
    }

    $database = new Database();
    $db = $database->getConnection();

    // 4. Insertamos en la base de datos (por defecto la imagen será nula por ahora)
    $query = "INSERT INTO historias_adopcion (id_usuario, id_animal, titulo, contenido, estado) 
              VALUES (:id_usuario, :id_animal, :titulo, :contenido, 'Pendiente')";
              
    $stmt = $db->prepare($query);
    $stmt->bindParam(':id_usuario', $id_usuario, PDO::PARAM_INT);
    $stmt->bindParam(':id_animal', $data['id_animal'], PDO::PARAM_INT);
    $stmt->bindParam(':titulo', $data['titulo'], PDO::PARAM_STR);
    $stmt->bindParam(':contenido', $data['contenido'], PDO::PARAM_STR);
    
    if ($stmt->execute()) {
        // Devolvemos el ID de la historia por si luego queremos adjuntarle una foto
        $id_nueva_historia = $db->lastInsertId();
        echo json_encode([
            "status" => "success", 
            "message" => "Historia enviada correctamente a moderación.",
            "id_historia" => $id_nueva_historia
        ]);
    } else {
        throw new Exception("No se pudo guardar la historia en la base de datos.");
    }

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => $e->getMessage()]);
}