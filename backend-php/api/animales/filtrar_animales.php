<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';

try {
    $database = new Database();
    $db = $database->getConnection();

    $pagina = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
    $por_pagina = 20;
    $inicio = ($pagina - 1) * $por_pagina;

    $query = "SELECT id_animal, nombre, especie, raza, sexo, tamano, nivel_energia, foto_portada 
              FROM animales 
              WHERE estado = 'Disponible'";
    
    $params = [];

    if (isset($_GET['texto']) && !empty(trim($_GET['texto']))) {
        $query .= " AND (nombre LIKE :texto OR raza LIKE :texto)";
        $params[':texto'] = '%' . trim($_GET['texto']) . '%';
    }

    if (isset($_GET['especie']) && !empty(trim($_GET['especie']))) {
        $query .= " AND especie = :especie";
        $params[':especie'] = trim($_GET['especie']);
    }

    if (isset($_GET['tamano']) && !empty(trim($_GET['tamano']))) {
        $query .= " AND tamano = :tamano";
        $params[':tamano'] = trim($_GET['tamano']);
    }

    if (isset($_GET['sexo']) && !empty(trim($_GET['sexo']))) {
        $query .= " AND sexo = :sexo";
        $params[':sexo'] = trim($_GET['sexo']);
    }

    if (isset($_GET['nivel_energia']) && !empty(trim($_GET['nivel_energia']))) {
        $query .= " AND nivel_energia = :nivel_energia";
        $params[':nivel_energia'] = trim($_GET['nivel_energia']);
    }

    $query .= " ORDER BY fecha_entrada DESC LIMIT :inicio, :por_pagina";

    $stmt = $db->prepare($query);

    foreach ($params as $key => $val) {
        $stmt->bindValue($key, $val);
    }

    $stmt->bindValue(':inicio', $inicio, PDO::PARAM_INT);
    $stmt->bindValue(':por_pagina', $por_pagina, PDO::PARAM_INT);

    $stmt->execute();
    $animales = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        "status" => "success",
        "pagina" => $pagina,
        "data" => $animales
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        "status" => "error", 
        "message" => "Error interno al filtrar: " . $e->getMessage()
    ]);
}
?>