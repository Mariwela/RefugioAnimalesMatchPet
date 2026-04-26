# 🐾 MatchPet

**MatchPet** es una plataforma web de adopción de animales diseñada para conectar mascotas de protectoras con sus familias ideales. Este proyecto utiliza un catálogo dinámico alimentado por una base de datos MySQL.

## 🚀 Características
- **Catálogo Dinámico:** Visualización de animales registrados en la base de datos.
- **Cálculo de Edad Real:** La edad se calcula automáticamente en SQL a partir de la fecha de nacimiento.
- **Etiquetado de Energía:** Sistema visual para identificar el nivel de actividad de cada mascota.

## 🛠️ Tecnologías utilizadas
- **Backend:** PHP
- **Base de Datos:** MySQL
- **Frontend:** Angular
- **Servidor Local:** Wampserver

## 📊 Origen de los Datos
Para este proyecto se ha utilizado un dataset de **153 animales reales**. Los datos fueron obtenidos mediante técnicas de **Web Scraping** de un portal de adopción, con el fin de contar con un entorno de pruebas robusto que incluya:
- Imágenes reales de alta calidad.
- Descripciones y rasgos de comportamiento auténticos.
- Variedad de especies, razas y niveles de energía.

*Nota: Este proyecto se desarrolla exclusivamente con fines educativos y de portafolio.*

## 📂 Estructura del Proyecto
- `assets/`: Imágenes, archivos estáticos.
- `config/`: Archivos de conexión a la base de datos (protegidos por .gitignore).
- `database/`: Scripts SQL para la creación y población de la base de datos.