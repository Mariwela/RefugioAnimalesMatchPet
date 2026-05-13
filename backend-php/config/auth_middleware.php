<?php

require_once __DIR__ . '/jwt.php';

function autenticar(): array {

    $token = jwt_extraer_header();

    if (!$token) {
        http_response_code(401);
        echo json_encode(["message" => "Token no proporcionado. Debes iniciar sesión."]);
        exit;
    }

    $payload = jwt_verificar($token);

    if (!$payload) {
        http_response_code(401);
        echo json_encode(["message" => "Token inválido o expirado. Vuelve a iniciar sesión."]);
        exit;
    }

    $GLOBALS['jwt_payload'] = $payload;

    return $payload;
}

function requiere_rol(string ...$roles): array {

    $payload = autenticar();

    if (!in_array($payload['rol'], $roles)) {
        http_response_code(403);
        echo json_encode([
            "message" => "No tienes permiso para realizar esta acción.",
            "tu_rol"  => $payload['rol'],
            "roles_permitidos" => $roles
        ]);
        exit;
    }

    return $payload;
}