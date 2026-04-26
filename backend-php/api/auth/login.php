<?php
// 1. Configuración de cabeceras CORS
// IMPORTANTE: Si usas 127.0.0.1 en Angular, aquí debe permitir http://localhost:4200
header("Access-Control-Allow-Origin: http://localhost:4200");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");
header("Access-Control-Allow-Credentials: true");

// 2. RESPUESTA AL PREFLIGHT (La clave del error)
// Si el navegador pregunta con OPTIONS, le respondemos 200 OK y cortamos ahí.
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}

require_once '../../config/config.php';
require_once '../../config/conexion.php';

// 3. LEER LOS DATOS UNA SOLA VEZ
$json = file_get_contents('php://input');
$data = json_decode($json);

// 4. Validar datos
if (!$data || empty($data->email) || empty($data->password)) {
    http_response_code(400);
    echo json_encode(["message" => "Datos incompletos o formato JSON inválido."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    $query = "SELECT id_usuario, nombre_completo, email, password, rol FROM usuarios WHERE email = :email LIMIT 1";
    $stmt = $db->prepare($query);
    $stmt->bindParam(':email', $data->email);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if (password_verify($data->password, $user['password'])) {
            unset($user['password']);
            http_response_code(200);
            echo json_encode([
                "message" => "Login exitoso",
                "user" => $user
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