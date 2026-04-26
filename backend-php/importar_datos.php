<?php
require_once 'config/config.php';
require_once 'config/conexion.php';

$database = new Database();
$db = $database->getConnection();

set_time_limit(300); 

try {
    $rutaArchivo = 'database/datos_iniciales.sql';

    if (!file_exists($rutaArchivo)) {
        die("❌ El archivo $rutaArchivo no existe.");
    }

    $sql = file_get_contents($rutaArchivo);

    echo "⏳ Iniciando carga de datos...<br>";

    $db->exec($sql);

    echo "✅ ¡Éxito! Los +3000 registros han sido insertados.";

} catch (PDOException $e) {
    echo "❌ Error al importar: " . $e->getMessage();
}