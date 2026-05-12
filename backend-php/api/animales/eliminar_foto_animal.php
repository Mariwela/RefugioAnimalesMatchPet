<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';
requiere_rol('admin');

$data = json_decode(file_get_contents("php://input"), true);

if (!empty($data['id_foto']) || !empty($data['es_portada'])) {
    try {
        $database = new Database();
        $db = $database->getConnection();

        $ruta_archivo = "";
        $id_animal = $data['id_animal'] ?? null;

        // CASO 1: BORRAR FOTO DE LA GALERÍA (Tabla animal_fotos)
        if (!empty($data['id_foto'])) {
            // 1. Obtener la ruta antes de borrar el registro
            $stmt = $db->prepare("SELECT ruta_foto FROM animal_fotos WHERE id_foto = :id");
            $stmt->execute([':id' => $data['id_foto']]);
            $ruta_archivo = $stmt->fetchColumn();

            if ($ruta_archivo) {
                // 2. Borrar de la BD
                $del = $db->prepare("DELETE FROM animal_fotos WHERE id_foto = :id");
                $del->execute([':id' => $data['id_foto']]);
            }
        } 
        
        // CASO 2: "BORRAR" PORTADA (Tabla animales)
        // Nota: Normalmente la portada no se borra, se sustituye, 
        // pero si quieres quitarla, le ponemos una por defecto.
        else if (!empty($data['es_portada']) && $id_animal) {
            $stmt = $db->prepare("SELECT foto_portada FROM animales WHERE id_animal = :id");
            $stmt->execute([':id' => $id_animal]);
            $ruta_archivo = $stmt->fetchColumn();

            $upd = $db->prepare("UPDATE animales SET foto_portada = 'default.png' WHERE id_animal = :id");
            $upd->execute([':id' => $id_animal]);
        }

        // 3. ELIMINAR ARCHIVO FÍSICO
        if ($ruta_archivo && $ruta_archivo !== 'default.png') {
            $ruta_completa = dirname(__FILE__, 3) . '/public/img/animales/' . $ruta_archivo;
            if (file_exists($ruta_completa)) {
                unlink($ruta_completa);
            }
        }

        echo json_encode(["status" => "success", "message" => "Foto eliminada correctamente"]);

    } catch (Exception $e) {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => $e->getMessage()]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "No se proporcionó ID de foto"]);
}