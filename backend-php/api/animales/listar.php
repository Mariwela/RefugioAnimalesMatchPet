<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';

try {
    $database = new Database();
    $db = $database->getConnection();

    // 1. Parámetros de paginación
    $pagina = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
    $por_pagina = 20;
    $inicio = ($pagina - 1) * $por_pagina;

    // 2. Consulta
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

    // --- BLOQUE DE URL DINÁMICA ---
    // Detecta http/https y el host (ej. localhost o 127.0.0.1)
    $protocol = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') ? "https" : "http";
    $base_url = $protocol . "://" . $_SERVER['HTTP_HOST'];
    
    // Calcula la ruta del proyecto dinámicamente
    // Esto quita "/api/animales/listar.php" de la ruta actual para llegar a la raíz
    $project_path = str_replace('/api/animales', '', dirname($_SERVER['SCRIPT_NAME']));
    $img_base = $base_url . $project_path . '/public/img/animales/';
    // ------------------------------

    // 3. Formatear la URL de la imagen para Angular
    foreach ($animales as &$animal) {
        if (!empty($animal['foto_portada']) && !filter_var($animal['foto_portada'], FILTER_VALIDATE_URL)) {
            $animal['foto_portada'] = $img_base . $animal['foto_portada'];
        }
    }
    unset($animal); // Romper la referencia

    echo json_encode([
        "status" => "success",
        "pagina" => $pagina,
        "total_resultados" => count($animales),
        "data" => $animales
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Error al obtener animales: " . $e->getMessage()]);
}
?>