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

try {
    // 1. Instanciamos la clase de conexión
    $database = new Database();
    
    // 2. OBTENEMOS la conexión (Esto es lo que te falta o está fallando)
    $db = $database->getConnection();

    // 3. Verificamos que no sea null
    if ($db == null) {
        echo json_encode(["message" => "Error: No se pudo conectar a la base de datos."]);
        exit;
    }

    // 4. Usamos la variable $db (asegúrate de que el nombre coincida)
    $query = "SELECT * FROM animales";
    $stmt = $db->prepare($query); // <--- Aquí es donde daba el error si $db era null
    $stmt->execute();

    $animales = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // 5. Limpieza de rutas (opcional, pero recomendado para que se vean las fotos)
    foreach ($animales as &$animal) {
        $ruta_limpia = str_replace('fotos/', '', $animal['foto_portada']);
        $animal['foto_portada'] = "http://127.0.0.1/refugioAnimalesMatchPet-main/backend-php/public/img/animales/" . $ruta_limpia;
    }

    echo json_encode(["status" => "success", "data" => $animales]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => $e->getMessage()]);
}
?>