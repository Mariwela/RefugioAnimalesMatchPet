<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';
requiere_rol('admin');

$data = json_decode(file_get_contents("php://input"), true);

if (!empty($data['id_animal'])) {
    try {
        $database = new Database();
        $db = $database->getConnection();

        // Obtener el nombre del animal para localizar su carpeta física
        $stmtNombre = $db->prepare("SELECT nombre FROM animales WHERE id_animal = :id");
        $stmtNombre->execute([':id' => $data['id_animal']]);
        $animal = $stmtNombre->fetch(PDO::FETCH_ASSOC);

        if ($animal) {
            $nombre_carpeta = strtolower(str_replace(' ', '_', $animal['nombre']));
            $ruta_carpeta = __DIR__ . "/../../public/img/animales/" . $nombre_carpeta;
            $query = "DELETE FROM animales WHERE id_animal = :id";
            $stmt = $db->prepare($query);
            
            if ($stmt->execute([':id' => $data['id_animal']])) {

                if (is_dir($ruta_carpeta)) {
                    $files = glob($ruta_carpeta . '/*'); 
                    foreach($files as $file) {
                        if(is_file($file)) unlink($file); 
                    }
                    rmdir($ruta_carpeta);
                }

                echo json_encode(["status" => "success", "message" => "Animal y sus fotos eliminadas"]);
            }
        } else {
            echo json_encode(["status" => "error", "message" => "Animal no encontrado"]);
        }
    } catch (Exception $e) {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => $e->getMessage()]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "ID no proporcionado"]);
}
?>