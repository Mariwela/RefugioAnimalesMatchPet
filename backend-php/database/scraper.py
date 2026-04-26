import requests
from bs4 import BeautifulSoup
import time
import json
import os
from urllib.parse import urlparse

# ==============================
# CONFIGURACIÓN GENERAL
# ==============================

BASE_URL = "https://fundacionanimalrescue.org/adopta/"

HEADERS = {
    "User-Agent": "Mozilla/5.0",
    "Referer": "https://fundacionanimalrescue.org/",
}

DELAY = 0.5  # Pausa entre peticiones (evita sobrecargar el servidor)

# ==============================
# FUNCIÓN: OBTENER LINKS DE ANIMALES
# ==============================

def obtener_links(session):
    """
    Recorre la paginación de la web y obtiene
    todos los enlaces a fichas de animales.
    """
    links = set()  # usamos set para evitar duplicados
    page = 1

    while True:
        try:
            url = f"{BASE_URL}page/{page}/"
            res = session.get(url, timeout=10)

            # Si la página no responde correctamente → fin
            if res.status_code != 200:
                break

            soup = BeautifulSoup(res.text, "lxml")

            # Selector típico de WordPress para títulos de entradas
            elementos = soup.select("h2.entry-title a")

            # Si no hay más animales → fin
            if not elementos:
                break

            # Guardamos los links
            for a in elementos:
                links.add(a["href"])

            print(f"Página {page} → {len(elementos)} animales")

            page += 1
            time.sleep(DELAY)

        except requests.RequestException as e:
            print(f"Error en paginación: {e}")
            break

    return list(links)


# ==============================
# FUNCIÓN: EXTRAER NOMBRE DESDE URL
# ==============================

def extraer_nombre(link):
    """
    Convierte la URL en un nombre legible.
    Ej: /perro-luna/ → Luna
    """
    try:
        path = urlparse(link).path.strip("/")
        slug = path.split("/")[-1]
        return slug.replace("-", " ").capitalize()
    except:
        return "Desconocido"


# ==============================
# FUNCIÓN: CLASIFICAR ESPECIE
# ==============================

def clasificar_especie(texto):
    """
    Clasifica el animal según palabras clave.
    """
    texto = texto.lower()

    categorias = {
        "Gato": ["gato", "gata"],
        "Perro": ["perro", "perra"],
        "Pequeño mamífero": ["conejo", "cobaya", "hurón", "roedor"]
    }

    for especie, keywords in categorias.items():
        if any(k in texto for k in keywords):
            return especie

    return "Desconocido"


# ==============================
# FUNCIÓN: EXTRAER TODAS LAS IMÁGENES
# ==============================

def extraer_imagenes(soup):
    """
    Busca todas las imágenes válidas dentro de la ficha.
    Filtra logos, SVGs y duplicados.
    """
    urls = []

    for img in soup.find_all("img"):
        candidatos = [
            img.get("data-orig-file"),
            img.get("data-lazy-src"),
            img.get("data-src"),
            img.get("src"),
        ]

        for url in candidatos:
            if (
                url
                and url.startswith("http")
                and not url.startswith("data:")
                and any(ext in url.lower() for ext in [".jpg", ".jpeg", ".png", ".webp"])
                and "logo" not in url.lower()
                and "avatar" not in url.lower()
            ):
                limpia = url.split("?")[0]

                # Evitar duplicados
                if limpia not in urls:
                    urls.append(limpia)

    return urls


# ==============================
# FUNCIÓN: DESCARGAR IMAGEN
# ==============================

def descargar_imagen(session, url, ruta):
    """
    Descarga una imagen desde una URL y la guarda en disco.
    """
    try:
        res = session.get(url, timeout=10)
        if res.status_code == 200:
            with open(ruta, "wb") as f:
                f.write(res.content)
            return True
    except requests.RequestException:
        pass

    return False


# ==============================
# FUNCIÓN PRINCIPAL
# ==============================

def scraping_total():
    print("🧹 Iniciando scraping completo...")

    # Carpeta base del script
    BASE_DIR = os.path.dirname(os.path.abspath(__file__))

    # Carpeta donde se guardarán las imágenes
    ruta_fotos = os.path.join(BASE_DIR, "fotos")
    os.makedirs(ruta_fotos, exist_ok=True)

    # Crear sesión HTTP reutilizable
    session = requests.Session()
    session.headers.update(HEADERS)

    # ------------------------------
    # FASE 1: Obtener todos los links
    # ------------------------------
    links = obtener_links(session)
    print(f"\n🔗 Total animales encontrados: {len(links)}\n")

    resultados = []

    # ------------------------------
    # FASE 2: Procesar cada animal
    # ------------------------------
    for i, link in enumerate(links, 1):
        try:
            nombre = extraer_nombre(link)
            print(f"[{i}/{len(links)}] {nombre}...", end=" ")

            res = session.get(link, timeout=10)
            soup = BeautifulSoup(res.text, "lxml")

            # -------- Descripción --------
            content = soup.find("div", class_="entry-content")

            if not content:
                print("⚠️ Sin contenido")
                continue

            texto = " ".join(content.get_text().split())

            # -------- Especie --------
            especie = clasificar_especie(link + " " + texto[:200])

            # -------- Imágenes --------
            imagenes = extraer_imagenes(soup)

            if len(imagenes) > 4:
                imagenes = imagenes[:-4]
            else:
                # Si hay pocas, no recortamos
                imagenes = imagenes

            paths_imagenes = []

            if imagenes:
                # Crear carpeta específica para cada animal
                carpeta_animal = os.path.join(
                    ruta_fotos,
                    nombre.lower().replace(" ", "_")
                )
                os.makedirs(carpeta_animal, exist_ok=True)

                for idx, img_url in enumerate(imagenes, 1):
                    nombre_img = f"{idx}.jpg"
                    ruta_img = os.path.join(carpeta_animal, nombre_img)

                    if not os.path.exists(ruta_img):
                        if descargar_imagen(session, img_url, ruta_img):
                            print(f"📸{idx}", end=" ")
                    else:
                        print(f"✔️{idx}", end=" ")

                    paths_imagenes.append(
                        f"fotos/{nombre.lower().replace(' ', '_')}/{nombre_img}"
                    )

            # -------- Guardar resultado --------
            resultados.append({
                "nombre": nombre,
                "especie": especie,
                "descripcion": texto,
                "imagenes": paths_imagenes,
                "estado": "Disponible",
                "url_origen": link
            })

            print(f"✅ ({especie})")
            time.sleep(DELAY)

        except Exception as e:
            print(f"❌ Error: {e}")

    # ------------------------------
    # FASE 3: Guardar JSON
    # ------------------------------
    ruta_json = os.path.join(BASE_DIR, "animales_total.json")

    with open(ruta_json, "w", encoding="utf-8") as f:
        json.dump(resultados, f, ensure_ascii=False, indent=4)

    print("\n🏆 Scraping completado correctamente.")


# ==============================
# EJECUCIÓN
# ==============================

if __name__ == "__main__":
    scraping_total()