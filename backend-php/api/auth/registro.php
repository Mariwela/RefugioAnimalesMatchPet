<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';

$json = file_get_contents('php://input');
$data = json_decode($json);

if (!$data || empty($data->nombre_completo) || empty($data->email) || empty($data->password)) {
    http_response_code(400);
    echo json_encode(["message" => "Nombre, email y contraseña son obligatorios."]);
    exit;
}

if (!filter_var($data->email, FILTER_VALIDATE_EMAIL)) {
    http_response_code(400);
    echo json_encode(["message" => "El formato del email no es válido."]);
    exit;
}

if (strlen($data->password) < 6) {
    http_response_code(400);
    echo json_encode(["message" => "La contraseña debe tener al menos 6 caracteres."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();
    $stmtCheck = $db->prepare("SELECT id_usuario FROM usuarios WHERE email = :email LIMIT 1");
    $stmtCheck->bindParam(':email', $data->email);
    $stmtCheck->execute();

    if ($stmtCheck->rowCount() > 0) {
        http_response_code(409);
        echo json_encode(["message" => "Ya existe una cuenta con ese email."]);
        exit;
    }

    $avatar = $data->avatar ?? 'default_avatar.png';

    $query = "INSERT INTO usuarios (nombre_completo, email, password, telefono)
        VALUES (:nombre_completo, :email, :password, :telefono)";
    $stmt = $db->prepare($query);
    $stmt->execute([
        ':nombre_completo' => trim($data->nombre_completo),
        ':email'           => strtolower(trim($data->email)),
        ':password'        => password_hash($data->password, PASSWORD_BCRYPT),
        ':telefono'        => $data->telefono ?? null,
    ]);

    $nuevo_id = $db->lastInsertId();

    http_response_code(201);
    echo json_encode([
        "message" => "Registro exitoso",
        "user" => [
            "id_usuario"     => (int)$nuevo_id,
            "nombre_completo"=> trim($data->nombre_completo),
            "email"          => strtolower(trim($data->email)),
            "rol"            => $data->rol ?? 'colaborador',
            "avatar"         => $avatar
        ]
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error en el servidor: " . $e->getMessage()]);
}
?>