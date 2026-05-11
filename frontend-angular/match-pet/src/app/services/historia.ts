import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { RespuestaHistorias } from '../interfaces/historia.model';
import { AuthService } from './auth';

@Injectable({
  providedIn: 'root',
})
export class HistoriaService {
  private apiUrl = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/historias/';

  constructor(
    private http: HttpClient,
    private authService: AuthService
  ) { }

  //Genera las cabeceras con el token de autenticación
  private getHeaders() {
    const token = this.authService.getToken();
    return new HttpHeaders({
      'Authorization': `Bearer ${token}`
    });
  }

  // --- MÉTODO PÚBLICOS ---
  obtenerHistorias(): Observable<RespuestaHistorias> {
    return this.http.get<RespuestaHistorias>(this.apiUrl + 'listar_historias.php');
  }

  // --- MÉTODOS PROTEGIDOS (Requieren Token) ---
  publicarHistoria(datos: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/publicar_historia.php`, datos, { 
      headers: this.getHeaders() 
    });
  }

  subirFotoHistoria(idHistoria: number, foto: File): Observable<any> {
    const formData = new FormData();
    formData.append('id_historia', idHistoria.toString());
    formData.append('foto', foto);
    formData.append('nombre_final_archivo', `historia_${idHistoria}_${Date.now()}`);

    return this.http.post(`${this.apiUrl}subir_foto_historia.php`, formData, { 
      headers: this.getHeaders() 
    });
  }

  obtenerMisAdoptados(): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/mis_adoptados.php`, { 
      headers: this.getHeaders() 
    });
  }

  editarHistoria(idHistoria: number, titulo: string, contenido: string): Observable<any> {
    const payload = {
      id_historia: idHistoria,
      titulo: titulo,
      contenido: contenido
    };

    return this.http.post<any>('${this.apiUrl}editar_historia.php', payload, { headers: this.getHeaders() });
  }

  // --- MÉTODOS DE ADMINISTRACIÓN (Requieren Token y Rol Admin) ---
  obtenerPendientes(): Observable<RespuestaHistorias> {
    return this.http.get<RespuestaHistorias>('${this.apiUrl}listar_pendientes.php', { headers: this.getHeaders() });
  }

  moderarHistoria(idHistoria: number, nuevoEstado: string, comentario?: string): Observable<any> {
    const payload = {
      id_historia: idHistoria,
      nuevo_estado: nuevoEstado,
      comentario_admin: comentario
    };
    return this.http.post<any>('${this.apiUrl}moderar_historia.php', payload, { headers: this.getHeaders() });
  }

  eliminarHistoria(idHistoria: number): Observable<any> {
    return this.http.delete<any>(`${this.apiUrl}eliminar_historia.php?id=${idHistoria}`, { headers: this.getHeaders() });
  }
}