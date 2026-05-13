import json
import os
import re
from datetime import datetime

def limpiar_campo(texto, marcador_inicio, marcador_fin):
    """Extrae el texto entre marcador_inicio y marcador_fin, limpiando caracteres extraños."""
    if marcador_inicio in texto:
        try:
            parte = texto.split(marcador_inicio)[1]
            resultado = parte.split(marcador_fin)[0].strip()
            for char in ['', '', '', '', '', '', '', '']:
                resultado = resultado.replace(char, '')
            return resultado.strip()
        except:
            return None
    return None

def normalizar_especie(especie):
    """Normaliza la especie a Perro, Gato u Otro."""
    if 'Perro' in especie:
        return 'Perro'
    elif 'Gato' in especie:
        return 'Gato'
    else:
        return 'Otro'

def detectar_energia(texto):
    """Detecta nivel de energía según palabras clave en la descripción."""
    texto = texto.lower()
    alta = ['juguetón', 'activo', 'energía', 'inquieto', 'corre', 'jugar']
    baja = ['tranquilo', 'calmado', 'relajado', 'dormilón']

    if any(p in texto for p in alta):
        return 'Alta'
    elif any(p in texto for p in baja):
        return 'Baja'
    else:
        return 'Media'

import re

def detectar_sociabilidad(texto):
    texto = texto.lower()

    sociable_ninos = None
    sociable_perros = None
    sociable_gatos = None

    negativos_generales = [
        "no convive", "no sociable", "no compatible",
        "no se lleva bien", "agresivo", "reactivo"
    ]

    positivos_ninos = [
        "cariñoso", "cariñosa", "amoroso", "amorosa",
        "afectuoso", "dulce", "mimos", "ronronea",
        "busca contacto", "le encanta estar con",
        "muy bueno", "muy buena"
    ]

    negativos_ninos = [
        "no permite la manipulación",
        "no se deja tocar",
        "muy tímido", "tímida",
        "miedo", "asustadizo", "desconfiado"
    ]

    if any(p in texto for p in positivos_ninos):
        sociable_ninos = 1

    if any(n in texto for n in negativos_ninos):
        sociable_ninos = 0

    perros_pos = [
        "convive con perros",
        "se lleva bien con perros",
        "compatible con perros",
        "apto con perros",
        "acostumbrado a vivir con perros",
        "apta con perros"
    ]

    perros_pos_regex = [
        r"perros.*(sin problema|bien)",
        r"(convive|compatible|apto|acostumbrad[oa] a vivir).*(perros)"
    ]

    perros_neg = [
        "mejor perro único",
        "solo perro",
        "no perros",
        "sin perros"
    ]

    if any(p in texto for p in perros_pos):
        sociable_perros = 1

    if any(re.search(p, texto) for p in perros_pos_regex):
        sociable_perros = 1

    if re.search(r"sociable con (otros )?perros", texto):
        sociable_perros = 1

    if "otros perros" in texto or "con otros perros" in texto:
        sociable_perros = 1

    if any(n in texto for n in perros_neg):
        sociable_perros = 0

    if any(n in texto for n in negativos_generales) and "perros" in texto:
        sociable_perros = 0

    gatos_pos = [
        "convive con gatos",
        "se lleva bien con gatos",
        "compatible con gatos",
        "apto con gatos",
        "acostumbrado a vivir con gatos",
        "apta con gatos"
    ]

    gatos_pos_regex = [
        r"gatos.*(sin problema|bien)",
        r"(convive|compatible|apto|acostumbrad[oa] a vivir).*(gatos)"
    ]

    gatos_neg = [
        "mejor sin gatos",
        "no gatos",
        "solo gato",
        "gato único"
    ]

    if any(p in texto for p in gatos_pos):
        sociable_gatos = 1

    if any(re.search(p, texto) for p in gatos_pos_regex):
        sociable_gatos = 1

    if any(n in texto for n in gatos_neg):
        sociable_gatos = 0

    if any(n in texto for n in negativos_generales) and "gatos" in texto:
        sociable_gatos = 0

    return sociable_ninos, sociable_perros, sociable_gatos

def detectar_apto_piso(texto, energia, tamano):
    texto = texto.lower()

    if "no apto para piso" in texto or "requiere jardín" in texto:
        return 0

    if energia == "Alta" and tamano in ["Grande", "Gigante"]:
        return 0

    return 1

def calcular_edad_meses(fecha_nac):
    """Devuelve edad en meses a partir de fecha_nac (YYYY-MM-DD)."""
    if not fecha_nac:
        return None
    fecha_nac_dt = datetime.strptime(fecha_nac, "%Y-%m-%d")
    hoy = datetime.now()
    return (hoy.year - fecha_nac_dt.year) * 12 + (hoy.month - fecha_nac_dt.month)

def calcular_esterilizado(especie, edad_meses):
    """Determina si el animal está esterilizado según edad y especie."""

    if edad_meses is None:
        return 1

    if especie == 'Perro':
        return 1 if edad_meses >= 7 else 0
    elif especie == 'Gato':
        return 1 if edad_meses >= 5 else 0
    else:
        return 1 if edad_meses >= 4 else 0
    
def sql_val(v):
    """Convierte valores booleanos del ETL inicial a SQL."""
    if v is None:
        return "NULL"
    return str(int(v))

def generar_sql():
    ruta_json = 'animales_total.json'
    ruta_sql = 'db/datos_iniciales.sql'

    if not os.path.exists('db'):
        os.makedirs('db')

    with open(ruta_json, 'r', encoding='utf-8') as f:
        animales = json.load(f)

    with open(ruta_sql, 'w', encoding='utf-8') as f:

        f.write("USE matchpet_db;\n\n")

        for animal in animales:
            desc_raw = animal['descripcion']
            especie = normalizar_especie(animal.get('especie', 'Otro'))
            nombre = animal['nombre'].replace("'", "''")
            fotos_lista = animal.get('imagenes', [])
            foto_portada = fotos_lista[0] if fotos_lista else 'fotos/default.jpg'
            cortes = [
                "Todos los perros en adopción se entregan con",
                "Todos los gatos en adopción se entregan con",
                "¿Quieres adoptar a",
                "Si tienes cualquier duda contacta con nosotros",
                "Podemos contarte más detalles",
                "Protección de datos personales",
                "Nombre* Teléfono*",
                "Si el animal tiene alguna enfermedad se os entrega",
                "¿No puedes adoptar y quieres ayudar apadrinando?",
                "APADRINA Perros en adopción",
                "Contacta con nosotros y te ayudaremos",
                "Actualmente tenemos cobayas macho disponibles para adopción"
            ]

            historia_limpia = desc_raw
            for corte in cortes:
                if corte in historia_limpia:
                    historia_limpia = historia_limpia.split(corte)[0]

            raza_real = limpiar_campo(historia_limpia, "Raza:", "Carácter") or "Mestizo"

            if "Hembra" in historia_limpia:
                sexo_real = "Hembra"
            elif "Macho" in historia_limpia:
                sexo_real = "Macho"
            else:
                sexo_real = "Desconocido"

            fecha_nac_raw = limpiar_campo(desc_raw, "Fecha de nacimiento:", "Sexo:")
            fecha_nac = None
            fecha_nac_sql = "NULL"

            if fecha_nac_raw and '/' in fecha_nac_raw:
                partes = [p.strip() for p in fecha_nac_raw.split('/')]
                if len(partes) == 3:
                    anio = partes[2] if len(partes[2]) == 4 else f"20{partes[2]}"
                    fecha_nac = f"{anio}-{partes[1].zfill(2)}-{partes[0].zfill(2)}"
                    fecha_nac_sql = f"'{fecha_nac}'"
            else:
                edad_match = re.search(r"Edad:\s*(\d+)", desc_raw)
                if edad_match:
                    anios = int(edad_match.group(1))
                    anio_actual = datetime.now().year
                    fecha_nac = f"{anio_actual - anios}-01-01"
                    fecha_nac_sql = f"'{fecha_nac}'"

            edad_meses = calcular_edad_meses(fecha_nac_sql.strip("'") if fecha_nac_sql != "NULL" else None)
            esterilizado = calcular_esterilizado(especie, edad_meses)
            esterilizado_sql = "NULL" if esterilizado is None else esterilizado

            peso_str = limpiar_campo(historia_limpia, "Peso:", "Raza:")
            try:
                peso_real = float(re.findall(r"\d+\.?\d*", peso_str.replace(',', '.'))[0])
            except:
                peso_real = "NULL"

            if especie == 'Gato':
                tamano_final = "'Pequeño'"
            elif especie == 'Perro' and peso_real != "NULL":
                if peso_real <= 10:
                    tamano_final = "'Pequeño'"
                elif peso_real <= 25:
                    tamano_final = "'Mediano'"
                elif peso_real <= 45:
                    tamano_final = "'Grande'"
                else:
                    tamano_final = "'Gigante'"
            else:
                tamano_final = "NULL"

            nivel_energia = detectar_energia(historia_limpia)

            sociable_ninos, sociable_perros, sociable_gatos = detectar_sociabilidad(historia_limpia)

            tamano_clean = tamano_final.replace("'", "") if tamano_final != "NULL" else "Desconocido"
            apto_pisos = detectar_apto_piso(historia_limpia, nivel_energia, tamano_clean)

            palabras_enfermedad = ['enfermedad', 'leishmania', 'ehrlichia', 'anaplasma',
                                   'filaria', 'displasia', 'ciego', 'ciega', 'tuerto']
            enfermedad = 1 if any(p in historia_limpia.lower() for p in palabras_enfermedad) else 0

            if "Carácter e historia" in historia_limpia:
                final_desc = historia_limpia.split("Carácter e historia")[1]
            else:
                final_desc = historia_limpia

            desc_sql = final_desc.strip().replace("'", "''")
            if len(desc_sql) < 10:
                desc_sql = f"Este precioso {especie.lower()} busca una familia."

            f.write(
                f"INSERT INTO animales "
                f"(nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, "
                f"apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)\n"
                f"VALUES ('{nombre}', '{especie}', '{raza_real}', '{sexo_real}', {fecha_nac_sql}, {tamano_final}, {peso_real}, "
                f"'{desc_sql}', '{nivel_energia}', {sql_val(apto_pisos)}, {sql_val(sociable_ninos)}, {sql_val(sociable_perros)}, {sql_val(sociable_gatos)}, "
                f"{enfermedad}, {esterilizado_sql}, 'Disponible', '{foto_portada}');\n"
            )

            f.write("SET @id_animal = LAST_INSERT_ID();\n\n")

            f.write(
                "INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)\n"
                "VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');\n"
            )

            f.write(
                "INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)\n"
                "VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');\n"
            )

            f.write(
                "INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)\n"
                "VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');\n"
            )

            if esterilizado == 1:
                f.write(
                    "INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)\n"
                    "VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');\n"
                )

            if enfermedad == 1:
                f.write(
                    "INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)\n"
                    "VALUES (@id_animal, 'Tratamiento', 'Seguimiento veterinario', 'El animal presenta una condición que requiere control', CURDATE(), 'Pendiente');\n"
                )

            for index, foto in enumerate(fotos_lista):
                es_principal = 1 if index == 0 else 0
                f.write(
                    f"INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)\n"
                    f"VALUES (@id_animal, '{foto}', {es_principal});\n"
                )

            f.write("\n") 

    print("✅ SQL generado correctamente en db/datos_iniciales.sql")

if __name__ == "__main__":
    generar_sql()
