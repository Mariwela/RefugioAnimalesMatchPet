<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';
requiere_rol('admin');

$nombre = $_POST['nombre'] ?? null;
$especie = $_POST['especie'] ?? null;

if (!empty($nombre) && !empty($especie)) {
    try {
        $database = new Database();
        $db = $database->getConnection();

        $nombre_carpeta = strtolower(str_replace(' ', '_', $nombre));
        $ruta_portada = "default.jpg";
        $microchip = (!empty($_POST['microchip'])) ? trim($_POST['microchip']) : null;

        $query = "INSERT INTO animales (
                    nombre, especie, raza, sexo, microchip, fecha_nacimiento, 
                    tamano, peso, descripcion, nivel_energia, apto_pisos, 
                    sociable_ninos, sociable_perros, sociable_gatos, 
                    enfermedad_cronica, esterilizado, nivel_paciencia, 
                    es_para_principiantes, aviso_importante, estado, foto_portada
                  ) VALUES (
                    :nombre, :especie, :raza, :sexo, :microchip, :fecha_nacimiento, 
                    :tamano, :peso, :descripcion, :nivel_energia, :apto_pisos, 
                    :sociable_ninos, :sociable_perros, :sociable_gatos, 
                    :enfermedad_cronica, :esterilizado, :nivel_paciencia, 
                    :es_para_principiantes, :aviso_importante, :estado, :foto_portada
                  )";

        $stmt = $db->prepare($query);

        $stmt->bindValue(':nombre', $nombre);
        $stmt->bindValue(':especie', $especie);
        $stmt->bindValue(':raza', $_POST['raza'] ?? null);
        $stmt->bindValue(':sexo', $_POST['sexo'] ?? 'Macho');
        $stmt->bindValue(':microchip', $microchip, $microchip === null ? PDO::PARAM_NULL : PDO::PARAM_STR);
        $stmt->bindValue(':fecha_nacimiento', $_POST['fecha_nacimiento'] ?? null);
        $stmt->bindValue(':tamano', $_POST['tamano'] ?? 'Mediano');
        $stmt->bindValue(':peso', $_POST['peso'] ?? null);
        $stmt->bindValue(':descripcion', $_POST['descripcion'] ?? null);
        $stmt->bindValue(':nivel_energia', $_POST['nivel_energia'] ?? 'Media');
        
        // Los booleanos llegan como '1' o '0' desde tu Angular
        $stmt->bindValue(':apto_pisos', $_POST['apto_pisos'] == '1' ? 1 : 0);
        $stmt->bindValue(':sociable_ninos', $_POST['sociable_ninos'] == '1' ? 1 : 0);
        $stmt->bindValue(':sociable_perros', $_POST['sociable_perros'] == '1' ? 1 : 0);
        $stmt->bindValue(':sociable_gatos', $_POST['sociable_gatos'] == '1' ? 1 : 0);
        $stmt->bindValue(':enfermedad_cronica', $_POST['enfermedad_cronica'] == '1' ? 1 : 0);
        $stmt->bindValue(':esterilizado', $_POST['esterilizado'] == '1' ? 1 : 0);
        $stmt->bindValue(':nivel_paciencia', $_POST['nivel_paciencia'] ?? 'Baja');
        $stmt->bindValue(':es_para_principiantes', $_POST['es_para_principiantes'] == '1' ? 1 : 0);
        
        $stmt->bindValue(':aviso_importante', $_POST['aviso_importante'] ?? null);
        $stmt->bindValue(':estado', $_POST['estado'] ?? 'Disponible');
        $stmt->bindValue(':foto_portada', $ruta_portada);

        if($stmt->execute()) {
            $nuevo_id = $db->lastInsertId();

            // Crear carpeta física
            $dir = dirname(__FILE__, 3) . '/public/img/animales/' . $nombre_carpeta;
            if (!file_exists($dir)) {
                mkdir($dir, 0777, true);
            }

            // URL Dinámica para que Angular sepa qué mostrar (la default)
            $protocol = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') ? "https" : "http";
            $base_url = $protocol . "://" . $_SERVER['HTTP_HOST'];
            
            // Si es default.jpg, la ruta es directa, si no, es dentro de la carpeta
            $img_path = $base_url . '/RefugioAnimalesMatchPet/public/img/animales/' . $ruta_portada;
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