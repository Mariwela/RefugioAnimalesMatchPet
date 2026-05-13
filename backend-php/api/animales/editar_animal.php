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

        $id = $data['id_animal'];
        unset($data['id_animal']); 

        if (!empty($data['nombre'])) {
            $base_path = dirname(__FILE__, 3) . '/public/img/animales/';
            $data['foto_portada'] = $base_path . "/1.jpg";
        } else {
            unset($data['foto_portada']);
        }

        $fields = [];
        $params = [':id' => $id];

        foreach ($data as $key => $value) {
            $fields[] = "$key = :$key";
            $params[":$key"] = $value;
        }

        if (count($fields) > 0) {
            $sql = "UPDATE animales SET " . implode(', ', $fields) . " WHERE id_animal = :id";
            $stmt = $db->prepare($sql);
            $stmt->execute($params);
            $protocol = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') ? "https" : "http";
            $base_url = $protocol . "://" . $_SERVER['HTTP_HOST'];
            $project_path = str_replace('/api/animales', '', dirname($_SERVER['SCRIPT_NAME']));
            $img_base = $base_url . $project_path . '/public/img/animales/';

            echo json_encode([
                "status" => "success", 
                "message" => "Datos actualizados correctamente",
                "foto_actualizada" => isset($data['foto_portada']) ? $img_base . $data['foto_portada'] : null
            ]);
            
        } else {
            echo json_encode(["status" => "error", "message" => "No hay campos para actualizar"]);
        }

    } catch (Exception $e) {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => "Error de servidor: " . $e->getMessage()]);
    }
} else {
    http_response_code(400);
    echo json_encode(["status" => "error", "message" => "ID de animal no proporcionado"]);
}
?>