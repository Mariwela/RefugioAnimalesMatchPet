<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = autenticar(); 

// Obtener ID de la historia (puede venir por GET o POST, usaremos GET por simplicidad en Angular)
$id_historia = isset($_GET['id']) ? (int)$_GET['id'] : 0;

if ($id_historia <= 0) {
    http_response_code(400);
    echo json_encode(["message" => "ID de historia no válido."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    // 1. Consultar la historia para obtener la ruta de la imagen y el autor
    $querySelect = "SELECT id_usuario, imagen_url FROM historias_adopcion WHERE id_historia = :id";
    $stmtSelect = $db->prepare($querySelect);
    $stmtSelect->execute([':id' => $id_historia]);
    $historia = $stmtSelect->fetch(PDO::FETCH_ASSOC);

    if (!$historia) {
        http_response_code(404);
        echo json_encode(["message" => "La historia no existe."]);
        exit;
    }

    // 2. Verificar si es Admin o si es el usuario que la creó
    if ($payload['rol'] !== 'admin' && $payload['id_usuario'] != $historia['id_usuario']) {
        http_response_code(403);
        echo json_encode(["message" => "No tienes permiso para eliminar esta historia."]);
        exit;
    }

    // 3. Borrar el registro de la Base de Datos
    $queryDelete = "DELETE FROM historias_adopcion WHERE id_historia = :id";
    $stmtDelete = $db->prepare($queryDelete);
    
    if ($stmtDelete->execute([':id' => $id_historia])) {
        
        // 4. Borrar el archivo físico si no es la imagen por defecto
        $ruta_imagen = $historia['imagen_url'];
        
        if ($ruta_imagen && $ruta_imagen !== "public/historias/default.jpg") {
            $ruta_fisica = "../../" . $ruta_imagen;
            
            if (file_exists($ruta_fisica)) {
                unlink($ruta_fisica);
            }
        }

        echo json_encode([
            "status" => "success",
            "message" => "Historia eliminada correctamente y archivo borrado."
        ]);
    }

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error al eliminar: " . $e->getMessage()]);
}