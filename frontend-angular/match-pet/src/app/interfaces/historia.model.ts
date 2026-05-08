export interface HistoriaModel {
    id_historia: number;
    id_usuario?: number;
    id_animal?: number;
    titulo: string;
    contenido: string;
    imagen_url?: string;
    fecha: string;

    // Estos vienen del JOIN en tu PHP (a.nombre y u.nombre_completo)
    nombre_animal: string;
    nombre_usuario: string;
}

export interface RespuestaHistorias {
    status: string;
    data: HistoriaModel[];
    message?: string;
}