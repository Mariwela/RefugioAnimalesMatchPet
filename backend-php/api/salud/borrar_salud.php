<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = requiere_rol('admin', 'vet');

$id_libro = isset($_GET['id_libro']) ? (int)$_GET['id_libro'] : 0;

if ($id_libro <= 0) {
    http_response_code(400);
    echo json_encode(["message" => "ID de registro no válido."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    $stmtCheck = $db->prepare("SELECT id_libro FROM salud_historial WHERE id_libro = :id");
    $stmtCheck->execute([':id' => $id_libro]);

    if ($stmtCheck->rowCount() === 0) {
        http_response_code(404);
        echo json_encode(["message" => "El registro médico no existe."]);
        exit;
    }

    $query = "DELETE FROM salud_historial WHERE id_libro = :id";
    $stmt = $db->prepare($query);
    
    if ($stmt->execute([':id' => $id_libro])) {
        echo json_encode([
            "status" => "success",
            "message" => "Registro médico eliminado correctamente."
        ]);
    } else {
        throw new Exception("No se pudo eliminar el registro.");
    }

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error en el servidor: " . $e->getMessage()]);
}