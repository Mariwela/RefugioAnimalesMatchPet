import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { RespuestaHistorias } from '../interfaces/historia.model';

@Injectable({
  providedIn: 'root',
})
export class HistoriaService {
  // Ajusta la URL base a tu entorno
  private apiUrl = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/historias/';

  constructor(private http: HttpClient) { }

  obtenerHistorias(): Observable<RespuestaHistorias> {
    return this.http.get<RespuestaHistorias>(this.apiUrl + 'listar_historias.php');
  }

  // NUEVO MÉTODO: Llama exclusivamente a las pendientes
  obtenerPendientes(): Observable<RespuestaHistorias> {
    return this.http.get<RespuestaHistorias>(this.apiUrl + 'listar_pendientes.php');
  }

  moderarHistoria(idHistoria: number, nuevoEstado: string, comentario?: string): Observable<any> {
    const payload = {
      id_historia: idHistoria,
      nuevo_estado: nuevoEstado,
      comentario_admin: comentario
    };
    return this.http.post<any>(this.apiUrl + 'moderar_historia.php', payload);
  }
  // Añade este método en tu HistoriaService
  publicarHistoria(datos: { id_animal: number, titulo: string, contenido: string }): Observable<any> {
    return this.http.post<any>(this.apiUrl + 'publicar_historia.php', datos);
  }
  // Añade esto en tu HistoriaService
  obtenerMisAdoptados(): Observable<any> {
    return this.http.get<any>(this.apiUrl + 'mis_adoptados.php');
  }
}