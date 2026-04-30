<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = autenticar();
$id_u = $payload['id_usuario'];

try {
    $database = new Database();
    $db = $database->getConnection();

    // 1. ¿Tiene solicitudes que acaban de ser aprobadas o rechazadas?
    $stmtSol = $db->prepare("SELECT COUNT(*) as total FROM solicitudes_adopcion 
                             WHERE id_usuario = :id_u AND estado != 'Pendiente'");
    $stmtSol->execute([':id_u' => $id_u]);
    $solicitudesActualizadas = $stmtSol->fetch(PDO::FETCH_ASSOC)['total'];

    // 2. ¿Tiene historias que ya fueron aprobadas?
    $stmtHist = $db->prepare("SELECT COUNT(*) as total FROM historias_adopcion 
                              WHERE id_usuario = :id_u AND estado = 'Aprobada'");
    $stmtHist->execute([':id_u' => $id_u]);
    $historiasAprobadas = $stmtHist->fetch(PDO::FETCH_ASSOC)['total'];

    // Enviamos un resumen de "puntos de interés"
    echo json_encode([
        "status" => "success",
        "alertas" => [
            "solicitudes_finalizadas" => (int)$solicitudesActualizadas,
            "historias_publicadas" => (int)$historiasAprobadas
        ],
        "mensaje_global" => "Tienes " . ($solicitudesActualizadas + $historiasAprobadas) . " actualizaciones en tu perfil."
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => $e->getMessage()]);
}