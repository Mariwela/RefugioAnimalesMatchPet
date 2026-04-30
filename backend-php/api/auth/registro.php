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

    // Comprobar si el email ya existe
    $stmtCheck = $db->prepare("SELECT id_usuario FROM usuarios WHERE email = :email LIMIT 1");
    $stmtCheck->bindParam(':email', $data->email);
    $stmtCheck->execute();

    if ($stmtCheck->rowCount() > 0) {
        http_response_code(409);
        echo json_encode(["message" => "Ya existe una cuenta con ese email."]);
        exit;
    }

    $avatar = $data->avatar ?? 'default_avatar.png';

    $query = "INSERT INTO usuarios 
            (nombre_completo, dni_nie, fecha_nacimiento, email, password, telefono, 
            direccion, poblacion, provincia, codigo_postal, rol, pref_especie, 
            pref_energia, pref_vivienda, bio_experiencia, estado_acogida, avatar) 
            VALUES 
            (:nombre_completo, :dni_nie, :fecha_nacimiento, :email, :password, :telefono, 
            :direccion, :poblacion, :provincia, :codigo_postal, :rol, :pref_especie, 
            :pref_energia, :pref_vivienda, :bio_experiencia, :estado_acogida, :avatar) 
    ";

    $stmt = $db->prepare($query);

    // Mapeo de datos 
    $stmt->execute([
        ':nombre_completo'  => trim($data->nombre_completo),
        ':dni_nie'          => $data->dni_nie ?? null,
        ':fecha_nacimiento' => $data->fecha_nacimiento ?? null,
        ':email'            => strtolower(trim($data->email)),
        ':password'         => password_hash($data->password, PASSWORD_BCRYPT),
        ':telefono'         => $data->telefono ?? null,
        ':direccion'        => strip_tags($data->direccion) ?? null,
        ':poblacion'        => $data->poblacion ?? null,
        ':provincia'        => $data->provincia ?? null,
        ':codigo_postal'    => $data->codigo_postal ?? null,
        ':rol'              => $data->rol ?? 'adoptante',
        ':pref_especie'     => $data->pref_especie ?? 'Cualquiera',
        ':pref_energia'     => $data->pref_energia ?? null,
        ':pref_vivienda'    => $data->pref_vivienda ?? null,
        ':bio_experiencia'  => strip_tags($data->bio_experiencia) ?? null,
        ':estado_acogida'   => $data->estado_acogida ?? 'no_disponible',
        ':avatar'          => $avatar
    ]);

    $nuevo_id = $db->lastInsertId();

    // Devolvemos el usuario recién creado (sin password)
    http_response_code(201);
    echo json_encode([
        "message" => "Registro exitoso",
        "user" => [
            "id_usuario"     => (int)$nuevo_id,
            "nombre_completo"=> trim($data->nombre_completo),
            "email"          => strtolower(trim($data->email)),
            "rol"            => $data->rol ?? 'adoptante',
            "avatar"         => $avatar
        ]
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error en el servidor: " . $e->getMessage()]);
}
?>