<?php
// 1. Cargar la configuración
if (!file_exists('config/config.php')) {
    die("❌ Error: No se encuentra 'config/config.php'. Copia 'config/config.php.example' como 'config/config.php' y rellena tus datos.");
}
require_once 'config/config.php';

try {
    // 2. Conexión inicial al servidor
    $dsn_inicial = "mysql:host=" . DB_HOST . ";charset=" . DB_CHARSET;
    $options = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    ];
    
    $pdo = new PDO($dsn_inicial, DB_USER, DB_PASS, $options);
    echo "✅ Conexión al servidor establecida.<br>";

    // 3. Crear la base de datos si no existe
    $pdo->exec("CREATE DATABASE IF NOT EXISTS " . DB_NAME . " CHARACTER SET " . DB_CHARSET . " COLLATE utf8mb4_unicode_ci");
    $pdo->exec("USE " . DB_NAME);
    echo "✅ Base de datos '" . DB_NAME . "' lista.<br>";

    // 4. Definir el SQL de las tablas
    $sql = "
    CREATE TABLE IF NOT EXISTS usuarios (
        id_usuario INT AUTO_INCREMENT PRIMARY KEY,
        nombre_completo VARCHAR(100) NOT NULL,
        dni_nie VARCHAR(20) UNIQUE,
        fecha_nacimiento DATE,
        email VARCHAR(100) UNIQUE NOT NULL,
        password VARCHAR(255) NOT NULL,
        telefono VARCHAR(20),
        direccion VARCHAR(255),
        poblacion VARCHAR(100),
        provincia VARCHAR(100),
        codigo_postal VARCHAR(10),
        rol ENUM('admin', 'adoptante', 'vet', 'casa_acogida', 'voluntario') DEFAULT 'adoptante',
        pref_especie ENUM('Perro', 'Gato', 'Cualquiera') DEFAULT 'Cualquiera',
        pref_energia ENUM('Baja', 'Media', 'Alta') DEFAULT NULL,
        pref_vivienda ENUM('Piso', 'Casa con jardín') DEFAULT NULL,
        bio_experiencia TEXT,
        estado_acogida ENUM('no_disponible', 'disponible', 'ocupado', 'pausa') DEFAULT 'no_disponible',
        fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        avatar VARCHAR(255) DEFAULT 'default_avatar.png'
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


    CREATE TABLE IF NOT EXISTS animales (
        id_animal INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL,
        especie ENUM('Perro', 'Gato', 'Exótico', 'Otro') NOT NULL,
        raza VARCHAR(50) DEFAULT 'Mestizo',
        sexo ENUM('Macho', 'Hembra', 'Desconocido') NOT NULL,
        microchip VARCHAR(15) UNIQUE,
        fecha_nacimiento DATE,
        tamano ENUM('Pequeño', 'Mediano', 'Grande', 'Gigante') DEFAULT 'Mediano',
        peso DECIMAL(5,2) NULL,
        descripcion TEXT,
        nivel_energia ENUM('Baja', 'Media', 'Alta') DEFAULT 'Media',
        apto_pisos BOOLEAN DEFAULT NULL,
        sociable_ninos BOOLEAN DEFAULT NULL,
        sociable_perros BOOLEAN DEFAULT NULL,
        sociable_gatos BOOLEAN DEFAULT NULL,
        enfermedad_cronica BOOLEAN DEFAULT FALSE,
        esterilizado BOOLEAN DEFAULT FALSE,
        nivel_paciencia VARCHAR(20) DEFAULT 'Baja',
        es_para_principiantes BOOLEAN DEFAULT TRUE,
        aviso_importante TEXT,
        estado ENUM('Disponible', 'Adoptado', 'En Acogida', 'Reservado') DEFAULT 'Disponible',
        foto_portada VARCHAR(255) DEFAULT 'default_animal.jpg',
        fecha_entrada TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


    CREATE TABLE IF NOT EXISTS animal_fotos (
        id_foto INT AUTO_INCREMENT PRIMARY KEY,
        id_animal INT NOT NULL,
        ruta_foto VARCHAR(255) NOT NULL,
        es_principal BOOLEAN DEFAULT FALSE,
        fecha_subida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (id_animal) REFERENCES animales(id_animal) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


    CREATE TABLE IF NOT EXISTS salud_historial (
        id_libro INT AUTO_INCREMENT PRIMARY KEY,
        id_animal INT NOT NULL,
        id_usuario INT NULL,
        evento ENUM('Vacuna', 'Cirugía', 'Revisión', 'Tratamiento', 'Desparasitación') NOT NULL,
        titulo VARCHAR(100) NOT NULL,
        detalles TEXT,
        fecha_evento DATE NOT NULL,
        estado ENUM('Completado', 'Pendiente', 'Cancelado') DEFAULT 'Completado',
        CONSTRAINT fk_salud_animal 
            FOREIGN KEY (id_animal) REFERENCES animales(id_animal) ON DELETE CASCADE,
        CONSTRAINT fk_salud_usuario 
            FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE SET NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


    CREATE TABLE IF NOT EXISTS solicitudes (
        id_solicitud INT AUTO_INCREMENT PRIMARY KEY,
        id_usuario INT NOT NULL,
        id_animal INT NOT NULL,
        fecha_solicitud TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        estado_solicitud ENUM('Pendiente', 'Aprobada', 'Rechazada') DEFAULT 'Pendiente',
        comentario_admin TEXT,
        UNIQUE (id_usuario, id_animal),
        CONSTRAINT fk_usuario 
            FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
        CONSTRAINT fk_animal 
            FOREIGN KEY (id_animal) REFERENCES animales(id_animal) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


    CREATE TABLE IF NOT EXISTS historias_adopcion (
        id_historia INT AUTO_INCREMENT PRIMARY KEY,
        id_usuario INT,
        id_animal INT,
        titulo VARCHAR(150) NOT NULL,
        contenido TEXT NOT NULL,
        imagen_url VARCHAR(255),
        estado ENUM('Pendiente', 'Aprobada', 'Rechazada') DEFAULT 'Pendiente',
        comentario_admin TEXT,
        fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE SET NULL,
        FOREIGN KEY (id_animal) REFERENCES animales(id_animal) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


    CREATE TABLE IF NOT EXISTS favoritos (
        id_favorito INT AUTO_INCREMENT PRIMARY KEY,
        id_usuario INT NOT NULL,
        id_animal INT NOT NULL,
        fecha_agregado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        UNIQUE KEY unico_favorito (id_usuario, id_animal),
        FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
        FOREIGN KEY (id_animal) REFERENCES animales(id_animal) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";


    // 5. Ejecutar la creación de tablas
    $pdo->exec($sql);
    echo "✅ Todas las tablas se crearon correctamente.<br>";

    // 6. Crear Usuarios Iniciales (Admin + Roles de prueba)
    echo "⏳ Creando usuarios del sistema...<br>";

    $usuarios_iniciales = [
        [
            'nombre' => 'Administrador MatchPet',
            'email' => 'admin@matchpet.com',
            'pass' => 'adminpass',
            'rol' => 'admin',
            'pob' => 'Madrid',
            'est_acogida' => 'no_disponible'
        ],
        [
            'nombre' => 'Marina Velic',
            'email' => 'mari@matchpet.com',
            'pass' => 'maripass',
            'rol' => 'adoptante',
            'fecha_nac' => '1985-04-01',
            'tel' => '611111111',
            'pob' => 'Valdemorillo',
            'prov' => 'Madrid',
            'pref_esp' => 'Perro',
            'pref_ene' => 'Media',
            'pref_viv' => 'Casa con jardín',
            'bio' => 'Experiencia con gatos'
        ],
        [
            'nombre' => 'Jordi Bastidas',
            'email' => 'jordi@matchpet.com',
            'pass' => 'jordipass',
            'rol' => 'vet',
            'tel' => '622222222',
            'prov' => 'Madrid'
        ],
        [
            'nombre' => 'Anthony Guanga',
            'email' => 'anthony@matchpet.com',
            'pass' => 'anthonypass',
            'rol' => 'casa_acogida',
            'tel' => '633333333',
            'prov' => 'Madrid',
            'pref_esp' => 'Gato',
            'pref_ene' => 'Media',
            'pref_viv' => 'Piso',
            'bio' => 'Experiencia con gatos',
            'est_acogida' => 'disponible'
        ]
    ];

    $sql_user = "INSERT IGNORE INTO usuarios 
        (nombre_completo, email, password, rol, fecha_nacimiento, telefono, poblacion, provincia, pref_especie, pref_energia, pref_vivienda, bio_experiencia, estado_acogida) 
        VALUES (:nombre, :email, :pass, :rol, :fecha_nac, :tel, :pob, :prov, :pref_esp, :pref_ene, :pref_viv, :bio, :est_acogida)";

    $stmt_user = $pdo->prepare($sql_user);

    foreach ($usuarios_iniciales as $u) {
        $stmt_user->execute([
            ':nombre'    => $u['nombre'] ?? 'Usuario',
            ':email'     => $u['email'],
            ':pass'      => password_hash($u['pass'], PASSWORD_DEFAULT),
            ':rol'       => $u['rol'],
            ':fecha_nac' => $u['fecha_nac'] ?? NULL,
            ':tel'       => $u['tel'] ?? NULL,
            ':pob'       => $u['pob'] ?? NULL,
            ':prov'      => $u['prov'] ?? NULL,
            ':pref_esp'  => $u['pref_esp'] ?? 'Cualquiera',
            ':pref_ene'  => $u['pref_ene'] ?? NULL,
            ':pref_viv'  => $u['pref_viv'] ?? NULL,
            ':bio'       => $u['bio'] ?? NULL,
            ':est_acogida' => $u['est_acogida'] ?? 'no_disponible'
        ]);
        echo "✅ Creado: " . $u['nombre'] . " [" . $u['rol'] . "]<br>";
    }


} catch (PDOException $e) {
    die("❌ Error durante la instalación: " . $e->getMessage());
}
?>