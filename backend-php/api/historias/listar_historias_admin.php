<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

autenticar();
$payload = autenticar();
if ($payload['rol'] !== 'admin') {
    http_response_code(403);
    echo json_encode(["status" => "error", "message" => "Acceso denegado."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    // Recibe filtro opcional: ?estado=Pendiente | Aprobada | Rechazada | (vacío = todas)
    $estado = $_GET['estado'] ?? null;

    $query = "SELECT h.*, a.nombre AS nombre_animal, u.nombre_completo AS nombre_usuario 
              FROM historias_adopcion h
              JOIN animales a ON h.id_animal = a.id_animal
              LEFT JOIN usuarios u ON h.id_usuario = u.id_usuario";

    if ($estado && in_array($estado, ['Pendiente', 'Aprobada', 'Rechazada'])) {
        $query .= " WHERE h.estado = :estado";
    }

    $query .= " ORDER BY h.fecha DESC";
    $stmt = $db->prepare($query);

    if ($estado && in_array($estado, ['Pendiente', 'Aprobada', 'Rechazada'])) {
        $stmt->execute([':estado' => $estado]);
    } else {
        $stmt->execute();
    }
    
    $historias = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    echo json_encode(["status" => "success", "data" => $historias]);

    } catch (Exception $e) {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => $e->getMessage()]);
    }