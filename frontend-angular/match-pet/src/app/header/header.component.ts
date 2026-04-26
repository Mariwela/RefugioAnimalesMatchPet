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

  cerrarSesion() {
    this.authService.logout();
    this.router.navigate(['/']);
  }
}
