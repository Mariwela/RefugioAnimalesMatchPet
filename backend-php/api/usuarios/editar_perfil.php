<?php
// ================================================
// api/usuarios/editar_perfil.php
// PUT — cualquier usuario autenticado
// Solo puede editar SU PROPIO perfil.
// Campos editables por el usuario:
//   nombre_completo, telefono, direccion, poblacion,
//   provincia, codigo_postal, pref_especie,
//   pref_energia, pref_vivienda, bio_experiencia,
//   estado_acogida
//
// Campos NO editables desde aquí (por seguridad):
//   email, password, rol, dni_nie
// ================================================

require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = autenticar();

$data = json_decode(file_get_contents('php://input'), true);

if (empty($data)) {
    http_response_code(400);
    echo json_encode(["message" => "No se recibieron datos para actualizar."]);
    exit;
}

// Campos que el usuario puede modificar
// Cualquier otro campo que venga en el JSON lo ignoramos
$campos_permitidos = [
    'nombre_completo',
    'telefono',
    'direccion',
    'poblacion',
    'provincia',
    'codigo_postal',
    'pref_especie',
    'pref_energia',
    'pref_vivienda',
    'bio_experiencia',
    'estado_acogida'
];

// Construimos el UPDATE solo con los campos permitidos que llegaron
$fields = [];
$params = [':id' => $payload['id_usuario']];

foreach ($campos_permitidos as $campo) {
    if (array_key_exists($campo, $data)) {
        $fields[] = "$campo = :$campo";
        $params[":$campo"] = $data[$campo];
    }
}

if (empty($fields)) {
    http_response_code(400);
    echo json_encode(["message" => "No hay campos válidos para actualizar."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    $sql = "UPDATE usuarios SET " . implode(', ', $fields) . " WHERE id_usuario = :id";
    $stmt = $db->prepare($sql);
    $stmt->execute($params);

    // Devolvemos el perfil actualizado (misma lógica que perfil.php)
    $stmtPerfil = $db->prepare("SELECT 
        id_usuario, nombre_completo, email, telefono,
        direccion, poblacion, provincia, codigo_postal,
        rol, pref_especie, pref_energia, pref_vivienda,
        bio_experiencia, estado_acogida, fecha_registro
        FROM usuarios WHERE id_usuario = :id");

    $stmtPerfil->execute([':id' => $payload['id_usuario']]);
    $usuario = $stmtPerfil->fetch(PDO::FETCH_ASSOC);

    echo json_encode([
        "status"  => "success",
        "message" => "Perfil actualizado correctamente.",
        "data"    => $usuario
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error en el servidor: " . $e->getMessage()]);
}