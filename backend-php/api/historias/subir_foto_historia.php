<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';

autenticar();

// Validar que se han recibido todos los datos necesarios por FormData
if (empty($_POST['id_historia']) || empty($_POST['nombre_final_archivo']) || empty($_FILES['foto'])) {
    http_response_code(400);
    echo json_encode(["message" => "Faltan datos obligatorios: id_historia, nombre_final_archivo o el archivo de imagen."]);
    exit;
}

try {
    $database = new Database();
    $db = $database->getConnection();

    $id_historia = (int)$_POST['id_historia'];
    $nombre_base = $_POST['nombre_final_archivo'];

    // 1. Validar errores de subida de PHP (tamaño excedido, etc.)
    if ($_FILES['foto']['error'] !== UPLOAD_ERR_OK) {
        throw new Exception("Error en la subida del archivo. Código: " . $_FILES['foto']['error']);
    }

    // 2. Procesar el nombre y la ruta
    $extension = pathinfo($_FILES['foto']['name'], PATHINFO_EXTENSION);
    $nombre_completo = $nombre_base . "." . $extension;

    $ruta_fisica = $directorio_destino . $nombre_completo;
    $ruta_base_datos = $nombre_completo;

    // 3. Intentar mover el archivo temporal a la carpeta pública
    if (move_uploaded_file($_FILES['foto']['tmp_name'], $ruta_fisica)) {
        // 4. Si el archivo se movió con éxito, actualizamos la Base de Datos
        $query = "UPDATE historias_adopcion SET imagen_url = :img WHERE id_historia = :id";
        $stmt = $db->prepare($query);
        
        $resultado = $stmt->execute([
            ':img' => $ruta_base_datos,
            ':id'  => $id_historia
        ]);

        if ($resultado && $stmt->rowCount() > 0) {
            echo json_encode([
                "status" => "success",
                "message" => "Imagen subida y registro actualizado correctamente.",
                "url" => $ruta_base_datos
            ]);
            exit;
        } else {
            // Si no se actualizó ninguna fila (ID no encontrado)
            // Borrar el archivo físico que acabamos de subir para no dejar basura
            unlink($ruta_fisica);
            http_response_code(404);
            echo json_encode(["message" => "No se encontró el registro de la historia para vincular la imagen."]);
            exit;
        }

    } else {
        http_response_code(500);
        echo json_encode(["message" => "Error crítico: El servidor no pudo guardar el archivo físico en la carpeta historias."]);
        exit;
    }

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error de Base de Datos: " . $e->getMessage()]);
    exit;
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error del servidor: " . $e->getMessage()]);
    exit;
}