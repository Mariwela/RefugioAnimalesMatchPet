<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = autenticar();

try {
    $database = new Database();
    $db = $database->getConnection();

    // 🔥 LA MAGIA AQUÍ: Si viene un ID en la URL lo usamos, si no, usamos el del token 🔥
 $id_a_buscar = (isset($_GET['id']) && !empty($_GET['id'])) ? intval($_GET['id']) : $payload['id_usuario'];

    $query = "SELECT 
                id_usuario,
                nombre_completo,
                dni_nie,
                fecha_nacimiento,
                email,
                telefono,
                direccion,
                poblacion,
                provincia,
                codigo_postal,
                rol,
                pref_especie,
                pref_energia,
                pref_vivienda,
                bio_experiencia,
                disponibilidad_acogida,
                disponibilidad_voluntario,
                area_interes,
                horario_voluntario,
                comentarios_voluntario,
                avatar,
                fecha_registro
              FROM usuarios
              WHERE id_usuario = :id";

    $stmt = $db->prepare($query);
    // Ejecutamos la consulta con el ID que determinamos arriba
    $stmt->execute([':id' => $id_a_buscar]);

    $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$usuario) {
        http_response_code(404);
        echo json_encode(["status" => "error", "message" => "Usuario no encontrado."]);
        exit;
    }

    echo json_encode([
        "status" => "success",
        "data"   => $usuario
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Error en el servidor: " . $e->getMessage()]);
}
?>