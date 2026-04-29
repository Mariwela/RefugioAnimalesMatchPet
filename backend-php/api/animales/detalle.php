<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';

// 1. Validar ID de entrada de forma limpia
$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

if ($id <= 0) {
    http_response_code(400);
    echo json_encode(["status" => "error", "message" => "ID de animal no válido o no proporcionado."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    // 2. Consultar datos principales del animal
    $query = "SELECT * FROM animales WHERE id_animal = :id";
    $stmt = $db->prepare($query);
    $stmt->bindParam(':id', $id, PDO::PARAM_INT);
    $stmt->execute();
    $animal = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$animal) {
        echo json_encode(["status" => "error", "message" => "Animal no encontrado"]);
        exit;
    }

    // --- CONSTRUCCIÓN DE URL DINÁMICA ---
    $base_url  = (isset($_SERVER['HTTPS']) ? 'https' : 'http') . '://' . $_SERVER['HTTP_HOST'];
    $base_path = str_replace('/api/animales', '', dirname($_SERVER['SCRIPT_NAME']));
    $img_base  = $base_url . $base_path . '/public/img/animales/';

    $animal['foto_portada'] = $img_base . $animal['foto_portada'];

    // 3. Consultar Galería de Fotos
    $queryFotos = "SELECT id_foto, ruta_foto FROM animal_fotos WHERE id_animal = :id AND es_principal = 0";
    $stmtFotos = $db->prepare($queryFotos);
    $stmtFotos->execute([':id' => $id]);
    $galeria = $stmtFotos->fetchAll(PDO::FETCH_ASSOC);

    foreach ($galeria as &$foto) {
        $foto['url_completa'] = $img_base . $foto['ruta_foto'];
    }
    unset($foto); // Rompemos la referencia por seguridad
    $animal['galeria'] = $galeria ? $galeria : [];

    // 4. EXTRA: Consultar Historial de Salud
    $querySalud = "SELECT * FROM salud_historial WHERE id_animal = :id ORDER BY fecha_evento DESC";
    $stmtSalud = $db->prepare($querySalud);
    $stmtSalud->execute([':id' => $id]);
    $animal['historial_salud'] = $stmtSalud->fetchAll(PDO::FETCH_ASSOC);

    // 5. Respuesta Final
    echo json_encode(["status" => "success", "data" => $animal]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Error en el servidor: " . $e->getMessage()]);
}
?>