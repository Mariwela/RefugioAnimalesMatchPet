DROP DATABASE IF EXISTS matchpet_db;
CREATE DATABASE matchpet_db;
USE matchpet_db;

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

    rol ENUM('admin', 'colaborador', 'vet') DEFAULT 'colaborador',
    disponibilidad_voluntario ENUM('si', 'no') DEFAULT 'no',
    area_interes VARCHAR(100) DEFAULT NULL,
    horario_voluntario TEXT DEFAULT NULL,
    comentarios_voluntario TEXT DEFAULT NULL,

    pref_especie ENUM('Perro', 'Gato', 'Cualquiera') DEFAULT 'Cualquiera',
    pref_energia ENUM('Baja', 'Media', 'Alta') DEFAULT NULL,
    pref_vivienda ENUM('Piso', 'Casa con jardín') DEFAULT NULL,
    bio_experiencia TEXT,
    disponibilidad_acogida ENUM('no_disponible', 'disponible', 'ocupado', 'pausa') DEFAULT 'no_disponible',
    avatar VARCHAR(255) DEFAULT 'default_avatar.png',
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
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

    notificacion_leida TINYINT(1) DEFAULT 0, 

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
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comentario_admin TEXT NULL,
    
    estado ENUM('Pendiente', 'Aprobada', 'Rechazada') DEFAULT 'Pendiente',

    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE SET NULL,
    FOREIGN KEY (id_animal) REFERENCES animales(id_animal) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS favoritos (
    id_usuario INT NOT NULL,
    id_animal INT NOT NULL,
    fecha_agregado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (id_usuario, id_animal),

    CONSTRAINT fk_fav_usuario 
        FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,

    CONSTRAINT fk_fav_animal 
        FOREIGN KEY (id_animal) REFERENCES animales(id_animal) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO favoritos (id_usuario, id_animal) VALUES (1, 1);