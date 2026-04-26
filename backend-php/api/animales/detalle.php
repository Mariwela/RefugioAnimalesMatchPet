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

if (!isset($_GET['id'])) {
    http_response_code(400);
    echo json_encode(["message" => "ID de animal no proporcionado."]);
    exit;
}

try {
    // Crear la instancia y obtener la conexión
    $database = new Database();
    $db = $database->getConnection();

    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

    if ($id > 0) {
        // Ahora $db ya no es null y puedes usar prepare()
        $query = "SELECT * FROM animales WHERE id_animal = :id";
        $stmt = $db->prepare($query);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        
        $animal = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($animal) {
            // 1. Limpiar foto principal
            $ruta_limpia_principal = str_replace('fotos/', '', $animal['foto_portada']);
            $animal['foto_portada'] = "http://127.0.0.1/refugioAnimalesMatchPet-main/backend-php/public/img/animales/" . $ruta_limpia_principal;



            // 2. Consultar fotos de la galería
            $queryFotos = "SELECT ruta_foto FROM animal_fotos WHERE id_animal = :id AND es_principal = 0";
            $stmtFotos = $db->prepare($queryFotos);
            $stmtFotos->bindParam(':id', $id, PDO::PARAM_INT);
            $stmtFotos->execute();
            $galeria = $stmtFotos->fetchAll(PDO::FETCH_ASSOC);

            // Solo hacemos el foreach si HAY fotos
            if ($galeria) {
                foreach ($galeria as &$foto) {
                    $foto_limpia = str_replace('fotos/', '', $foto['ruta_foto']);
                    $foto['url_completa'] = "http://127.0.0.1/refugioAnimalesMatchPet-main/backend-php/public/img/animales/" . $foto_limpia;
                }
            } else {
                $galeria = []; // Si no hay fotos, enviamos un array vacío en lugar de un error
            }

            // 4. Adjuntamos la galería al objeto animal
            $animal['galeria'] = $galeria;

            echo json_encode(["status" => "success", "data" => $animal]);
        } else {
            echo json_encode(["status" => "error", "message" => "Animal no encontrado"]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "ID no válido"]);
    }

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => $e->getMessage()]);
}