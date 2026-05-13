<?php
require_once '../../config/cors.php';
require_once '../../config/config.php';
require_once '../../config/conexion.php';

$database = new Database();
$conn = $database->getConnection();

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['error' => 'Método no permitido']);
    exit;
}

$data = json_decode(file_get_contents('php://input'), true);

if (!$data) {
    http_response_code(400);
    echo json_encode(['error' => 'Datos inválidos']);
    exit;
}

$especie      = $data['especie']      ?? null;
$pesos        = $data['pesos']        ?? [];
$preferencias = $data['preferencias'] ?? [];

$peso_energia    = isset($pesos['nivel_energia'])   ? (int)$pesos['nivel_energia']   : 3;
$peso_pisos      = isset($pesos['apto_pisos'])      ? (int)$pesos['apto_pisos']      : 3;
$peso_ninos      = isset($pesos['sociable_ninos'])  ? (int)$pesos['sociable_ninos']  : 3;
$peso_perros     = isset($pesos['sociable_perros']) ? (int)$pesos['sociable_perros'] : 3;
$peso_gatos      = isset($pesos['sociable_gatos'])  ? (int)$pesos['sociable_gatos']  : 3;
$peso_medicacion = isset($pesos['medicacion'])      ? (int)$pesos['medicacion']      : 3;
$peso_experiencia= isset($pesos['experiencia'])     ? (int)$pesos['experiencia']     : 3;
$peso_paciencia  = isset($pesos['paciencia'])       ? (int)$pesos['paciencia']       : 3;

$pref_energia    = $preferencias['nivel_energia']    ?? null;
$pref_pisos      = $preferencias['apto_pisos']       ?? null;
$pref_ninos      = $preferencias['sociable_ninos']   ?? null;
$pref_perros     = $preferencias['sociable_perros']  ?? null;
$pref_gatos      = $preferencias['sociable_gatos']   ?? null;
$pref_medicacion = $preferencias['acepta_medicacion'] ?? null;
$pref_experiencia= $preferencias['tiene_experiencia'] ?? null; 
$pref_paciencia  = $preferencias['tiene_paciencia']   ?? null;  

$where_especie = '';
$params        = [];

if ($especie) {
    $where_especie = " AND especie = ?";
    $params[]      = $especie;
}

$sql = "SELECT id_animal, nombre, especie, raza, sexo, fecha_nacimiento,
               tamano, nivel_energia, apto_pisos, sociable_ninos,
               sociable_perros, sociable_gatos, enfermedad_cronica,
               esterilizado, descripcion, foto_portada,
               es_para_principiantes, nivel_paciencia, aviso_importante
        FROM animales
        WHERE estado = 'Disponible'$where_especie";

$stmt = $conn->prepare($sql);
$stmt->execute($params);
$animales = $stmt->fetchAll();

$max_puntos = (
    $peso_energia + $peso_pisos + $peso_ninos + $peso_perros + $peso_gatos +
    $peso_medicacion + $peso_experiencia + $peso_paciencia
) * 5;

$scored = [];

foreach ($animales as $animal) {

    $puntos = 0;

    if ($pref_energia !== null) {
        if ($animal['nivel_energia'] === $pref_energia) {
            $puntos += $peso_energia * 5;
        } elseif (
            ($pref_energia === 'Alta'  && $animal['nivel_energia'] === 'Media') ||
            ($pref_energia === 'Baja'  && $animal['nivel_energia'] === 'Media') ||
            ($pref_energia === 'Media' && $animal['nivel_energia'] !== 'Media')
        ) {
            $puntos += $peso_energia * 2;
        }
    } else {
        $puntos += $peso_energia * 2; 
    }

    if ($pref_pisos !== null) {
        if ((bool)$animal['apto_pisos'] === (bool)$pref_pisos) {
            $puntos += $peso_pisos * 5;
        }
    } else {
        $puntos += $peso_pisos * 2;
    }

    if ($pref_ninos !== null) {
        if ((bool)$animal['sociable_ninos'] === (bool)$pref_ninos) {
            $puntos += $peso_ninos * 5;
        }
    } else {
        $puntos += $peso_ninos * 2;
    }

    if ($pref_perros === true) {
        if ($animal['sociable_perros'] === null) {
            $puntos += $peso_perros * 1;
        } elseif ((bool)$animal['sociable_perros'] === true) {
            $puntos += $peso_perros * 5;
        }
    } else {
        $puntos += $peso_perros * 2;
    }

    if ($pref_gatos === true) {
        if ($animal['sociable_gatos'] === null) {
            $puntos += $peso_gatos * 1;
        } elseif ((bool)$animal['sociable_gatos'] === true) {
            $puntos += $peso_gatos * 5;
        }
    } else {
        $puntos += $peso_gatos * 2;
    }

    if ($pref_medicacion !== null) {
        $tiene_medicacion = (bool)$animal['enfermedad_cronica'];
        if (!$tiene_medicacion) {
            $puntos += $peso_medicacion * 5;
        } elseif ($pref_medicacion === true) {
            $puntos += $peso_medicacion * 5;
        }
    } else {
        $puntos += $peso_medicacion * 2;
    }

    if ($pref_experiencia !== null) {
        $para_principiantes = (bool)$animal['es_para_principiantes'];
        if ($para_principiantes) {
            $puntos += $peso_experiencia * 5;
        } elseif ($pref_experiencia === true) {
            $puntos += $peso_experiencia * 5;
        }
    } else {
        $puntos += $peso_experiencia * 2;
    }

    $niveles_paciencia = [null => 0, 'Baja' => 1, 'Alta' => 2, 'Muy Alta' => 3];

    $nivel_animal    = $niveles_paciencia[$animal['nivel_paciencia']] ?? 0;
    $nivel_adoptante = $niveles_paciencia[$pref_paciencia] ?? 0;

    if ($pref_paciencia !== null) {
        if ($nivel_adoptante >= $nivel_animal) {
            $puntos += $peso_paciencia * 5;
        } elseif ($nivel_adoptante === $nivel_animal - 1) {
            $puntos += $peso_paciencia * 2;
        }
    } else {
        $puntos += $peso_paciencia * 2;
    }

    $porcentaje = $max_puntos > 0 ? round(($puntos / $max_puntos) * 100) : 0;

    $fecha_db = $animal['fecha_nacimiento'];
    if (!$fecha_db) {
        $edad_texto = "Edad desconocida";
    } else {
        try {
            $nacimiento = new DateTime($fecha_db);
            $hoy        = new DateTime();
            $diff       = $hoy->diff($nacimiento);
            if ($diff->y >= 1) {
                $edad_texto = $diff->y . ' año' . ($diff->y > 1 ? 's' : '');
            } else {
                $meses = $diff->m + ($diff->y * 12);
                $edad_texto = $meses . ' mes' . ($meses !== 1 ? 'es' : '');
            }
        } catch (Exception $e) {
            $edad_texto = "Edad desconocida";
        }
    }

    $scored[] = [
        'id_animal'        => $animal['id_animal'],
        'nombre'           => $animal['nombre'],
        'especie'          => $animal['especie'],
        'raza'             => $animal['raza'],
        'sexo'             => $animal['sexo'],
        'edad'             => $edad_texto,
        'tamano'           => $animal['tamano'],
        'foto'             => $animal['foto_portada'],
        'descripcion'      => mb_substr($animal['descripcion'], 0, 120) . '...',
        'afinidad'         => $porcentaje,
        'aviso_importante' => $animal['aviso_importante'] ?: null,
        'badges'           => [
            'nivel_energia'       => $animal['nivel_energia'],
            'apto_pisos'          => (bool)$animal['apto_pisos'],
            'sociable_ninos'      => (bool)$animal['sociable_ninos'],
            'esterilizado'        => (bool)$animal['esterilizado'],
            'enfermedad_cronica'  => (bool)$animal['enfermedad_cronica'],
            'es_para_principiantes' => (bool)$animal['es_para_principiantes'],
            'nivel_paciencia'     => $animal['nivel_paciencia'] ?? '',
        ],
    ];
}

usort($scored, fn($a, $b) => $b['afinidad'] - $a['afinidad']);
$top3 = array_slice($scored, 0, 3);

echo json_encode([
    'success'    => true,
    'resultados' => $top3,
]);