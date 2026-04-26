<?php
// 1. Configuración de cabeceras CORS
// IMPORTANTE: Si usas 127.0.0.1 en Angular, aquí debe permitir http://localhost:4200
header("Access-Control-Allow-Origin: http://localhost:4200");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");
header("Access-Control-Allow-Credentials: true");

// 2. RESPUESTA AL PREFLIGHT
// Si el navegador pregunta con OPTIONS, le respondemos 200 OK y cortamos ahí.
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}
?>