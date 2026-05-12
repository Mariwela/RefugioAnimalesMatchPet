<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';
requiere_rol('admin');

// Iniciamos la respuesta con un mensaje más descriptivo para debug
$response = ["status" => "error", "message" => "No se recibió una petición válida o el archivo es demasiado grande"];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    // Capturamos datos y nos aseguramos de que sean válidos
    $id_animal = isset($_POST['id_animal']) ? (int)$_POST['id_animal'] : null;
    $es_portada = isset($_POST['es_portada']) ? (int)$_POST['es_portada'] : 0;

    if (isset($_FILES['foto']) && $id_animal) {
        try {
            $database = new Database();
            $db = $database->getConnection();

            // 1. Obtener nombre para la carpeta
            $stmtNombre = $db->prepare("SELECT nombre FROM animales WHERE id_animal = :id");
            $stmtNombre->execute([':id' => $id_animal]);
            $nombre_animal = $stmtNombre->fetchColumn();

            if (!$nombre_animal) {
                echo json_encode(["status" => "error", "message" => "El ID de animal $id_animal no existe en la BD"]);
                exit;
            }

       // Reemplaza la línea de iconv y nombre_carpeta por esta:
            $nombre_carpeta = strtolower(str_replace(' ', '_', $nombre_animal));      
            $base_path = dirname(__FILE__, 3) . '/public/img/animales/';
            $ruta_subcarpeta = $base_path . $nombre_carpeta . '/';

            // Crear carpeta si no existe (Seguridad extra)
            if (!file_exists($ruta_subcarpeta)) {
                if (!mkdir($ruta_subcarpeta, 0777, true)) {
                    echo json_encode(["status" => "error", "message" => "No se pudo crear la carpeta: $ruta_subcarpeta"]);
                    exit;
                }
            }

            // 2. Definir nombre del archivo
            $file = $_FILES['foto'];
            $ext = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
            
            if ($es_portada === 1) {
                $nuevo_nombre = "1." . $ext;
            } else {
                $files_existentes = glob($ruta_subcarpeta . "*.{jpg,jpeg,png,webp}", GLOB_BRACE);
                $max_num = 0;
                foreach ($files_existentes as $f) {
                    $num = (int)pathinfo($f, PATHINFO_FILENAME);
                    if ($num > $max_num) $max_num = $num;
                }
                $siguiente_numero = ($max_num < 1) ? 2 : $max_num + 1;
                $nuevo_nombre = $siguiente_numero . "." . $ext;
            }

            $ruta_final_servidor = $ruta_subcarpeta . $nuevo_nombre;
            $ruta_bd = $nombre_carpeta . "/" . $nuevo_nombre;

            if (move_uploaded_file($file['tmp_name'], $ruta_final_servidor)) {

                $db->beginTransaction();

                if ($es_portada === 1) {
                    $stmt1 = $db->prepare("UPDATE animales SET foto_portada = :ruta WHERE id_animal = :id");
                    $stmt1->execute([':ruta' => $ruta_bd, ':id' => $id_animal]);

                    $db->prepare("DELETE FROM animal_fotos WHERE id_animal = :id AND es_principal = 1")->execute([':id' => $id_animal]);
                    $stmt2 = $db->prepare("INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal) VALUES (:id, :ruta, 1)");
                    $stmt2->execute([':ruta' => $ruta_bd, ':id' => $id_animal]);
                } else {
                    $stmt3 = $db->prepare("INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal) VALUES (:id, :ruta, 0)");
                    $stmt3->execute([':ruta' => $ruta_bd, ':id' => $id_animal]);
                }

                $db->commit();
                $response = ["status" => "success", "message" => "Foto $nuevo_nombre subida", "ruta" => $ruta_bd];

            } else {
                $response["message"] = "move_uploaded_file falló. Ruta destino: $ruta_final_servidor. Verifica permisos.";
            }

        } catch (Exception $e) {
            if (isset($db) && $db->inTransaction()) $db->rollBack();
            $response["message"] = "Error de BD: " . $e->getMessage();
        }
    } else {
        $response["message"] = "Faltan parámetros. id_animal=" . ($id_animal ?? 'null') . ", foto=" . (isset($_FILES['foto']) ? 'sí' : 'no');
    }
}

echo json_encode($response);