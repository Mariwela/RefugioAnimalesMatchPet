<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

// 1. Validar que el método sea PUT (o POST, según prefieras para ediciones)
if ($_SERVER['REQUEST_METHOD'] !== 'PUT') {
    http_response_code(405);
    echo json_encode(["message" => "Método no permitido. Usa PUT."]);
    exit;
}

$payload = autenticar();
$data = json_decode(file_get_contents('php://input'));

// 2. Limpiar espacios extra y validar existencia
$id_historia = $data->id_historia ?? null;
$titulo = isset($data->titulo) ? trim($data->titulo) : null;
$contenido = isset($data->contenido) ? trim($data->contenido) : null;

if (!$id_historia || empty($titulo) || empty($contenido)) {
    http_response_code(400);
    echo json_encode(["message" => "Faltan datos obligatorios para la edición."]);
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
        echo json_encode(["message" => "La historia no existe."]);
        exit;
    }

    if ($payload['rol'] !== 'admin' && $payload['id_usuario'] != $historia['id_usuario']) {
        http_response_code(403);
        echo json_encode(["message" => "No tienes permiso para editar esta historia."]);
        exit;
    }

    $queryUpdate = "UPDATE historias_adopcion 
                    SET titulo = :titulo, 
                        contenido = :contenido, 
                        estado = 'Pendiente' 
                    WHERE id_historia = :id";
    
    $stmtUpdate = $db->prepare($queryUpdate);
    
    $stmtUpdate->execute([
        ':titulo'    => $titulo,
        ':contenido' => $contenido,
        ':id'        => $id_historia
    ]);

    echo json_encode([
        "status" => "success",
        "message" => "Historia actualizada. Queda pendiente de revisión por el administrador."
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error al actualizar: " . $e->getMessage()]);
}
?>