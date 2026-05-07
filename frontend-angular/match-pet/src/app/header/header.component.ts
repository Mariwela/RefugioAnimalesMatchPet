import { Component, OnInit, Inject, PLATFORM_ID, ChangeDetectorRef } from '@angular/core';
import { RouterModule, Router } from '@angular/router';
import { AuthService } from '../services/auth';
import { Notificacion } from '../services/notificacion';
import { isPlatformBrowser, CommonModule } from '@angular/common';

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [
    RouterModule,
    CommonModule
  ],
  templateUrl: './header.component.html',
  styleUrl: './header.component.css',
})
export class HeaderComponent implements OnInit {

  private readonly URL_BASE_AVATARS = 'http://localhost/refugioAnimalesMatchPet/backend-php/public/avatars/';

  totalNotificaciones: number = 0;
  mensajeNotificaciones: string = 'No tienes notificaciones nuevas.';

  constructor(
    public authService: AuthService,
    private router: Router,
    private notificacionService: Notificacion,
    private cdr: ChangeDetectorRef,
    @Inject(PLATFORM_ID) private platformId: Object
  ) { }

  ngOnInit(): void {
    if (isPlatformBrowser(this.platformId)) {
      if (this.authService.isLoggedIn()) {
        this.cargarAlertas();
      }
    }
  }

  cargarAlertas(): void {
    this.notificacionService.getResumenNotificaciones().subscribe({
      next: (res) => {
        setTimeout(() => {
          if (res.status === 'success') {
            this.totalNotificaciones = res.alertas.solicitudes_finalizadas;
            this.mensajeNotificaciones = res.mensaje_global;
            this.cdr.detectChanges();
          }
        });
      },
      error: (err) => console.error('Error notificaciones:', err)
    });
  }

  get nombreUsuario(): string {
    if (isPlatformBrowser(this.platformId)) {
      return localStorage.getItem('usuario_nombre') || 'Usuario';
    }
    return 'Usuario';
  }

  get urlAvatar(): string {
    if (isPlatformBrowser(this.platformId)) {
      const avatarGuardado = localStorage.getItem('usuario_avatar');

      if (avatarGuardado && avatarGuardado !== 'undefined' && avatarGuardado !== 'null') {
        return `${this.URL_BASE_AVATARS}${avatarGuardado}`;
      }
    }
    return `${this.URL_BASE_AVATARS}default_avarar.PNG`;
  }

  cerrarSesion() {
    this.authService.logout();
    this.router.navigate(['/']);
  }
}