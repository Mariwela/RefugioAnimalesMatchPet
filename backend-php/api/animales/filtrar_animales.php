<?php
require_once '../../config/cors.php'; // <--- ESTO DEBE ESTAR ARRIBA
require_once '../../config/config.php';
require_once '../../config/conexion.php';

try {
    $database = new Database();
    $db = $database->getConnection();

    // 1. Iniciamos la consulta base (Por defecto, solo mostramos los 'Disponible')
    // Usamos 1=1 para poder concatenar los 'AND' dinámicamente sin que rompa la sintaxis SQL
    $query = "SELECT id_animal, nombre, especie, raza, sexo, tamano, foto_portada 
              FROM animales 
              WHERE estado = 'Disponible'";
    
    $params = []; // Aquí guardaremos los valores seguros para evitar Inyección SQL

    // 2. Filtro por Texto (busca en nombre o raza)
    if (isset($_GET['texto']) && !empty(trim($_GET['texto']))) {
        $query .= " AND (nombre LIKE :texto OR raza LIKE :texto)";
        $params[':texto'] = '%' . trim($_GET['texto']) . '%';
    }

    // 3. Filtro por Especie (Perro, Gato, Exótico, Otro)
    if (isset($_GET['especie']) && !empty(trim($_GET['especie']))) {
        $query .= " AND especie = :especie";
        $params[':especie'] = trim($_GET['especie']);
    }

    // 4. Filtro por Tamaño (Pequeño, Mediano, Grande, Gigante)
    if (isset($_GET['tamano']) && !empty(trim($_GET['tamano']))) {
        $query .= " AND tamano = :tamano";
        $params[':tamano'] = trim($_GET['tamano']);
    }

    // 5. Filtro por Sexo (Macho, Hembra, Desconocido)
    if (isset($_GET['sexo']) && !empty(trim($_GET['sexo']))) {
        $query .= " AND sexo = :sexo";
        $params[':sexo'] = trim($_GET['sexo']);
    }

    // 6. Ordenamos para que salgan los más recientes primero
    $query .= " ORDER BY fecha_entrada DESC";

    // 7. Preparamos y ejecutamos
    $stmt = $db->prepare($query);
    $stmt->execute($params);
    $animales = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // 8. Devolvemos la respuesta limpia a Angular
    echo json_encode([
        "status" => "success",
        "data" => $animales
    ]);

} catch (Exception $e) {
    http_response_code(500);
    // Sin alertas raras, solo un JSON estructurado con el error si la base de datos falla
    echo json_encode([
        "status" => "error", 
        "message" => "Error interno al filtrar: " . $e->getMessage()
    ]);
}
?>