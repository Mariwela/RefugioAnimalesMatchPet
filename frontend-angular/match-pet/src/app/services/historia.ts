import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs'; // Importación estándar
import { RespuestaHistorias } from '../interfaces/historia.model';

@Injectable({
  providedIn: 'root',
})
export class HistoriaService { // Renombrado a HistoriaService
  private apiUrl = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/historias/listar_historias.php';

  constructor(private http: HttpClient) { }

  obtenerHistorias(): Observable<RespuestaHistorias> {
    return this.http.get<RespuestaHistorias>(this.apiUrl);
  }
  moderarHistoria(idHistoria: number, nuevoEstado: string, comentario?: string): Observable<any> {
    const payload = {
      id_historia: idHistoria,
      nuevo_estado: nuevoEstado,
      comentario_admin: comentario
    };

    // Asumo que tienes un Interceptor HTTP configurado que inyecta automáticamente 
    // el token JWT en las cabeceras, ya que el PHP lo requiere.
    return this.http.post<any>(this.apiUrl + 'moderar_historia.php', payload);
  }
}