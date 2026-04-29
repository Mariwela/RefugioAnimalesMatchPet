<?php
// ================================================
// config/auth_middleware.php
// Protege un endpoint con una sola línea:
//   require_once '../../config/auth_middleware.php';
//
// Opcionalmente restringe por rol:
//   requiere_rol('admin');
//   requiere_rol('admin', 'vet');
// ================================================

require_once __DIR__ . '/jwt.php';

// ------------------------------------------------
// AUTENTICACIÓN — verifica que el token es válido
// Si falla → responde 401 y corta la ejecución
// Si pasa → deja $GLOBALS['jwt_payload'] disponible
// ------------------------------------------------
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

    // Guardamos el payload para que el endpoint pueda usarlo
    // Ej: saber qué usuario está haciendo la petición
    $GLOBALS['jwt_payload'] = $payload;

    return $payload;
}

// ------------------------------------------------
// AUTORIZACIÓN — verifica que el rol está permitido
// Llama a autenticar() internamente, no hace falta
// llamarlos por separado.
//
// Uso: requiere_rol('admin');
//      requiere_rol('admin', 'vet');
// ------------------------------------------------
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