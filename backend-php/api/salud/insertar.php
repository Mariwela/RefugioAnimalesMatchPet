<?php
// ================================================
// api/salud/insertar.php
// POST — solo admin y vet
// Body JSON:
// {
//   "id_animal": 1,
//   "evento": "Vacuna",          (Vacuna|Cirugía|Revisión|Tratamiento|Desparasitación)
//   "titulo": "Vacuna antirrábica",
//   "detalles": "Dosis anual",   (opcional)
//   "fecha_evento": "2024-05-01",
//   "estado": "Completado"       (opcional, default Completado)
// }
// ================================================

require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = requiere_rol('admin', 'vet');

$data = json_decode(file_get_contents('php://input'));

// Validar campos obligatorios
if (empty($data->id_animal) || empty($data->evento) || empty($data->titulo) || empty($data->fecha_evento)) {
    http_response_code(400);
    echo json_encode(["message" => "Faltan datos obligatorios: id_animal, evento, titulo y fecha_evento."]);
    exit;
}

// Validar que el evento es uno de los permitidos por el ENUM
$eventos_validos = ['Vacuna', 'Cirugía', 'Revisión', 'Tratamiento', 'Desparasitación'];
if (!in_array($data->evento, $eventos_validos)) {
    http_response_code(400);
    echo json_encode([
        "message"        => "Evento no válido.",
        "eventos_validos" => $eventos_validos
    ]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    // Verificamos que el animal existe
    $stmtCheck = $db->prepare("SELECT id_animal FROM animales WHERE id_animal = :id");
    $stmtCheck->execute([':id' => (int)$data->id_animal]);

    if ($stmtCheck->rowCount() === 0) {
        http_response_code(404);
        echo json_encode(["message" => "Animal no encontrado."]);
        exit;
    }

    $query = "INSERT INTO salud_historial 
                (id_animal, id_usuario, evento, titulo, detalles, fecha_evento, estado)
              VALUES 
                (:id_animal, :id_usuario, :evento, :titulo, :detalles, :fecha_evento, :estado)";

    $stmt = $db->prepare($query);
    $stmt->execute([
        ':id_animal'   => (int)$data->id_animal,
        ':id_usuario'  => $payload['id_usuario'], // el vet/admin que lo registra
        ':evento'      => $data->evento,
        ':titulo'      => $data->titulo,
        ':detalles'    => $data->detalles    ?? null,
        ':fecha_evento'=> $data->fecha_evento,
        ':estado'      => $data->estado      ?? 'Completado',
    ]);

    http_response_code(201);
    echo json_encode([
        "status"  => "success",
        "message" => "Evento de salud registrado correctamente.",
        "id_libro" => (int)$db->lastInsertId()
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error en el servidor: " . $e->getMessage()]);
}