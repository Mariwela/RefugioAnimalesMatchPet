import { Component, OnInit, inject, Inject, PLATFORM_ID, ChangeDetectorRef } from '@angular/core';
import { RouterModule, Router } from '@angular/router';
import { AuthService } from '../services/auth';
import { Notificacion } from '../services/notificacion'; // <-- Ajusta la ruta si es necesario
import { isPlatformBrowser, CommonModule } from '@angular/common';

//                                               ^^^^^^^^^^^^^^^^^ Asegúrate de que esté aquí
@Component({
  selector: 'app-header',
  standalone: true,
  imports: [RouterModule, CommonModule],
  templateUrl: './header.component.html',
  styleUrl: './header.component.css',
})
export class HeaderComponent implements OnInit {

  private readonly URL_BASE_AVATARS = 'http://localhost/refugioAnimalesMatchPet/backend-php/public/avatars/';

  // 👇 NUEVAS VARIABLES PARA LA CAMPANITA 👇
  totalNotificaciones: number = 0;
  mensajeNotificaciones: string = 'No tienes notificaciones nuevas.';

  constructor(
    public authService: AuthService,
    private router: Router,
    private notificacionService: Notificacion,
    private cdr: ChangeDetectorRef,// <-- Inyectar el nuevo servicio
    @Inject(PLATFORM_ID) private platformId: Object
  ) { }

  // 👇 INICIALIZAMOS LAS NOTIFICACIONES 👇
  ngOnInit(): void {
    // Protegemos la llamada para que solo ocurra en el navegador (no en el servidor)
    if (isPlatformBrowser(this.platformId)) {
      if (this.authService.isLoggedIn()) {
        this.cargarAlertas();
      }
    }
  }

  // 👇 FUNCIÓN PARA BUSCAR ALERTAS 👇
  cargarAlertas(): void {
    this.notificacionService.getResumenNotificaciones().subscribe({
      next: (res) => {
        // Usamos setTimeout para evitar el error ExpressionChangedAfterItHasBeenCheckedError
        setTimeout(() => {
          if (res.status === 'success') {
            this.totalNotificaciones = res.alertas.solicitudes_finalizadas;
            this.mensajeNotificaciones = res.mensaje_global;

            // Ahora 'this.cdr' sí existe y funcionará perfectamente
            this.cdr.detectChanges();
          }
        });
      },
      error: (err) => console.error('Error notificaciones:', err)
    });
  }
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

      if (avatarGuardado && avatarGuardado !== 'undefined' && avatarGuardado !== 'null') {
        return `${this.URL_BASE_AVATARS}${avatarGuardado}`;
      }
    }
    // Cambiado para coincidir exactamente con tu servidor
    return `${this.URL_BASE_AVATARS}default_avarar.PNG`;
  }

  cerrarSesion() {
    this.authService.logout();
    this.router.navigate(['/']);
  }
}