<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';

try {
    $database = new Database();
    $db = $database->getConnection();

    // 1. Parámetros de paginación (opcionales)
    // Si Angular no envía nada, por defecto página 1 y 20 animales
    $pagina = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
    $por_pagina = 20;
    $inicio = ($pagina - 1) * $por_pagina;

    // 2. Consulta para obtener animales y sus fotos principales
    // Usamos LIMIT para no saturar la memoria
    $query = "SELECT id_animal, nombre, especie, raza, sexo, tamano, foto_portada, estado 
              FROM animales 
              WHERE estado = 'Disponible' 
              ORDER BY fecha_entrada DESC 
              LIMIT :inicio, :por_pagina";

    $stmt = $db->prepare($query);
    $stmt->bindParam(':inicio', $inicio, PDO::PARAM_INT);
    $stmt->bindParam(':por_pagina', $por_pagina, PDO::PARAM_INT);
    $stmt->execute();

    $animales = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // 3. Formatear la URL de la imagen para Angular
    foreach ($animales as &$animal) {
        // Si la foto no es una URL externa, construimos la ruta con la carpeta del animal
        if (!filter_var($animal['foto_portada'], FILTER_VALIDATE_URL)) {
            
            // 1. Quitamos "fotos/" del texto que viene de la BD
            // Esto transforma "fotos/zafiro/1.jpg" en "zafiro/1.jpg"
            $ruta_limpia = str_replace('fotos/', '', $animal['foto_portada']);
            
            // 2. Construimos la URL final apuntando a tu carpeta de imágenes
            $animal['foto_portada'] = "http://127.0.0.1/refugioAnimalesMatchPet-main/backend-php/public/img/animales/" . $ruta_limpia;
        }
    }

    echo json_encode([
        "status" => "success",
        "pagina" => $pagina,
        "total_resultados" => count($animales),
        "data" => $animales
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "Error al obtener animales: " . $e->getMessage()]);
}