<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = autenticar();

if (!isset($_FILES['avatar'])) {
    http_response_code(400);
    echo json_encode(["message" => "No se recibió ninguna imagen."]);
    exit;
}

$file = $_FILES['avatar'];
$extensiones_permitidas = ['jpg', 'jpeg', 'png', 'webp'];
$extension = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));

if (!in_array($extension, $extensiones_permitidas)) {
    http_response_code(400);
    echo json_encode(["message" => "Formato no permitido. Usa JPG, PNG o WEBP."]);
    exit;
}

if ($file['size'] > 2 * 1024 * 1024) {
    http_response_code(400);
    echo json_encode(["message" => "La imagen no puede superar 2MB."]);
    exit;
}

$nombre_archivo = 'avatar_' . $payload['id_usuario'] . '_' . time() . '.' . $extension;
$ruta_destino = __DIR__ . '/../../public/avatars/' . $nombre_archivo;

if (!move_uploaded_file($file['tmp_name'], $ruta_destino)) {
    http_response_code(500);
    echo json_encode(["message" => "Error al guardar la imagen."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    $stmt = $db->prepare("UPDATE usuarios SET avatar = :avatar WHERE id_usuario = :id");
    $stmt->execute([
        ':avatar' => $nombre_archivo,
        ':id'     => $payload['id_usuario']
    ]);

    echo json_encode([
        "status"  => "success",
        "message" => "Avatar actualizado correctamente.",
        "avatar"  => $nombre_archivo
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error en el servidor: " . $e->getMessage()]);
}
?>