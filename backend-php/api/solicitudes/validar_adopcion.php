<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

requiere_rol('admin');

$data = json_decode(file_get_contents('php://input'));

if (!$data || empty($data->id_solicitud) || empty($data->id_animal)) {
    http_response_code(400);
    echo json_encode(["message" => "Faltan datos obligatorios (id_solicitud e id_animal)."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    // Iniciamos una TRANSACCIÓN para asegurar que se cumplen todos los pasos o ninguno
    $db->beginTransaction();

    // 1. Aprobar la solicitud seleccionada
    $queryAprobar = "UPDATE solicitudes SET estado_solicitud = 'Aprobada' WHERE id_solicitud = :id_s";
    $stmt1 = $db->prepare($queryAprobar);
    $stmt1->execute([':id_s' => $data->id_solicitud]);

    // 2. Cambiar el estado del animal a 'Adoptado'
    $queryAnimal = "UPDATE animales SET estado_solicitud = 'Adoptado' WHERE id_animal = :id_a";
    $stmt2 = $db->prepare($queryAnimal);
    $stmt2->execute([':id_a' => $data->id_animal]);

    // 3. (Opcional) Rechazar automáticamente otras solicitudes pendientes para este mismo animal
    $queryLimpiar = "UPDATE solicitudes 
                     SET estado_solicitud = 'Rechazada' 
                     WHERE id_animal = :id_a 
                     AND id_solicitud != :id_s 
                     AND estado_solicitud = 'Pendiente'";
    $stmt3 = $db->prepare($queryLimpiar);
    $stmt3->execute([
        ':id_a' => $data->id_animal,
        ':id_s' => $data->id_solicitud
    ]);

    // Si todo salió bien, confirmamos los cambios en la DB
    $db->commit();

    echo json_encode([
        "status" => "success",
        "message" => "¡Adopción validada! El animal ya no está disponible y se han gestionado las demás solicitudes."
    ]);

} catch (Exception $e) {
    // Si algo falla (ej: se cae la conexión), deshacemos todo para no dejar datos incoherentes
    if ($db->inTransaction()) {
        $db->rollBack();
    }
    http_response_code(500);
    echo json_encode(["message" => "Error al validar adopción: " . $e->getMessage()]);
}