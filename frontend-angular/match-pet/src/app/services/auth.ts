import { Injectable, Inject, PLATFORM_ID } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { isPlatformBrowser } from '@angular/common'; // <-- Importamos esto
import { Observable } from 'rxjs';
import id from '@angular/common/locales/extra/id';

export interface AuthResponse {
  message: string;
  user?: {              // <-- Añadimos este objeto
    id_usuario: number;
    nombre_completo: string;
    email: string;
    rol: string;
    avatar: string;
  };
  token?: string; // Por si en el futuro usas JWT
}

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  // En tu auth.service.ts
  private apiUrl = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/auth/login.php';

  constructor(
    private http: HttpClient,
    @Inject(PLATFORM_ID) private platformId: Object // <-- Inyectamos el ID de la plataforma
  ) { }

  login(email: string, password: string): Observable<AuthResponse> {
    return this.http.post<AuthResponse>(this.apiUrl, { email, password });
  }


  guardarDatosSesion(token: string, nombre: string, rol: string, avatar: string, id_usuario: number): void {
    if (isPlatformBrowser(this.platformId)) {
      localStorage.setItem('auth_token', token);
      localStorage.setItem('usuario_nombre', nombre);
      localStorage.setItem('usuario_rol', rol);
      localStorage.setItem('usuario_avatar', avatar);
      localStorage.setItem('usuario_id', id_usuario.toString());
      if (avatar) {
        localStorage.setItem('usuario_avatar', avatar);
      } else {
        localStorage.removeItem('usuario_avatar'); // Lo borramos por si había uno viejo
      }
    }
  }

  // Método para obtener los datos del usuario actual (útil para el componente Acogida)
  getCurrentUser() {
    if (isPlatformBrowser(this.platformId)) {
      return {
        id_usuario: this.getUsuarioId(),
        nombre_completo: localStorage.getItem('usuario_nombre'),
        rol: this.getRol(),
        avatar: localStorage.getItem('usuario_avatar')
      };
    }
    return null;
  }

  getUsuarioId(): number | null {
    if (isPlatformBrowser(this.platformId)) {
      const id = localStorage.getItem('usuario_id');
      return id ? parseInt(id, 10) : null;
    }
    return null;
  }
  
  getToken(): string | null {
    if (isPlatformBrowser(this.platformId)) {
      return localStorage.getItem('auth_token');
    }
    return null;
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
  isAdmin(): boolean {
    // Retorna true solo si el rol guardado en localStorage es exactamente 'admin'
    return this.getRol() === 'admin';
  }

  logout(): void {
    if (isPlatformBrowser(this.platformId)) {
      localStorage.removeItem('auth_token');
      localStorage.removeItem('usuario_nombre');
      localStorage.removeItem('usuario_rol');
      localStorage.removeItem('usuario_id');
      localStorage.removeItem('usuario_avatar');
    }
  }
}