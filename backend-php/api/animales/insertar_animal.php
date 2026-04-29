<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';
requiere_rol('admin');

$data = json_decode(file_get_contents("php://input"));

if (!empty($data->nombre) && !empty($data->especie)) {
    try {
        $database = new Database();
        $db = $database->getConnection();

        $nombre_animal = $data->nombre;
        $nombre_carpeta = strtolower(str_replace(' ', '_', $nombre_animal));

        // --- CAMBIO CLAVE AQUÍ ---
        // En lugar de inventar "nombre/1.jpg", ponemos "default.jpg".
        // La ruta real se actualizará cuando uses 'subir_foto_animal.php'.
        $ruta_portada = "default.jpg"; 

        $query = "INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, descripcion, foto_portada) 
                  VALUES (:nombre, :especie, :raza, :sexo, :fecha_nacimiento, :tamano, :descripcion, :foto_portada)";
        
        $stmt = $db->prepare($query);

        $stmt->bindValue(':nombre', $data->nombre);
        $stmt->bindValue(':especie', $data->especie);
        $stmt->bindValue(':raza', $data->raza ?? null);
        $stmt->bindValue(':sexo', $data->sexo ?? null);
        $stmt->bindValue(':fecha_nacimiento', $data->fecha_nacimiento ?? null);
        $stmt->bindValue(':tamano', $data->tamano ?? null);
        $stmt->bindValue(':descripcion', $data->descripcion ?? null);
        $stmt->bindValue(':foto_portada', $ruta_portada);

        if($stmt->execute()) {
            $nuevo_id = $db->lastInsertId();

            // Crear carpeta física (aunque esté vacía, ya la tenemos lista)
            $dir = "../../public/img/animales/" . $nombre_carpeta;
            if (!file_exists($dir)) {
                mkdir($dir, 0777, true);
            }

            // URL Dinámica para que Angular sepa qué mostrar (la default)
            $protocol = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') ? "https" : "http";
            $base_url = $protocol . "://" . $_SERVER['HTTP_HOST'];
            $project_path = str_replace('/api/animales', '', dirname($_SERVER['SCRIPT_NAME']));
            
            // Si es default.jpg, la ruta es directa, si no, es dentro de la carpeta
            $img_path = $base_url . $project_path . '/public/img/animales/' . $ruta_portada;

            echo json_encode([
                "status" => "success", 
                "message" => "Animal creado con imagen por defecto", 
                "id_animal" => $nuevo_id,
                "url_completa" => $img_path
            ]);
        } else {
            echo json_encode(["status" => "error", "message" => "No se pudo insertar el registro."]);
        }

    } catch (Exception $e) {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => $e->getMessage()]);
    }
} else {
    http_response_code(400);
    echo json_encode(["status" => "error", "message" => "Faltan datos obligatorios."]);
}
?>