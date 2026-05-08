import { HttpClient, HttpHeaders } from '@angular/common/http'; // Asegúrate de importar HttpHeaders
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { RespuestaHistorias } from '../interfaces/historia.model';

@Injectable({
  providedIn: 'root',
})
export class HistoriaService {
  private apiUrl = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/historias/';

  constructor(private http: HttpClient) { }

  // Función privada para no repetir código de headers
  private getHeaders() {
    const token = localStorage.getItem('auth_token');
    return new HttpHeaders({
      'Authorization': `Bearer ${token}`
    });
  }

  obtenerHistorias(): Observable<RespuestaHistorias> {
    return this.http.get<RespuestaHistorias>(this.apiUrl + 'listar_historias.php');
  }

  obtenerPendientes(): Observable<RespuestaHistorias> {
    // Añadimos headers porque listar_pendientes requiere ser admin
    return this.http.get<RespuestaHistorias>(this.apiUrl + 'listar_pendientes.php', { headers: this.getHeaders() });
  }

  moderarHistoria(idHistoria: number, nuevoEstado: string, comentario?: string): Observable<any> {
    const payload = {
      id_historia: idHistoria,
      nuevo_estado: nuevoEstado,
      comentario_admin: comentario
    };
    return this.http.post<any>(this.apiUrl + 'moderar_historia.php', payload, { headers: this.getHeaders() });
  }

  // CORREGIDO: Ahora envía el Token
  publicarHistoria(datos: { id_animal: number, titulo: string, contenido: string }): Observable<any> {
    return this.http.post<any>(this.apiUrl + 'publicar_historia.php', datos, { headers: this.getHeaders() });
  }

  // CORREGIDO: Ahora envía el Token
  obtenerMisAdoptados(): Observable<any> {
    return this.http.get<any>(this.apiUrl + 'mis_adoptados.php', { headers: this.getHeaders() });
  }

  eliminarHistoria(idHistoria: number): Observable<any> {
    return this.http.delete<any>(`${this.apiUrl}eliminar_historia.php?id=${idHistoria}`, { headers: this.getHeaders() });
  }
}