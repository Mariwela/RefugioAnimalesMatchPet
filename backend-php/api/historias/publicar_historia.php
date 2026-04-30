<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = autenticar();
$data = json_decode(file_get_contents('php://input'));

if (!$data || empty($data->id_animal) || empty($data->titulo) || empty($data->contenido)) {
    http_response_code(400);
    echo json_encode(["message" => "Faltan campos obligatorios."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    // 1. Consultamos el nombre del animal UNA SOLA VEZ
    $stmtAnimal = $db->prepare("SELECT nombre FROM animales WHERE id_animal = :id_a");
    $stmtAnimal->execute([':id_a' => $data->id_animal]);
    $animal = $stmtAnimal->fetch(PDO::FETCH_ASSOC);
    
    if (!$animal) {
        http_response_code(404);
        echo json_encode(["message" => "El animal no existe."]);
        exit;
    }

    // 2. Preparamos el nombre que tendrá la foto en el futuro
    $nombre_animal_limpio = strtolower(str_replace(' ', '_', $animal['nombre']));
    $nombre_sugerido = "historia_" . $nombre_animal_limpio . "_" . time(); // Sin extensión aún

    // 3. Insertamos con la imagen por defecto
    $query = "INSERT INTO historias_adopcion 
                (id_usuario, id_animal, titulo, contenido, imagen_url, estado) 
              VALUES 
                (:id_u, :id_a, :titulo, :contenido, 'public/historias/default.jpg', 'Pendiente')";
    
    $stmt = $db->prepare($query);
    $stmt->execute([
        ':id_u'      => $payload['id_usuario'],
        ':id_a'      => (int)$data->id_animal,
        ':titulo'    => $data->titulo,
        ':contenido' => $data->contenido
    ]);

    // 4. Devolvemos el ID y el NOMBRE a Angular
    echo json_encode([
        "status" => "success", 
        "id_historia" => $db->lastInsertId(),
        "nombre_final_archivo" => $nombre_sugerido // <--- Angular guardará esto
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error: " . $e->getMessage()]);
}