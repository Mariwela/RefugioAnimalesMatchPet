<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = autenticar();

try {
    $database = new Database();
    $db = $database->getConnection();

    $db->beginTransaction();

    $query = "DELETE FROM usuarios WHERE id_usuario = :id";
    $stmt = $db->prepare($query);
    $stmt->execute([':id' => $payload['id_usuario']]);

    $db->commit();

    echo json_encode([
        "status" => "success",
        "message" => "Tu cuenta ha sido eliminada permanentemente. Lamentamos verte partir."
    ]);

} catch (Exception $e) {
    if ($db->inTransaction()) {
        $db->rollBack();
    }
    http_response_code(500);
    echo json_encode(["message" => "Error al eliminar la cuenta: " . $e->getMessage()]);
}