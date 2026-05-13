# 🐾 MatchPet

**MatchPet** es una plataforma web de adopción de animales diseñada para conectar mascotas de protectoras con sus familias ideales. Ofrece un sistema de matching inteligente que cruza las preferencias del adoptante con las características de cada animal, además de una gestión completa del ciclo de adopción. Este proyecto utiliza un catálogo dinámico alimentado por una base de datos MySQL.

## 🚀 Características
- **Catálogo dinámico de animales** con filtros por especie, raza, tamaño, energía y compatibilidades.
- **Sistema MatchPet** — algoritmo de puntuación ponderada que recomienda animales según el perfil y preferencias del adoptante.
- **Gestión de solicitudes de adopción** con flujo de aprobación/rechazo.
- **Historial de salud** por animal (vacunas, cirugías, revisiones, tratamientos).
- **Favoritos** — los usuarios pueden guardar los animales que les interesan.
- **Historias de adopción** — los adoptantes publican sus experiencias; los administradores las moderan antes de publicarlas.
- **Sistema de notificaciones** para el seguimiento de solicitudes y novedades.
- **Gestión de usuarios y roles** (admin, colaborador, vet).
- **Perfil de usuario** completo, con avatar, preferencias de adopción y disponibilidad para acogida temporal.
- **Panel de administración** con gestión de animales, usuarios e historias pendientes de moderación.
- **Páginas informativas**: cómo adoptar, voluntariado, acogida temporal, sobre nosotros, contacto, donar.

## 🛠️ Tecnologías utilizadas
| Capa | Tecnología |
|---|---|
| Frontend | Angular 20 + Angular Material + SSR |
| Backend | PHP (API REST) |
| Base de datos | MySQL |
| Autenticación | JWT (JSON Web Tokens) |
| Servidor local | WampServer / Apache |
| Notificaciones UI | SweetAlert2 |
| Iconos | Font Awesome 7 |
| Datos de prueba | Web Scraping (153 animales reales) |
## 📊 Origen de los Datos
Para este proyecto se ha utilizado un dataset de **153 animales reales**. Los datos fueron obtenidos mediante técnicas de **Web Scraping** de un portal de adopción, con el fin de contar con un entorno de pruebas robusto que incluya:
- Imágenes reales de alta calidad.
- Descripciones y rasgos de comportamiento auténticos.
- Variedad de especies, razas y niveles de energía.

*Nota: Este proyecto se desarrolla exclusivamente con fines educativos y de portafolio.*
## 🧠 Algoritmo MatchPet
 
El endpoint `api/animales/matchpet.php` implementa un sistema de puntuación ponderada. Para cada animal disponible calcula una **puntuación de compatibilidad** sumando el peso asignado a cada criterio cuando la preferencia del adoptante coincide con la característica del animal:
 
| Criterio | Peso por defecto |
|---|---|
| Nivel de energía | 3 |
| Apto para piso | 3 |
| Sociable con niños | 3 |
| Sociable con perros | 3 |
| Sociable con gatos | 3 |
| Acepta medicación | 3 |
| Adecuado para principiantes | 3 |
| Requiere paciencia | 3 |
 
Los pesos son configurables desde el formulario de matching, permitiendo al adoptante indicar qué criterios son más importantes para él. Los resultados se devuelven ordenados de mayor a menor compatibilidad.
 
---
## 📁 Estructura del proyecto
 
```
RefugioAnimalesMatchPet/
├── backend-php/
│   ├── api/
│   │   ├── animales/        # CRUD animales + algoritmo MatchPet + filtros
│   │   ├── auth/            # Registro y login (JWT)
│   │   ├── favoritos/       # Añadir, eliminar y listar favoritos
│   │   ├── historias/       # Publicar, editar, moderar y listar historias
│   │   ├── notificaciones/  # Listar y marcar como leídas
│   │   ├── salud/           # Historial veterinario por animal
│   │   ├── solicitudes/     # Envío, gestión y validación de adopciones
│   │   └── usuarios/        # Perfil, avatar, contraseña, panel admin
│   ├── config/
│   │   ├── config.php.example   # Plantilla de configuración (ver instalación)
│   │   ├── conexion.php         # Conexión PDO a MySQL
│   │   ├── cors.php             # Cabeceras CORS
│   │   ├── jwt.php              # Generación y validación de tokens
│   │   └── auth_middleware.php  # Protección de rutas por rol
│   ├── database/
│   │   ├── creacion_db.sql      # Esquema completo de la base de datos
│   │   ├── datos_iniciales.sql  # Datos de prueba (153 animales)
│   │   ├── generar_datos.py     # Script generador de datos sintéticos
│   │   └── scraper.py           # Web scraper original de datos
│   ├── public/                  # Imágenes subidas (avatares, fotos animales, historias)
│   ├── install.php              # Instalador web guiado
│   └── importar_datos.php       # Importa datos guiado
│
└── frontend-angular/
    └── match-pet/
        └── src/app/
            ├── components/      # Componentes principales de la app
            │   ├── matchpet/            # Formulario y resultados del matching
            │   ├── animal.component/    # Listado de animales
            │   ├── animal-detalle/      # Ficha completa de un animal
            │   ├── animal-crear/        # Formulario de alta de animal (admin)
            │   ├── animal-edit/         # Edición de animal (admin)
            │   ├── animal-soli-list/    # Listado de solicitudes de adopción
            │   ├── perfil/              # Perfil de usuario
            │   ├── admin-usuarios/      # Panel de administración de usuarios
            │   ├── listar-historias/    # Historias de adopción públicas
            │   ├── publicar-historias/  # Formulario para publicar historia
            │   ├── moderar-historias/   # Moderación (admin)
            │   ├── mis-favoritos/       # Favoritos del usuario
            │   ├── acogida/             # Información sobre acogida temporal
            │   ├── voluntariado/        # Formulario de voluntariado
            │   └── ...
            ├── services/        # Servicios Angular (HTTP)
            ├── guards/          # auth-guard y admin-guard (protección de rutas)
            ├── home/            # Página principal
            ├── header/ footer/  # Cabecera y pie de página
            └── pages/           # Páginas estáticas (contacto, donar, aviso legal…)
```

---
 
## 📄 Licencia
 
Este proyecto se ha desarrollado exclusivamente con fines educativos y de portafolio. Los datos de animales provienen de fuentes públicas y no tienen uso comercial.