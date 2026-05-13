<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = requiere_rol('admin', 'vet');

$id_animal = isset($_GET['id_animal']) ? (int)$_GET['id_animal'] : 0;

if ($id_animal <= 0) {
    http_response_code(400);
    echo json_encode(["message" => "ID de animal no válido o no proporcionado."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    $stmtCheck = $db->prepare("SELECT id_animal FROM animales WHERE id_animal = :id");
    $stmtCheck->execute([':id' => $id_animal]);

    if ($stmtCheck->rowCount() === 0) {
        http_response_code(404);
        echo json_encode(["message" => "Animal no encontrado."]);
        exit;
    }

    $query = "SELECT 
                sh.id_libro,
                sh.id_animal,
                sh.id_usuario,
                sh.evento,
                sh.titulo,
                sh.detalles,
                sh.fecha_evento,
                sh.estado,
                u.nombre_completo AS veterinario
              FROM salud_historial sh
              LEFT JOIN usuarios u ON sh.id_usuario = u.id_usuario
              WHERE sh.id_animal = :id
              ORDER BY sh.fecha_evento DESC";

    $stmt = $db->prepare($query);
    $stmt->execute([':id' => $id_animal]);

    $historial = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        "status"  => "success",
        "total"   => count($historial),
        "data"    => $historial
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error en el servidor: " . $e->getMessage()]);
}