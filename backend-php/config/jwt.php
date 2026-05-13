<?php
define('JWT_SECRET', JWT_SECRET_KEY);
define('JWT_EXPIRY', 60 * 60 * 8);

function jwt_generar(array $payload): string {

    $header = base64url_encode(json_encode([
        'alg' => 'HS256',
        'typ' => 'JWT'
    ]));

    $payload['iat'] = time();              
    $payload['exp'] = time() + JWT_EXPIRY;  

    $payload_encoded = base64url_encode(json_encode($payload));

    $firma = base64url_encode(hash_hmac(
        'sha256',
        "$header.$payload_encoded",
        JWT_SECRET,
        true
    ));

    return "$header.$payload_encoded.$firma";
}

function jwt_verificar(string $token): array|false {

    $partes = explode('.', $token);

    if (count($partes) !== 3) return false;

    [$header, $payload_encoded, $firma_recibida] = $partes;

    $firma_esperada = base64url_encode(hash_hmac(
        'sha256',
        "$header.$payload_encoded",
        JWT_SECRET,
        true
    ));

    if (!hash_equals($firma_esperada, $firma_recibida)) return false;

    $payload = json_decode(base64url_decode($payload_encoded), true);

    if (!isset($payload['exp']) || time() > $payload['exp']) return false;

    return $payload;
}

function jwt_extraer_header() {
    $headers = null;

    if (isset($_SERVER['Authorization'])) {
        $headers = trim($_SERVER["Authorization"]);
    }

    elseif (isset($_SERVER['HTTP_AUTHORIZATION'])) {
        $headers = trim($_SERVER["HTTP_AUTHORIZATION"]);
    }

    elseif (function_exists('apache_request_headers')) {
        $requestHeaders = apache_request_headers();

        $requestHeaders = array_combine(
            array_map('ucwords', array_keys($requestHeaders)),
            array_values($requestHeaders)
        );

        if (isset($requestHeaders['Authorization'])) {
            $headers = trim($requestHeaders['Authorization']);
        }
    }

    if (!empty($headers)) {
        if (preg_match('/Bearer\s(\S+)/', $headers, $matches)) {
            return $matches[1];
        }
    }

    return null;
}

function base64url_encode(string $data): string {
    return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
}

function base64url_decode(string $data): string {
    return base64_decode(strtr($data, '-_', '+/'));
}