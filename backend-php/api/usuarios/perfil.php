<?php
// ================================================
// api/usuarios/perfil.php
// GET — cualquier usuario autenticado
// Devuelve el perfil del usuario que hace la petición
// (lo sabemos por el token, no hace falta pasar ID)
// ================================================

require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

$payload = autenticar();

try {
    $database = new Database();
    $db = $database->getConnection();

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
                estado_acogida,
                fecha_registro
              FROM usuarios
              WHERE id_usuario = :id";

    $stmt = $db->prepare($query);
    $stmt->execute([':id' => $payload['id_usuario']]);

    $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$usuario) {
        http_response_code(404);
        echo json_encode(["message" => "Usuario no encontrado."]);
        exit;
    }

    echo json_encode([
        "status" => "success",
        "data"   => $usuario
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error en el servidor: " . $e->getMessage()]);
}