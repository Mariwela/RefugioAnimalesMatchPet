<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';
require_once '../../config/auth_middleware.php';
 
$payload = autenticar();
 
if ($payload['rol'] !== 'admin') {
    http_response_code(403);
    echo json_encode(["status" => "error", "message" => "Acceso denegado. Solo administradores."]);
    exit;
}
 
try {
    $database = new Database();
    $db = $database->getConnection();
 
    // Validamos el grupo contra una lista blanca para poder interpolarlo en el SQL sin riesgo
    $gruposValidos = ['todos', 'adoptante', 'voluntario', 'acogida'];
    $grupo = in_array($_GET['grupo'] ?? '', $gruposValidos) ? $_GET['grupo'] : 'todos';
 
    $busqueda = isset($_GET['busqueda']) ? trim($_GET['busqueda']) : '';
 
    // Fragmento SQL del filtro de grupo (interpolado directamente al ser valor validado)
    $filtroGrupo = match($grupo) {
        'adoptante'  => "AND (
                            u.pref_especie IS NOT NULL
                            OR u.pref_vivienda IS NOT NULL
                            OR (u.bio_experiencia IS NOT NULL AND u.bio_experiencia != '')
                        )",
        'voluntario' => "AND u.disponibilidad_voluntario = 'si'
                         AND (
                            (u.area_interes IS NOT NULL AND u.area_interes != '')
                            OR (u.horario_voluntario IS NOT NULL AND u.horario_voluntario != '')
                            OR (u.comentarios_voluntario IS NOT NULL AND u.comentarios_voluntario != '')
                         )",
        'acogida'    => "AND u.disponibilidad_acogida IN ('disponible', 'ocupado', 'pausa')
                         AND (
                            u.pref_especie IS NOT NULL
                            OR u.pref_vivienda IS NOT NULL
                            OR (u.bio_experiencia IS NOT NULL AND u.bio_experiencia != '')
                         )",
        default      => '' // todos: sin filtro extra
    };
 
    // Filtro de busqueda con parametros enlazados (estos si son input del usuario)
    $filtroBusqueda = '';
    $params = [];
    if ($busqueda !== '') {
        $filtroBusqueda = "AND (u.nombre_completo LIKE :busqueda1 OR u.email LIKE :busqueda2)";
        $params[':busqueda1'] = "%$busqueda%";
        $params[':busqueda2'] = "%$busqueda%";
    }
 
    $query = "SELECT
                u.id_usuario,
                u.nombre_completo,
                u.email,
                u.telefono,
                u.poblacion,
                u.provincia,
                u.rol,
                u.avatar,
                u.fecha_registro,
                u.disponibilidad_voluntario,
                u.disponibilidad_acogida,
                u.pref_especie,
                u.pref_vivienda,
                u.pref_energia,
                u.bio_experiencia,
                u.area_interes,
                u.horario_voluntario,
                u.comentarios_voluntario,
                (
                    u.pref_especie IS NOT NULL
                    OR u.pref_vivienda IS NOT NULL
                    OR (u.bio_experiencia IS NOT NULL AND u.bio_experiencia != '')
                ) AS es_adoptante,
                (
                    u.disponibilidad_voluntario = 'si'
                    AND (
                        (u.area_interes IS NOT NULL AND u.area_interes != '')
                        OR (u.horario_voluntario IS NOT NULL AND u.horario_voluntario != '')
                        OR (u.comentarios_voluntario IS NOT NULL AND u.comentarios_voluntario != '')
                    )
                ) AS es_voluntario,
                (
                    u.disponibilidad_acogida IN ('disponible', 'ocupado', 'pausa')
                    AND (
                        u.pref_especie IS NOT NULL
                        OR u.pref_vivienda IS NOT NULL
                        OR (u.bio_experiencia IS NOT NULL AND u.bio_experiencia != '')
                    )
                ) AS es_acogida
              FROM usuarios u WHERE u.rol = 'colaborador'
              $filtroGrupo
              $filtroBusqueda
              ORDER BY u.nombre_completo ASC";
 
    $stmt = $db->prepare($query);
    $stmt->execute($params);
    $usuarios = $stmt->fetchAll(PDO::FETCH_ASSOC);
 
    foreach ($usuarios as &$u) {
        $u['es_adoptante']  = (bool)$u['es_adoptante'];
        $u['es_voluntario'] = (bool)$u['es_voluntario'];
        $u['es_acogida']    = (bool)$u['es_acogida'];
    }
    unset($u);
 
    $totalesQuery = "SELECT
        COUNT(*) AS total,
        SUM(
            pref_especie IS NOT NULL
            OR pref_vivienda IS NOT NULL
            OR (bio_experiencia IS NOT NULL AND bio_experiencia != '')
        ) AS adoptantes,
        SUM(
            disponibilidad_voluntario = 'si'
            AND (
                (area_interes IS NOT NULL AND area_interes != '')
                OR (horario_voluntario IS NOT NULL AND horario_voluntario != '')
                OR (comentarios_voluntario IS NOT NULL AND comentarios_voluntario != '')
            )
        ) AS voluntarios,
        SUM(
            disponibilidad_acogida IN ('disponible', 'ocupado', 'pausa')
            AND (
                pref_especie IS NOT NULL
                OR pref_vivienda IS NOT NULL
                OR (bio_experiencia IS NOT NULL AND bio_experiencia != '')
            )
        ) AS acogida
    FROM usuarios
    WHERE rol = 'colaborador'";
 
    $totalesStmt = $db->prepare($totalesQuery);
    $totalesStmt->execute();
    $totales = $totalesStmt->fetch(PDO::FETCH_ASSOC);
 
    echo json_encode([
        "status"   => "success",
        "grupo"    => $grupo,
        "total"    => count($usuarios),
        "totales"  => $totales,
        "usuarios" => $usuarios
    ]);
 
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Error en el servidor: " . $e->getMessage()]);
}
?>