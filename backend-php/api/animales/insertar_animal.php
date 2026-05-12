<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';
requiere_rol('admin');

// 'true' convierte el objeto en array
$data = json_decode(file_get_contents("php://input"), true);

if (!empty($data['nombre']) && !empty($data['especie'])) {
    try {
        $database = new Database();
        $db = $database->getConnection();

        $nombre_animal = $data['nombre'];
        $nombre_carpeta = strtolower(str_replace(' ', '_', $nombre_animal));
        $ruta_portada = "default.jpg"; 

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

        $stmt->bindValue(':nombre', $data['nombre']);
        $stmt->bindValue(':especie', $data['especie']);
        $stmt->bindValue(':raza', $data['raza'] ?? null);
        $stmt->bindValue(':sexo', $data['sexo'] ?? 'Macho');
        $stmt->bindValue(':microchip', $data['microchip'] ?? null);
        $stmt->bindValue(':fecha_nacimiento', $data['fecha_nacimiento'] ?? null);
        $stmt->bindValue(':tamano', $data['tamano'] ?? 'Mediano');
        $stmt->bindValue(':peso', $data['peso'] ?? null);
        $stmt->bindValue(':descripcion', $data['descripcion'] ?? null);
        $stmt->bindValue(':nivel_energia', $data['nivel_energia'] ?? 'Media');
        $stmt->bindValue(':apto_pisos', isset($data['apto_pisos']) && $data['apto_pisos'] ? 1 : 0);
        $stmt->bindValue(':sociable_ninos', isset($data['sociable_ninos']) && $data['sociable_ninos'] ? 1 : 0);
        $stmt->bindValue(':sociable_perros', isset($data['sociable_perros']) && $data['sociable_perros'] ? 1 : 0);
        $stmt->bindValue(':sociable_gatos', isset($data['sociable_gatos']) && $data['sociable_gatos'] ? 1 : 0);
        $stmt->bindValue(':enfermedad_cronica', isset($data['enfermedad_cronica']) && $data['enfermedad_cronica'] ? 1 : 0);
        $stmt->bindValue(':esterilizado', isset($data['esterilizado']) && $data['esterilizado'] ? 1 : 0);
        $stmt->bindValue(':nivel_paciencia', $data['nivel_paciencia'] ?? 'Baja');
        $stmt->bindValue(':es_para_principiantes', isset($data['es_para_principiantes']) && $data['es_para_principiantes'] ? 1 : 0);
        $stmt->bindValue(':aviso_importante', $data['aviso_importante'] ?? null);
        $stmt->bindValue(':estado', $data['estado'] ?? 'Disponible');
        $stmt->bindValue(':foto_portada', $ruta_portada);

        if($stmt->execute()) {
            $nuevo_id = $db->lastInsertId();

            // Crear carpeta física
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