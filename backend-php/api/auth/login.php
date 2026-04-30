<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/jwt.php';

$json = file_get_contents('php://input');
$data = json_decode($json);

if (!$data || empty($data->email) || empty($data->password)) {
    http_response_code(400);
    echo json_encode(["message" => "Datos incompletos o formato JSON inválido."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    // Añadimos 'rol' a la SELECT (en el orsiginal ya estaba, sin cambios)
    $query = "SELECT id_usuario, nombre_completo, email, password, rol FROM usuarios WHERE email = :email LIMIT 1";
    $stmt = $db->prepare($query);
    $stmt->bindParam(':email', $data->email);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if (password_verify($data->password, $user['password'])) {
            unset($user['password']);

            // --- NUEVO: Generamos el token JWT ---
            $token = jwt_generar([
                'id_usuario' => $user['id_usuario'],
                'email'      => $user['email'],
                'rol'        => $user['rol']
            ]);
            // -------------------------------------

            http_response_code(200);
            echo json_encode([
                "message" => "Login exitoso",
                "token"   => $token,   // <-- Angular lo guarda en localStorage
                "user"    => $user
            ]);

        } else {
            http_response_code(401);
            echo json_encode(["message" => "Contraseña incorrecta."]);
        }
    } else {
        http_response_code(404);
        echo json_encode(["message" => "El usuario no existe."]);
    }

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error en el servidor: " . $e->getMessage()]);
}