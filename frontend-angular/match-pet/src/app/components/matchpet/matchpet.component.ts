import { Component, OnInit, ChangeDetectorRef, ChangeDetectionStrategy } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';

// ────────────────────────────────────────────
//  INTERFACES
// ────────────────────────────────────────────

export interface PreguntaMatchPet {
    key: keyof Pesos;
    prefKey: keyof Preferencias;
    titulo: string;
    descripcion: string;
    icono: string;
    tipoPregunta: 'rango' | 'energia' | 'booleano';
    opciones?: { label: string; valor: any }[];
}

export interface Pesos {
    nivel_energia: number;
    apto_pisos: number;
    sociable_ninos: number;
    sociable_perros: number;
    sociable_gatos: number;
}

export interface Preferencias {
    nivel_energia: string | null;

    tipo_vivienda: 'piso_pequeno' | 'piso_grande' | 'casa_jardin' | null;
    acceso_exterior: boolean | null;

    sociable_ninos: 'casa' | 'visita' | 'no' | null;

    tiene_perros: boolean | null;
    perros_sociables: boolean | null;

    tiene_gatos: boolean | null;
    gatos_sociables: boolean | null;

    // valor final usado por el algoritmo
    apto_pisos: boolean | null;
    sociable_perros: boolean | null;
    sociable_gatos: boolean | null;
}

export interface ResultadoAnimal {
    id_animal: number;
    nombre: string;
    especie: string;
    raza: string;
    sexo: string;
    edad: string;
    tamano: string;
    foto: string;
    descripcion: string;
    afinidad: number;
    badges: {
        nivel_energia: string;
        apto_pisos: boolean;
        sociable_ninos: boolean;
        esterilizado: boolean;
    };
}

// ────────────────────────────────────────────
//  PASOS DEL WIZARD
// ────────────────────────────────────────────

type Paso =
    | 'especie'
    | 'pregunta-0'
    | 'pregunta-1'
    | 'pregunta-2'
    | 'pregunta-3'
    | 'pregunta-4'
    | 'cargando'
    | 'resultados';

@Component({
    selector: 'app-matchpet',
    standalone: true,
    imports: [CommonModule, FormsModule],
    templateUrl: './matchpet.component.html',
    styleUrls: ['./matchpet.component.css'],
    changeDetection: ChangeDetectionStrategy.OnPush,
})
export class MatchpetComponent implements OnInit {

    // Estado del wizard
    pasoActual: Paso = 'especie';
    especieSeleccionada: string | null = null; // null = cualquiera
    indicePregunta = 0;

    pesos: Pesos = {
        nivel_energia: 3,
        apto_pisos: 3,
        sociable_ninos: 3,
        sociable_perros: 3,
        sociable_gatos: 3,
    };

    preferencias: Preferencias = {
        nivel_energia: null,

        tipo_vivienda: null,
        acceso_exterior: null,

        sociable_ninos: null,

        tiene_perros: null,
        perros_sociables: null,

        tiene_gatos: null,
        gatos_sociables: null,

        apto_pisos: null,
        sociable_perros: null,
        sociable_gatos: null,
    };

    resultados: ResultadoAnimal[] = [];
    error: string | null = null;

    private apiUrl = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api';

    // Definición de preguntas
    readonly PREGUNTAS: PreguntaMatchPet[] = [
        {
            key: 'nivel_energia',
            prefKey: 'nivel_energia',
            titulo: '¿Qué nivel de energía prefieres?',
            descripcion: 'Elige el ritmo de vida que mejor encaja contigo.',
            icono: '⚡',
            tipoPregunta: 'energia',
            opciones: [
                { label: '🛋️ Tranquilo', valor: 'Baja' },
                { label: '🚶 Moderado', valor: 'Media' },
                { label: '🏃 Muy activo', valor: 'Alta' },
            ],
        },

        {
            key: 'apto_pisos',
            prefKey: 'tipo_vivienda',
            titulo: '¿Cómo es tu vivienda?',
            descripcion: 'El espacio disponible influye en el tipo de animal ideal.',
            icono: '🏠',
            tipoPregunta: 'booleano',
            opciones: [
                { label: '🏢 Piso pequeño', valor: 'piso_pequeno' },
                { label: '🏬 Piso grande', valor: 'piso_grande' },
                { label: '🌳 Casa con jardín', valor: 'casa_jardin' },
            ],
        },

        {
            key: 'apto_pisos',
            prefKey: 'acceso_exterior',
            titulo: '¿Tiene acceso frecuente a espacios al aire libre?',
            descripcion: 'Parques, campo o zonas abiertas frecuentes cuentan como espacio extra.',
            icono: '🌳',
            tipoPregunta: 'booleano',
            opciones: [
                { label: '✅ Sí', valor: true },
                { label: '❌ No', valor: false },
            ],
        },

        {
            key: 'sociable_ninos',
            prefKey: 'sociable_ninos',
            titulo: '¿Habrá niños?',
            descripcion: 'Algunos animales se adaptan mejor a convivencias frecuentes con niños.',
            icono: '👶',
            tipoPregunta: 'booleano',
            opciones: [
                { label: '🏠 Sí, viven en casa', valor: 'casa' },
                { label: '🎈 Sí, pero vienen de visita', valor: 'visita' },
                { label: '❌ No habrá niños', valor: 'no' },
            ],
        },

        {
            key: 'sociable_perros',
            prefKey: 'tiene_perros',
            titulo: '¿Tienes perros en casa?',
            descripcion: '',
            icono: '🐕',
            tipoPregunta: 'booleano',
            opciones: [
                { label: '✅ Sí', valor: true },
                { label: '❌ No', valor: false },
            ],
        },

        {
            key: 'sociable_perros',
            prefKey: 'perros_sociables',
            titulo: '¿Tu perro se lleva bien con otros animales?',
            descripcion: '',
            icono: '🐶',
            tipoPregunta: 'booleano',
            opciones: [
                { label: '✅ Sí', valor: true },
                { label: '❌ No', valor: false },
            ],
        },

        {
            key: 'sociable_gatos',
            prefKey: 'tiene_gatos',
            titulo: '¿Tienes gatos en casa?',
            descripcion: '',
            icono: '🐈',
            tipoPregunta: 'booleano',
            opciones: [
                { label: '✅ Sí', valor: true },
                { label: '❌ No', valor: false },
            ],
        },

        {
            key: 'sociable_gatos',
            prefKey: 'gatos_sociables',
            titulo: '¿Tu gato se lleva bien con otros animales?',
            descripcion: '',
            icono: '🐱',
            tipoPregunta: 'booleano',
            opciones: [
                { label: '✅ Sí', valor: true },
                { label: '❌ No', valor: false },
            ],
        },
    ];

    get preguntaActual(): PreguntaMatchPet {
        return this.PREGUNTAS[this.indicePregunta];
    }

    get totalPreguntas(): number {
        return this.PREGUNTAS.length;
    }

    get progresoPreguntas(): number {
        return ((this.indicePregunta) / this.totalPreguntas) * 100;
    }

    constructor(private http: HttpClient, private router: Router, private cdr: ChangeDetectorRef) { }


    ngOnInit(): void { }

    // ─── Navegación ────────────────────────────

    seleccionarEspecie(especie: string | null): void {
        this.especieSeleccionada = especie;
        this.indicePregunta = 0;
        this.pasoActual = 'pregunta-0';
    }

    seleccionarPreferencia(valor: any): void {
        const prefKey = this.preguntaActual.prefKey;
        (this.preferencias as any)[prefKey] = valor;
    }

    get preferenciaActual(): any {
        return (this.preferencias as any)[this.preguntaActual.prefKey];
    }

    setPeso(valor: number): void {
        const key = this.preguntaActual.key;
        (this.pesos as any)[key] = valor;
    }

    get pesoActual(): number {
        return (this.pesos as any)[this.preguntaActual.key];
    }

    siguientePregunta(): void {

        // avanzar normal
        this.indicePregunta++;

        // ─────────────────────────────
        // Saltar acceso_exterior
        // ─────────────────────────────
        if (
            this.indicePregunta < this.totalPreguntas &&
            this.PREGUNTAS[this.indicePregunta].prefKey === 'acceso_exterior' &&
            this.preferencias.tipo_vivienda === 'casa_jardin'
        ) {
            this.indicePregunta++;
        }

        // ─────────────────────────────
        // Saltar perros_sociables
        // ─────────────────────────────
        if (
            this.indicePregunta < this.totalPreguntas &&
            this.PREGUNTAS[this.indicePregunta].prefKey === 'perros_sociables' &&
            this.preferencias.tiene_perros === false
        ) {
            this.indicePregunta++;
        }

        // ─────────────────────────────
        // Saltar gatos_sociables
        // ─────────────────────────────
        if (
            this.indicePregunta < this.totalPreguntas &&
            this.PREGUNTAS[this.indicePregunta].prefKey === 'gatos_sociables' &&
            this.preferencias.tiene_gatos === false
        ) {
            this.indicePregunta++;
        }

        // fin wizard
        if (this.indicePregunta >= this.totalPreguntas) {
            this.enviarFormulario();
            return;
        }

        this.pasoActual = `pregunta-${this.indicePregunta}` as Paso;
    }

    anteriorPregunta(): void {

        // retroceder normal
        this.indicePregunta--;

        // ─────────────────────────────
        // Saltar acceso_exterior
        // ─────────────────────────────
        if (
            this.indicePregunta >= 0 &&
            this.PREGUNTAS[this.indicePregunta].prefKey === 'acceso_exterior' &&
            this.preferencias.tipo_vivienda === 'casa_jardin'
        ) {
            this.indicePregunta--;
        }

        // ─────────────────────────────
        // Saltar perros_sociables
        // ─────────────────────────────
        if (
            this.indicePregunta >= 0 &&
            this.PREGUNTAS[this.indicePregunta].prefKey === 'perros_sociables' &&
            this.preferencias.tiene_perros === false
        ) {
            this.indicePregunta--;
        }

        // ─────────────────────────────
        // Saltar gatos_sociables
        // ─────────────────────────────
        if (
            this.indicePregunta >= 0 &&
            this.PREGUNTAS[this.indicePregunta].prefKey === 'gatos_sociables' &&
            this.preferencias.tiene_gatos === false
        ) {
            this.indicePregunta--;
        }

        // volver a especie
        if (this.indicePregunta < 0) {
            this.pasoActual = 'especie';
            return;
        }

        this.pasoActual = `pregunta-${this.indicePregunta}` as Paso;
    }

    reiniciar(): void {
        this.pasoActual = 'especie';
        this.especieSeleccionada = null;
        this.indicePregunta = 0;
        this.pesos = { nivel_energia: 3, apto_pisos: 3, sociable_ninos: 3, sociable_perros: 3, sociable_gatos: 3 };
        this.preferencias = {
            nivel_energia: null,

            tipo_vivienda: null,
            acceso_exterior: null,

            sociable_ninos: null,

            tiene_perros: null,
            perros_sociables: null,

            tiene_gatos: null,
            gatos_sociables: null,

            apto_pisos: null,
            sociable_perros: null,
            sociable_gatos: null,
        };
        this.resultados = [];
        this.error = null;
    }

    // ─── Llamada al backend ────────────────────

    enviarFormulario(): void {
        this.pasoActual = 'cargando';
        this.error = null;

        // ─────────────────────────────
        // Lógica vivienda
        // ─────────────────────────────

        if (
            this.preferencias.tipo_vivienda === 'casa_jardin' ||
            this.preferencias.acceso_exterior === true
        ) {
            this.preferencias.apto_pisos = false;
        } else {
            this.preferencias.apto_pisos = true;
        }

        // ─────────────────────────────
        // Lógica perros
        // ─────────────────────────────

        if (!this.preferencias.tiene_perros) {
            this.preferencias.sociable_perros = null;
        } else {
            this.preferencias.sociable_perros =
                this.preferencias.perros_sociables === false;
        }

        // ─────────────────────────────
        // Lógica gatos
        // ─────────────────────────────

        if (!this.preferencias.tiene_gatos) {
            this.preferencias.sociable_gatos = null;
        } else {
            this.preferencias.sociable_gatos =
                this.preferencias.gatos_sociables === false;
        }

        // ─────────────────────────────
        // Lógica niños
        // ─────────────────────────────

        if (this.preferencias.sociable_ninos === 'no') {
            this.preferencias.sociable_ninos = null;
        }

        const body = {
            especie: this.especieSeleccionada,
            pesos: this.pesos,
            preferencias: this.preferencias,
        };

        this.http.post<any>(`${this.apiUrl}/animales/matchpet.php`, body).subscribe({
            next: (res) => {
                if (res.success) {
                    this.resultados = res.resultados;
                    this.pasoActual = 'resultados';
                } else {
                    this.error = 'No pudimos calcular tu match. Inténtalo de nuevo.';
                    this.pasoActual = 'especie';
                }
                this.cdr.markForCheck();
            },
            error: () => {
                this.error = 'Error de conexión. Inténtalo más tarde.';
                this.pasoActual = 'especie';
                this.cdr.markForCheck();
            },
        });
    }

    // ─── Helpers ──────────────────────────────

    irAPerfil(idAnimal: number): void {
        this.router.navigate(['/animal', idAnimal]);
    }

    getColorAfinidad(afinidad: number): string {
        if (afinidad >= 80) return '#22c55e';
        if (afinidad >= 60) return '#f59e0b';
        return '#ef4444';
    }

    getLabelAfinidad(afinidad: number): string {
        if (afinidad >= 80) return '¡Match ideal!';
        if (afinidad >= 60) return 'Buena afinidad';
        return 'Compatible';
    }

    getRangoLabels(): string[] {
        return ['1 – Poco importante', '2', '3 – Neutral', '4', '5 – Muy importante'];
    }

    // Comprueba si la preferencia actual tiene valor seleccionado
    // matchpet.component.ts

    get puedeAvanzar(): boolean {
        // Solo permitimos avanzar si el usuario ha interactuado
        // haciendo clic en una opción o en 'No tengo preferencia'
        return this.preferenciaActual !== undefined;
    }

    getImageUrl(foto: string): string {
        if (!foto) return 'http://localhost/RefugioAnimalesMatchPet/backend-php/public/img/animales/default.jpg';
        return `http://localhost/RefugioAnimalesMatchPet/backend-php/public/img/animales/${foto}`;
    }
}