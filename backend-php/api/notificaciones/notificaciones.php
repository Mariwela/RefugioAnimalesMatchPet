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

    // 1. Contar solicitudes que ya NO están pendientes (Aprobadas o Rechazadas)
    // Usamos 'estado_solicitud' que es el nombre real en tu tabla 'solicitudes'
    $stmtSol = $db->prepare("SELECT COUNT(*) as total FROM solicitudes 
                             WHERE id_usuario = :id_u AND estado_solicitud != 'Pendiente'");
    $stmtSol->execute([':id_u' => $id_u]);
    $resSol = $stmtSol->fetch(PDO::FETCH_ASSOC);
    $solicitudesActualizadas = $resSol ? (int)$resSol['total'] : 0;

    // 2. Historias (En tu SQL no hay columna 'estado', así que solo contamos cuántas tiene)
    $stmtHist = $db->prepare("SELECT COUNT(*) as total FROM historias_adopcion WHERE id_usuario = :id_u");
    $stmtHist->execute([':id_u' => $id_u]);
    $resHist = $stmtHist->fetch(PDO::FETCH_ASSOC);
    $historiasTotales = $resHist ? (int)$resHist['total'] : 0;

    echo json_encode([
        "status" => "success",
        "alertas" => [
            "solicitudes_finalizadas" => $solicitudesActualizadas,
            "historias_publicadas" => $historiasTotales
        ],
        "mensaje_global" => "Tienes " . ($solicitudesActualizadas) . " actualizaciones en tus solicitudes."
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error SQL: " . $e->getMessage()]);
}