<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';

try {
    $database = new Database();
    $db = $database->getConnection();

    // 1. Recibimos la página desde Angular (por URL via GET)
    $pagina = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
    $por_pagina = 20;
    $inicio = ($pagina - 1) * $por_pagina;

    // 2. Recibimos los filtros (por URL via GET)
    $texto = isset($_GET['texto']) ? $_GET['texto'] : '';
    $especie = isset($_GET['especie']) ? $_GET['especie'] : '';
    $tamano = isset($_GET['tamano']) ? $_GET['tamano'] : '';
    $sexo = isset($_GET['sexo']) ? $_GET['sexo'] : '';

    // 3. Consulta base
    $query = "SELECT id_animal, nombre, especie, raza, sexo, tamano, foto_portada, estado 
              FROM animales 
              WHERE estado = 'Disponible'";

    $parametros = [];

    // 4. Construimos las condiciones dinámicamente
    if (!empty($texto)) {
        $query .= " AND (nombre LIKE :texto OR raza LIKE :texto)";
        $parametros[':texto'] = "%" . $texto . "%";
    }
    if (!empty($especie)) {
        $query .= " AND especie = :especie";
        $parametros[':especie'] = $especie;
    }
    if (!empty($tamano)) {
        $query .= " AND tamano = :tamano";
        $parametros[':tamano'] = $tamano;
    }
    if (!empty($sexo)) {
        $query .= " AND sexo = :sexo";
        $parametros[':sexo'] = $sexo;
    }

    // 5. Añadimos el ORDEN y la PAGINACIÓN al final
    $query .= " ORDER BY fecha_entrada DESC LIMIT :inicio, :por_pagina";

    $stmt = $db->prepare($query);

    // Bindeamos los filtros
    foreach ($parametros as $key => &$val) {
        $stmt->bindParam($key, $val);
    }

    // Bindeamos los parámetros del LIMIT como enteros (FUNDAMENTAL)
    $stmt->bindParam(':inicio', $inicio, PDO::PARAM_INT);
    $stmt->bindParam(':por_pagina', $por_pagina, PDO::PARAM_INT);

    $stmt->execute();
    $animales = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // --- BLOQUE DE URL DINÁMICA ---
    $protocol = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') ? "https" : "http";
    $base_url = $protocol . "://" . $_SERVER['HTTP_HOST'];
    $project_path = str_replace('/api/animales', '', dirname($_SERVER['SCRIPT_NAME']));
    $img_base = $base_url . $project_path . '/public/img/animales/';

    foreach ($animales as &$animal) {
        if (!empty($animal['foto_portada']) && !filter_var($animal['foto_portada'], FILTER_VALIDATE_URL)) {
            $animal['foto_portada'] = $img_base . $animal['foto_portada'];
        }
    }
    unset($animal);

    echo json_encode([
        "status" => "success",
        "pagina" => $pagina,
        "total_resultados" => count($animales),
        "data" => $animales
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Error al filtrar: " . $e->getMessage()]);
}
?>