<?php
require_once '../../config/cors.php'; // <--- ESTO DEBE ESTAR ARRIBA
require_once '../../config/config.php';
require_once '../../config/conexion.php';

try {
    $database = new Database();
    $db = $database->getConnection();

    // 👉 NUEVO: 1. Calculamos los datos de la paginación
    $pagina = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
    $por_pagina = 20;
    $inicio = ($pagina - 1) * $por_pagina;

    // 2. Iniciamos la consulta base
    $query = "SELECT id_animal, nombre, especie, raza, sexo, tamano, foto_portada 
              FROM animales 
              WHERE estado = 'Disponible'";
    
    $params = []; // Aquí guardaremos los valores seguros

    // 3. Filtro por Texto
    if (isset($_GET['texto']) && !empty(trim($_GET['texto']))) {
        $query .= " AND (nombre LIKE :texto OR raza LIKE :texto)";
        $params[':texto'] = '%' . trim($_GET['texto']) . '%';
    }

    // 4. Filtro por Especie
    if (isset($_GET['especie']) && !empty(trim($_GET['especie']))) {
        $query .= " AND especie = :especie";
        $params[':especie'] = trim($_GET['especie']);
    }

    // 5. Filtro por Tamaño
    if (isset($_GET['tamano']) && !empty(trim($_GET['tamano']))) {
        $query .= " AND tamano = :tamano";
        $params[':tamano'] = trim($_GET['tamano']);
    }

    // 6. Filtro por Sexo
    if (isset($_GET['sexo']) && !empty(trim($_GET['sexo']))) {
        $query .= " AND sexo = :sexo";
        $params[':sexo'] = trim($_GET['sexo']);
    }

    // 👉 NUEVO: 7. Ordenamos Y aplicamos el límite para sacar solo 20
    $query .= " ORDER BY fecha_entrada DESC LIMIT :inicio, :por_pagina";

    // 8. Preparamos
    $stmt = $db->prepare($query);

    // 👉 NUEVO: Bindeamos los parámetros de filtros (si hay alguno)
    foreach ($params as $key => $val) {
        $stmt->bindValue($key, $val); // bindValue asigna el valor directo
    }

    // 👉 NUEVO: Bindeamos obligatoriamente inicio y por_pagina como números ENTEROS
    $stmt->bindValue(':inicio', $inicio, PDO::PARAM_INT);
    $stmt->bindValue(':por_pagina', $por_pagina, PDO::PARAM_INT);

    // Ejecutamos (ahora lo hacemos sin enviarle $params dentro de execute)
    $stmt->execute();
    $animales = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // 9. Devolvemos la respuesta limpia a Angular
    echo json_encode([
        "status" => "success",
        "pagina" => $pagina, // Devolvemos la página actual para tener la referencia
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