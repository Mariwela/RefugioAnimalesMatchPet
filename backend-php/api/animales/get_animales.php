<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';

try {
    $database = new Database();
    $db = $database->getConnection();

    if ($db == null) {
        echo json_encode(["status" => "error", "message" => "Error: No se pudo conectar a la base de datos."]);
        exit;
    }

    $query = "SELECT * FROM animales";
    $stmt = $db->prepare($query);
    $stmt->execute();

    $animales = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $protocol = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') ? "https" : "http";
    $base_url = $protocol . "://" . $_SERVER['HTTP_HOST'];
    $project_path = str_replace('/api/animales', '', dirname($_SERVER['SCRIPT_NAME']));
    $img_base = $base_url . $project_path . '/public/img/animales/';

    foreach ($animales as &$animal) {
        if (!empty($animal['foto_portada'])) {
            $animal['foto_portada'] = $img_base . $animal['foto_portada'];
        }
    }
    unset($animal); 

    echo json_encode(["status" => "success", "data" => $animales]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Error en el servidor: " . $e->getMessage()]);
}
?>