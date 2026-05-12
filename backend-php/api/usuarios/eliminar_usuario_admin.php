<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';
 
$payload = autenticar();
 
// Solo admin puede usar este endpoint
if ($payload['rol'] !== 'admin') {
    http_response_code(403);
    echo json_encode(["status" => "error", "message" => "Acceso denegado. Solo administradores."]);
    exit;
}
 
try {
    $body = json_decode(file_get_contents('php://input'), true);
    $id_a_eliminar = isset($body['id_usuario']) ? intval($body['id_usuario']) : 0;
 
    if (!$id_a_eliminar) {
        http_response_code(400);
        echo json_encode(["status" => "error", "message" => "ID de usuario no válido."]);
        exit;
    }
 
    // Seguridad: un admin no puede eliminarse a sí mismo por aquí
    if ($id_a_eliminar === $payload['id_usuario']) {
        http_response_code(400);
        echo json_encode(["status" => "error", "message" => "No puedes eliminarte a ti mismo desde este panel."]);
        exit;
    }
 
    $database = new Database();
    $db = $database->getConnection();
 
    // Verificamos que el usuario existe y es colaborador (nunca eliminar otro admin o vet por error)
    $check = $db->prepare("SELECT rol FROM usuarios WHERE id_usuario = :id");
    $check->execute([':id' => $id_a_eliminar]);
    $usuario = $check->fetch(PDO::FETCH_ASSOC);
 
    if (!$usuario) {
        http_response_code(404);
        echo json_encode(["status" => "error", "message" => "Usuario no encontrado."]);
        exit;
    }
 
    if ($usuario['rol'] !== 'colaborador') {
        http_response_code(403);
        echo json_encode(["status" => "error", "message" => "Solo se pueden eliminar cuentas de colaboradores desde este panel."]);
        exit;
    }
 
    $db->beginTransaction();
 
    $stmt = $db->prepare("DELETE FROM usuarios WHERE id_usuario = :id");
    $stmt->execute([':id' => $id_a_eliminar]);
 
    $db->commit();
 
    echo json_encode([
        "status"  => "success",
        "message" => "La cuenta ha sido eliminada permanentemente."
    ]);
 
} catch (Exception $e) {
    if (isset($db) && $db->inTransaction()) {
        $db->rollBack();
    }
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Error al eliminar la cuenta: " . $e->getMessage()]);
}
?>