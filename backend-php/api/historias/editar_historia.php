<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

// 1. Manejar el Preflight de Angular (OPTIONS)
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}

// 2. Permitir que el método sea POST o PUT
if ($_SERVER['REQUEST_METHOD'] !== 'POST' && $_SERVER['REQUEST_METHOD'] !== 'PUT') {
    http_response_code(405);
    echo json_encode(["message" => "Método no permitido. Usa POST o PUT."]);
    exit;
}

$payload = autenticar();
$data = json_decode(file_get_contents('php://input'));

// 3. Limpiar espacios extra y validar existencia
$id_historia = $data->id_historia ?? null;
$titulo = isset($data->titulo) ? trim($data->titulo) : null;
$contenido = isset($data->contenido) ? trim($data->contenido) : null;

if (!$id_historia || empty($titulo) || empty($contenido)) {
    http_response_code(400);
    echo json_encode(["status" => "error", "message" => "Faltan datos obligatorios para la edición."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    $queryCheck = "SELECT id_usuario FROM historias_adopcion WHERE id_historia = :id";
    $stmtCheck = $db->prepare($queryCheck);
    $stmtCheck->execute([':id' => $id_historia]);
    $historia = $stmtCheck->fetch(PDO::FETCH_ASSOC);

    if (!$historia) {
        http_response_code(404);
        echo json_encode(["status" => "error", "message" => "La historia no existe."]);
        exit;
    }

    if ($payload['rol'] !== 'admin') {
        http_response_code(403);
        echo json_encode(["status" => "error", "message" => "Solo los administradores pueden editar historias."]);
        exit;
    }

    $queryUpdate = "UPDATE historias_adopcion 
                    SET titulo = :titulo, contenido = :contenido
                    WHERE id_historia = :id";
    
    $stmtUpdate = $db->prepare($queryUpdate);
    
    $stmtUpdate->execute([
        ':titulo'    => $titulo,
        ':contenido' => $contenido,
        ':id'        => $id_historia
    ]);

    echo json_encode([
        "status" => "success",
        "message" => "Historia actualizada."
    ]);
    exit;

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Error al actualizar: " . $e->getMessage()]);
    exit;
}
?>