<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = autenticar();

$data = json_decode(file_get_contents('php://input'), true);
$disponibilidad_voluntario = $data['disponibilidad_voluntario'] ?? 'no';
$area_interes = $data['area_interes'] ?? null;
$horario_voluntario = $data['horario_voluntario'] ?? null;
$comentarios_voluntario = $data['comentarios_voluntario'] ?? null;
$pref_especie = $data['pref_especie'] ?? 'Cualquiera';
$bio_experiencia = $data['bio_experiencia'] ?? null;
$disponibilidad_acogida = $data['disponibilidad_acogida'] ?? 'no_disponible';

if (empty($data)) {
    http_response_code(400);
    echo json_encode(["message" => "No se recibieron datos para actualizar."]);
    exit;
}

if (!isset($_SERVER['HTTP_AUTHORIZATION'])) {
    $headers = apache_request_headers();
    if (isset($headers['Authorization'])) {
        $_SERVER['HTTP_AUTHORIZATION'] = $headers['Authorization'];
    }
}

$campos_permitidos = [
    'nombre_completo',
    'dni_nie',
    'fecha_nacimiento',
    'telefono',
    'direccion',
    'poblacion',
    'provincia',
    'codigo_postal',
    'pref_especie',
    'pref_energia',
    'pref_vivienda',
    'bio_experiencia',
    'disponibilidad_acogida',
    'disponibilidad_voluntario',
    'area_interes',
    'horario_voluntario',
    'comentarios_voluntario',
    'avatar'
];

$fields = [];
$params = [':id' => $payload['id_usuario']];

foreach ($campos_permitidos as $campo) {
    if (array_key_exists($campo, $data)) {
        $valor = $data[$campo];
        $params[":$campo"] = ($valor === '' || $valor === 'null') ? null : $valor;
        $fields[] = "$campo = :$campo";
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

    if (isset($data['dni_nie'])) {
        $stmtCheck = $db->prepare("SELECT id_usuario FROM usuarios WHERE dni_nie = :dni AND id_usuario != :id");
        $stmtCheck->execute([
            ':dni' => $data['dni_nie'],
            ':id'  => $payload['id_usuario']
        ]);

        if ($stmtCheck->rowCount() > 0) {
            http_response_code(409);
            echo json_encode(["message" => "El DNI/NIE ya pertenece a otra cuenta."]);
            exit;
        }
    }    

    $sql = "UPDATE usuarios SET " . implode(', ', $fields) . " WHERE id_usuario = :id";
    $stmt = $db->prepare($sql);
    $stmt->execute($params);

    $stmtPerfil = $db->prepare("SELECT 
        id_usuario, nombre_completo, dni_nie, fecha_nacimiento,
        email, telefono, direccion, poblacion, provincia,
        codigo_postal, rol, pref_especie, pref_energia, pref_vivienda,
        bio_experiencia, disponibilidad_acogida, disponibilidad_voluntario,
        area_interes, horario_voluntario, comentarios_voluntario, avatar, fecha_registro
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