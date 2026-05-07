<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

// Solo el admin puede hacer esto
requiere_rol('admin');

$data = json_decode(file_get_contents('php://input'));

if (!$data || empty($data->id_solicitud) || empty($data->id_animal)) {
    http_response_code(400);
    echo json_encode(["message" => "Faltan datos: id_solicitud o id_animal."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    // Iniciamos transacción para que se haga todo o nada
    $db->beginTransaction();

    // 1. Aprobar la solicitud actual (Tabla: solicitudes | Columna: estado_solicitud)
    $queryS = "UPDATE solicitudes SET estado_solicitud = 'Aprobada' WHERE id_solicitud = :id_s";
    $stmt1 = $db->prepare($queryS);
    $stmt1->execute([':id_s' => $data->id_solicitud]);

    // 2. Marcar al animal como Adoptado (Tabla: animales | Columna: estado)
    // AQUÍ ESTABA EL ERROR: Usábamos estado_solicitud en lugar de estado
    $queryA = "UPDATE animales SET estado = 'Adoptado' WHERE id_animal = :id_a";
    $stmt2 = $db->prepare($queryA);
    $stmt2->execute([':id_a' => $data->id_animal]);

    // 3. Rechazar automáticamente otras solicitudes pendientes para este mismo animal
    $queryL = "UPDATE solicitudes 
               SET estado_solicitud = 'Rechazada' 
               WHERE id_animal = :id_a 
               AND id_solicitud != :id_s 
               AND estado_solicitud = 'Pendiente'";
    $stmt3 = $db->prepare($queryL);
    $stmt3->execute([
        ':id_a' => $data->id_animal,
        ':id_s' => $data->id_solicitud
    ]);

    $db->commit();

    echo json_encode([
        "status" => "success", 
        "message" => "¡Adopción procesada con éxito! El animal ahora figura como Adoptado."
    ]);

} catch (Exception $e) {
    if (isset($db) && $db->inTransaction()) {
        $db->rollBack();
    }
    http_response_code(500);
    echo json_encode(["message" => "Error en la base de datos: " . $e->getMessage()]);
}