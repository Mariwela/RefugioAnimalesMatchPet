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

    // 1. Contar SOLO las solicitudes finalizadas que NO se han leído (notificacion_leida = 0)
    $stmtSol = $db->prepare("SELECT COUNT(*) as total FROM solicitudes 
                             WHERE id_usuario = :id_u 
                             AND estado_solicitud != 'Pendiente' 
                             AND notificacion_leida = 0");
    $stmtSol->execute([':id_u' => $id_u]);
    $resSol = $stmtSol->fetch(PDO::FETCH_ASSOC);
    $solicitudesActualizadas = $resSol ? (int)$resSol['total'] : 0;

    // 2. Historias totales (Esto lo dejamos igual)
    $stmtHist = $db->prepare("SELECT COUNT(*) as total FROM historias_adopcion WHERE id_usuario = :id_u");
    $stmtHist->execute([':id_u' => $id_u]);
    $resHist = $stmtHist->fetch(PDO::FETCH_ASSOC);
    $historiasTotales = $resHist ? (int)$resHist['total'] : 0;

    // 3. Obtener los detalles SOLO de las no leídas
    $stmtDetalles = $db->prepare("SELECT id_solicitud, estado_solicitud FROM solicitudes 
                                  WHERE id_usuario = :id_u 
                                  AND estado_solicitud != 'Pendiente' 
                                  AND notificacion_leida = 0 
                                  ORDER BY id_solicitud DESC LIMIT 10");
    $stmtDetalles->execute([':id_u' => $id_u]);
    $listaSolicitudes = $stmtDetalles->fetchAll(PDO::FETCH_ASSOC);

    $notificacionesArray = [];
    foreach($listaSolicitudes as $sol) {
        $notificacionesArray[] = [
            'id' => $sol['id_solicitud'],
            'tipo' => 'solicitud',
            'mensaje' => "Tu solicitud #" . $sol['id_solicitud'] . " ha sido " . $sol['estado_solicitud'] . "."
        ];
    }

    echo json_encode([
        "status" => "success",
        "alertas" => [
            "solicitudes_finalizadas" => $solicitudesActualizadas,
            "historias_publicadas" => $historiasTotales
        ],
        "notificaciones_detalle" => $notificacionesArray,
        "mensaje_global" => "Tienes " . ($solicitudesActualizadas) . " actualizaciones."
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error SQL: " . $e->getMessage()]);
}
?>