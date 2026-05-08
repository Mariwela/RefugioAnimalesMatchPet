<?php
// 1. Permitimos cualquier origen dinámicamente (localhost:4200 en tu caso)
if (isset($_SERVER['HTTP_ORIGIN'])) {
    header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Max-Age: 86400'); // Cachea la respuesta por 1 día
}

// 2. LA MAGIA DEL PREFLIGHT: Respondemos que sí a todo lo que pida Angular
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD'])) {
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");         
    }
    
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS'])) {
        // Aquí le decimos "Sí, permito los headers exactos que me estás pidiendo"
        header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
    }
    
    // Matamos la ejecución aquí con un 200 OK para que Angular se quede contento
    http_response_code(200);
    exit(0);
}