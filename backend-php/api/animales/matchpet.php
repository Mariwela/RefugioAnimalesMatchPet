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

// ─────────────────────────────────────────────
//  PARÁMETROS RECIBIDOS DEL FRONTEND
//  especie        : 'Perro' | 'Gato' | null (cualquiera)
//  pesos          : objeto con las 5 preguntas (1-5)
//    nivel_energia   : importancia del nivel de energía (1-5)
//    apto_pisos      : importancia de que sea apto para piso (1-5)
//    sociable_ninos  : importancia de que sea sociable con niños (1-5)
//    sociable_perros : importancia de que conviva con perros (1-5)
//    sociable_gatos  : importancia de que conviva con gatos (1-5)
//  preferencias   : valores deseados por el usuario
//    nivel_energia   : 'Baja' | 'Media' | 'Alta'
//    apto_pisos      : true | false
//    sociable_ninos  : true | false
//    sociable_perros : true | false
//    sociable_gatos  : true | false
// ─────────────────────────────────────────────

$especie        = $data['especie']      ?? null;     // null = cualquier especie
$pesos          = $data['pesos']        ?? [];
$preferencias   = $data['preferencias'] ?? [];

// Pesos por defecto si no vienen
$peso_energia       = isset($pesos['nivel_energia'])   ? (int)$pesos['nivel_energia']   : 3;
$peso_pisos         = isset($pesos['apto_pisos'])      ? (int)$pesos['apto_pisos']      : 3;
$peso_ninos         = isset($pesos['sociable_ninos'])  ? (int)$pesos['sociable_ninos']  : 3;
$peso_perros        = isset($pesos['sociable_perros']) ? (int)$pesos['sociable_perros'] : 3;
$peso_gatos         = isset($pesos['sociable_gatos'])  ? (int)$pesos['sociable_gatos']  : 3;

$pref_energia       = $preferencias['nivel_energia']   ?? null;
$pref_pisos         = $preferencias['apto_pisos']      ?? null;
$pref_ninos         = $preferencias['sociable_ninos']  ?? null;
$pref_perros        = $preferencias['sociable_perros'] ?? null;
$pref_gatos         = $preferencias['sociable_gatos']  ?? null;

// Construir WHERE de especie
$where_especie = '';
$params        = [];
$types         = '';

if ($especie) {
    $where_especie = " AND especie = ?";
    $params[]      = $especie;
    $types        .= 's';
}

$sql = "SELECT id_animal, nombre, especie, raza, sexo, fecha_nacimiento,
               tamano, nivel_energia, apto_pisos, sociable_ninos,
               sociable_perros, sociable_gatos, enfermedad_cronica,
               esterilizado, descripcion, foto_portada
        FROM animales
        WHERE estado = 'Disponible'$where_especie";


$stmt = $conn->prepare($sql);

if ($especie) {
    $stmt->execute([$especie]);
} else {
    $stmt->execute();
}

$animales = $stmt->fetchAll();

// ─────────────────────────────────────────────
//  ALGORITMO DE PUNTUACIÓN
//  Puntuación máxima posible = suma de todos los pesos * 5
//  Cada atributo que coincide suma su peso * 5
//  Atributos que no coinciden suman 0
//  Atributos con peso 1 penalizan menos que los de peso 5
// ─────────────────────────────────────────────

$max_puntos = ($peso_energia + $peso_pisos + $peso_ninos + $peso_perros + $peso_gatos) * 5;

$scored = [];

foreach ($animales as $animal) {

    $puntos = 0;

    // --- Nivel de energía ---
    // El usuario indica qué nivel prefiere; si coincide, puntuación máxima para ese peso
    if ($pref_energia !== null) {
        if ($animal['nivel_energia'] === $pref_energia) {
            $puntos += $peso_energia * 5;
        } elseif (
            // Niveles adyacentes (Media ≈ cercana a Alta o Baja): media puntuación
            ($pref_energia === 'Alta'  && $animal['nivel_energia'] === 'Media') ||
            ($pref_energia === 'Baja'  && $animal['nivel_energia'] === 'Media') ||
            ($pref_energia === 'Media' && $animal['nivel_energia'] !== 'Media')
        ) {
            $puntos += $peso_energia * 2;
        }
        // Si es el opuesto extremo (quiere Baja, tiene Alta), suma 0
    } else {
        // Sin preferencia → puntuación neutra (mitad)
        $puntos += $peso_energia * 2;
    }

    // --- Apto para pisos ---
    if ($pref_pisos !== null) {
        if ((bool)$animal['apto_pisos'] === (bool)$pref_pisos) {
            $puntos += $peso_pisos * 5;
        }
        // No coincide → 0 puntos para este atributo
    } else {
        $puntos += $peso_pisos * 2;
    }

    // --- Sociable con niños ---
    if ($pref_ninos !== null) {
        if ((bool)$animal['sociable_ninos'] === (bool)$pref_ninos) {
            $puntos += $peso_ninos * 5;
        }
    } else {
        $puntos += $peso_ninos * 2;
    }

    // --- Sociable con perros ---
    if ($pref_perros === true) {
        // NULL en BD significa "no evaluado" → puntuación neutra si el usuario lo pide
        if ($animal['sociable_perros'] === null) {
            $puntos += $peso_perros * 1; // poca puntuación por falta de info
        } elseif ((bool)$animal['sociable_perros'] === (bool)$pref_perros) {
            $puntos += $peso_perros * 5;
        }
    } else {
        $puntos += $peso_perros * 2;
    }

    // --- Sociable con gatos ---
    if ($pref_gatos === true) {
        if ($animal['sociable_gatos'] === null) {
            $puntos += $peso_gatos * 1;
        } elseif ((bool)$animal['sociable_gatos'] === (bool)$pref_gatos) {
            $puntos += $peso_gatos * 5;
        }
    } else {
        $puntos += $peso_gatos * 2;
    }

    // Calcular porcentaje de afinidad
    $porcentaje = $max_puntos > 0 ? round(($puntos / $max_puntos) * 100) : 0;

    // --- CÁLCULO DE EDAD SEGURO ---
    $fecha_db = $animal['fecha_nacimiento'];
    
    // Si la fecha es nula o vacía, usamos 'hoy' por defecto para evitar el error
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
        'id_animal'   => $animal['id_animal'],
        'nombre'      => $animal['nombre'],
        'especie'     => $animal['especie'],
        'raza'        => $animal['raza'],
        'sexo'        => $animal['sexo'],
        'edad'        => $edad_texto,
        'tamano'      => $animal['tamano'],
        'foto'        => $animal['foto_portada'],
        'descripcion' => mb_substr($animal['descripcion'], 0, 120) . '...',
        'afinidad'    => $porcentaje,
        // Badges para la tarjeta
        'badges'      => [
            'nivel_energia'   => $animal['nivel_energia'],
            'apto_pisos'      => (bool)$animal['apto_pisos'],
            'sociable_ninos'  => (bool)$animal['sociable_ninos'],
            'esterilizado'    => (bool)$animal['esterilizado'],
        ],
    ];
}

// Ordenar por afinidad desc y devolver top 3
usort($scored, fn($a, $b) => $b['afinidad'] - $a['afinidad']);
$top3 = array_slice($scored, 0, 3);

echo json_encode([
    'success'    => true,
    'resultados' => $top3,
]);