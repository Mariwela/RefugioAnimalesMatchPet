<?php
// ================================================
// config/jwt.php
// Tres funciones puras. Sin composer. Sin magia.
// ================================================

define('JWT_SECRET', JWT_SECRET_KEY);
define('JWT_EXPIRY', 60 * 60 * 8); // 8 horas en segundos

// ------------------------------------------------
// 1. GENERAR TOKEN
//    Uso: $token = jwt_generar(['id' => 1, 'rol' => 'admin']);
// ------------------------------------------------
function jwt_generar(array $payload): string {

    $header = base64url_encode(json_encode([
        'alg' => 'HS256',
        'typ' => 'JWT'
    ]));

    $payload['iat'] = time();               // issued at
    $payload['exp'] = time() + JWT_EXPIRY;  // expira en 8h

    $payload_encoded = base64url_encode(json_encode($payload));

    $firma = base64url_encode(hash_hmac(
        'sha256',
        "$header.$payload_encoded",
        JWT_SECRET,
        true
    ));

    return "$header.$payload_encoded.$firma";
}

// ------------------------------------------------
// 2. VERIFICAR TOKEN
//    Devuelve el payload si es válido, false si no.
//    Uso: $data = jwt_verificar($token);
// ------------------------------------------------
function jwt_verificar(string $token): array|false {

    $partes = explode('.', $token);

    if (count($partes) !== 3) return false;

    [$header, $payload_encoded, $firma_recibida] = $partes;

    // Recalculamos la firma con nuestra clave
    $firma_esperada = base64url_encode(hash_hmac(
        'sha256',
        "$header.$payload_encoded",
        JWT_SECRET,
        true
    ));

    // Comparación segura (evita timing attacks)
    if (!hash_equals($firma_esperada, $firma_recibida)) return false;

    $payload = json_decode(base64url_decode($payload_encoded), true);

    // Comprobamos expiración
    if (!isset($payload['exp']) || time() > $payload['exp']) return false;

    return $payload;
}

// ------------------------------------------------
// 3. EXTRAER TOKEN DEL HEADER
//    Lee "Authorization: Bearer <token>"
//    Uso: $token = jwt_extraer_header();
// ------------------------------------------------
function jwt_extraer_header(): string|false {
    $headers = getallheaders();

    // getallheaders() puede devolver mayúsculas o minúsculas según el servidor
    $auth = $headers['Authorization'] ?? $headers['authorization'] ?? null;

    if (!$auth || !str_starts_with($auth, 'Bearer ')) return false;

    return trim(substr($auth, 7));
}

// ------------------------------------------------
// HELPERS BASE64URL (RFC 4648)
// PHP no tiene esto nativo, son 2 líneas cada uno
// ------------------------------------------------
function base64url_encode(string $data): string {
    return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
}

function base64url_decode(string $data): string {
    return base64_decode(strtr($data, '-_', '+/'));
}