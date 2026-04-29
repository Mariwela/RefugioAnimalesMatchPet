import { Injectable, Inject, PLATFORM_ID } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { isPlatformBrowser } from '@angular/common'; // <-- Importamos esto
import { Observable } from 'rxjs';

export interface AuthResponse {
  message: string;
  user?: {              // <-- Añadimos este objeto
    id_usuario: number;
    nombre_completo: string;
    email: string;
    rol: string;
  };
  token?: string; // Por si en el futuro usas JWT
}

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  private apiUrl = 'http://localhost/refugioAnimalesMatchPet-main/backend-php/api/auth/login.php';
  constructor(
    private http: HttpClient,
    @Inject(PLATFORM_ID) private platformId: Object // <-- Inyectamos el ID de la plataforma
  ) { }

  login(email: string, password: string): Observable<AuthResponse> {
    return this.http.post<AuthResponse>(this.apiUrl, { email, password });
  }

  guardarDatosSesion(token: string, nombre: string, rol: string): void {
    // Solo guardamos si estamos en el navegador
    if (isPlatformBrowser(this.platformId)) {
      localStorage.setItem('auth_token', token);
      localStorage.setItem('usuario_nombre', nombre);
      localStorage.setItem('usuario_rol', rol);
    }
  }

  getToken(): string | null {
    // Solo leemos si estamos en el navegador
    if (isPlatformBrowser(this.platformId)) {
      return localStorage.getItem('auth_token');
    }
    return null; // Si estamos en el servidor, devolvemos null
  }

  isLoggedIn(): boolean {
    return this.getToken() !== null;
  }

  getRol(): string | null {
    if (isPlatformBrowser(this.platformId)) {
      return localStorage.getItem('usuario_rol');
    }
    return null;
  }

  logout(): void {
    if (isPlatformBrowser(this.platformId)) {
      localStorage.removeItem('auth_token');
      localStorage.removeItem('usuario_nombre');
      localStorage.removeItem('usuario_rol');
    }
  }
}