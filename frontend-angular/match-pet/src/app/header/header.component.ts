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
  listaNotificaciones: any[] = [];
  mostrarDropdown: boolean = false;

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

  toggleNotificaciones(): void {
    this.mostrarDropdown = !this.mostrarDropdown;
  }

  cargarAlertas(): void {
    this.notificacionService.getResumenNotificaciones().subscribe({
      next: (res) => {
        setTimeout(() => {
          if (res.status === 'success') {

            // 🔥 AÑADE ESTA LÍNEA PARA VER QUÉ LLEGA EXACTAMENTE 🔥
            console.log("Respuesta del servidor:", res);

            this.totalNotificaciones = res.alertas.solicitudes_finalizadas;
            this.mensajeNotificaciones = res.mensaje_global;

            // Asignamos la lista. Si no existe, se pone un array vacío []
            this.listaNotificaciones = res.notificaciones_detalle || [];

            this.cdr.detectChanges();
          }
        });
      },
      error: (err) => console.error('Error notificaciones:', err)
    });
  }

  // 👇 NUEVA FUNCIÓN PARA ELIMINAR LA NOTIFICACIÓN 👇
  eliminarNotificacion(idNotificacion: number, event: Event): void {
    // Evita que el clic cierre el dropdown
    event.stopPropagation();

    // Llama al servicio para marcarla como leída en el backend PHP
    // Nota: Asegúrate de haber creado 'marcarComoLeida' en tu notificacion.ts
    this.notificacionService.marcarComoLeida(idNotificacion).subscribe({
      next: (res: any) => {
        if (res.status === 'success') {

          // Quitamos la notificación del array local
          this.listaNotificaciones = this.listaNotificaciones.filter(
            (noti) => noti.id !== idNotificacion
          );

          // Actualizamos el contador de notificaciones
          if (this.totalNotificaciones > 0) {
            this.totalNotificaciones--;
          }

          // Si llegamos a cero, actualizamos el mensaje
          if (this.totalNotificaciones === 0) {
            this.mensajeNotificaciones = 'No tienes notificaciones nuevas.';
          }

          // Forzamos la actualización de la vista
          this.cdr.detectChanges();
        }
      },
      error: (err: any) => console.error('Error al eliminar la notificación:', err)
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