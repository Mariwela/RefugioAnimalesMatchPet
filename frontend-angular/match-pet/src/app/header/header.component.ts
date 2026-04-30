import { Component, Inject, PLATFORM_ID } from '@angular/core';
import { RouterModule, Router } from '@angular/router';
import { AuthService } from '../services/auth';
import { isPlatformBrowser, CommonModule } from '@angular/common';


@Component({
  selector: 'app-header',
  standalone: true,
  imports: [RouterModule, CommonModule],
  templateUrl: './header.component.html',
  styleUrl: './header.component.css',
})
export class HeaderComponent {
  private readonly URL_BASE_AVATARS = 'http://localhost/refugioAnimalesMatchPet/backend-php/public/avatars/';
  constructor(
    public authService: AuthService,
    private router: Router,
    @Inject(PLATFORM_ID) private platformId: Object // <-- Inyectar plataforma aquí también
  ) { }

  get nombreUsuario(): string {
    // Protegemos el acceso al localStorage
    if (isPlatformBrowser(this.platformId)) {
      return localStorage.getItem('usuario_nombre') || 'Usuario';
    }
    return 'Usuario'; // Valor por defecto durante el renderizado del servidor
  }

  // Getter para la URL del Avatar
  get urlAvatar(): string {
    if (isPlatformBrowser(this.platformId)) {
      const avatarGuardado = localStorage.getItem('usuario_avatar');
      
      if (avatarGuardado) {
        return '${this.URL_BASE_AVATARS}${avatarGuardado}';
      }
    }
    return '${this.URL_BASE_AVATARS}default_avatar.png';
  }

  cerrarSesion() {
    this.authService.logout();
    this.router.navigate(['/']);
  }
}
