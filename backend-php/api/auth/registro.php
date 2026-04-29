<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';

$json = file_get_contents('php://input');
$data = json_decode($json);

// 1. Validar campos obligatorios
if (!$data || empty($data->nombre_completo) || empty($data->email) || empty($data->password)) {
    http_response_code(400);
    echo json_encode(["message" => "Faltan datos obligatorios: nombre_completo, email y password son requeridos."]);
    exit;
}

// 2. Validar formato de email
if (!filter_var($data->email, FILTER_VALIDATE_EMAIL)) {
    http_response_code(400);
    echo json_encode(["message" => "El formato del email no es válido."]);
    exit;
}

// 3. Validar longitud mínima de contraseña
if (strlen($data->password) < 6) {
    http_response_code(400);
    echo json_encode(["message" => "La contraseña debe tener al menos 6 caracteres."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    // 4. Comprobar si el email ya existe
    $stmtCheck = $db->prepare("SELECT id_usuario FROM usuarios WHERE email = :email LIMIT 1");
    $stmtCheck->bindParam(':email', $data->email);
    $stmtCheck->execute();

    if ($stmtCheck->rowCount() > 0) {
        http_response_code(409); // Conflict
        echo json_encode(["message" => "Ya existe una cuenta con ese email."]);
        exit;
    }

    // 5. Insertar nuevo usuario
    // El rol por defecto es 'adoptante', igual que define la tabla en creacion_db.sql
    $query = "INSERT INTO usuarios 
        (nombre_completo, email, password, rol, telefono, poblacion, provincia, 
         pref_especie, pref_energia, pref_vivienda, bio_experiencia) 
        VALUES 
        (:nombre_completo, :email, :password, 'adoptante', :telefono, :poblacion, :provincia,
         :pref_especie, :pref_energia, :pref_vivienda, :bio_experiencia)";

    $stmt = $db->prepare($query);

    $stmt->execute([
        ':nombre_completo' => trim($data->nombre_completo),
        ':email'           => strtolower(trim($data->email)),
        ':password'        => password_hash($data->password, PASSWORD_DEFAULT),
        ':telefono'        => $data->telefono        ?? null,
        ':poblacion'       => $data->poblacion       ?? null,
        ':provincia'       => $data->provincia       ?? null,
        ':pref_especie'    => $data->pref_especie    ?? 'Cualquiera',
        ':pref_energia'    => $data->pref_energia    ?? null,
        ':pref_vivienda'   => $data->pref_vivienda   ?? null,
        ':bio_experiencia' => $data->bio_experiencia ?? null,
    ]);

    $nuevo_id = $db->lastInsertId();

    // 6. Devolvemos el usuario recién creado (sin password), 
    //    con la misma estructura que devuelve login.php
    http_response_code(201);
    echo json_encode([
        "message" => "Registro exitoso",
        "user" => [
            "id_usuario"     => (int)$nuevo_id,
            "nombre_completo"=> trim($data->nombre_completo),
            "email"          => strtolower(trim($data->email)),
            "rol"            => "adoptante"
        ]
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error en el servidor: " . $e->getMessage()]);
}
?>