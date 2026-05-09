import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {
  private readonly URL_BASE = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/usuarios/';

  constructor(private http: HttpClient) { }

  //Obtener datos del perfil
  verPerfil(idUsuario: number): Observable<any> {
    return this.http.get(`${this.URL_BASE}ver_perfil.php?id=${idUsuario}`);
  }

  //Editar perfil general
  editarPerfil(datos: any): Observable<any> {
    // 1. Obtener el token del almacenamiento local
    const token = localStorage.getItem('auth_token');

    // 2. Crear las cabeceras incluyendo el Bearer Token
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    });

    // 3. Enviar la petición POST con los datos y las cabeceras
    return this.http.post(`${this.URL_BASE}editar_perfil.php`, datos, { headers });
  }

  //Cambiar contraseña
  cambiarPassword(datos: any): Observable<any> {
    return this.http.post(`${this.URL_BASE}cambiar_password.php`, datos);
  }

  //Eliminar la cuenta
  eliminarPerfil(idUsuario: number): Observable<any> {
    return this.http.delete(`${this.URL_BASE}eliminar_perfil.php?id=${idUsuario}`);
  }

  //Específico para activar/desactivar acogida
  actualizarEstadoAcogida(idUsuario: number, estado: string): Observable<any> {
    return this.http.post(`${this.URL_BASE}editar_perfil.php`, { 
      id_usuario: idUsuario, 
      estado_acogida: estado 
    });
  }
}