import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {
  private readonly URL_BASE = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/usuarios/';

  constructor(private http: HttpClient) { }

  verPerfil(idUsuario: number): Observable<any> {
    return this.http.get(`${this.URL_BASE}ver_perfil.php?id=${idUsuario}`);
  }

  editarPerfil(datos: any): Observable<any> {
    const token = localStorage.getItem('auth_token');
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    });

    return this.http.post(`${this.URL_BASE}editar_perfil.php`, datos, { headers });
  }

  cambiarPassword(datos: any): Observable<any> {
    return this.http.post(`${this.URL_BASE}cambiar_password.php`, datos);
  }

  eliminarPerfil(idUsuario: number): Observable<any> {
    return this.http.delete(`${this.URL_BASE}eliminar_perfil.php?id=${idUsuario}`);
  }

  actualizarEstadoAcogida(idUsuario: number, estado: string): Observable<any> {
    return this.http.post(`${this.URL_BASE}editar_perfil.php`, { 
      id_usuario: idUsuario, 
      estado_acogida: estado 
    });
  }
}