import { Historia } from "../services/historia";

export interface HistoriaModel {
    id_historia?: number;
    id_animal?: number;
    id_usuario?: number;
    titulo?: string;      // Asumiendo que tienes este campo en tu tabla
    contenido?: string;   // Asumiendo que tienes este campo
    fecha: string;
    estado?: string;
    nombre_animal: string;
    nombre_usuario: string;
}
export interface RespuestaHistorias {
    status: string;
    data: Historia[];
    message?: string;
}
