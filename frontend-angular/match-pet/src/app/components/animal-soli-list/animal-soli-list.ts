import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AnimalService } from '../../services/animal';
import { AuthService } from '../../services/auth';
import { RouterLink } from '@angular/router';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-animal-soli-list',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './animal-soli-list.html',
  styleUrl: './animal-soli-list.css',
})
export class AnimalSoliList implements OnInit {
  solicitudes: any[] = [];
  cargando: boolean = true;
  errorMensaje: string = '';
  isAdmin: boolean = false;
  procesandoId: number | null = null;
  comentarioAbiertoId: number | null = null;
  constructor(
    private animalService: AnimalService,
    private authService: AuthService,
    private cdr: ChangeDetectorRef
  ) { }

  ngOnInit(): void {
    this.isAdmin = this.authService.getRol() === 'admin';
    this.cargarSolicitudes();
  }

  cargarSolicitudes(): void {
    this.cargando = true;

    this.animalService.getSolicitudes().subscribe({
      next: (response) => {
        if (response.status === 'success') {
          this.solicitudes = response.data;
        } else {
          this.errorMensaje = response.message || 'Error al obtener datos.';
        }
        this.cargando = false;
        this.cdr.detectChanges();
      },
      error: (error) => {
        this.errorMensaje = 'Ocurrió un error de conexión con el servidor.';
        this.cargando = false;
        this.cdr.detectChanges();
      }
    });
  }

  cambiarEstado(solicitud: any, nuevoEstado: string): void {
    Swal.fire({
      title: `<span style="font-family: 'Playfair Display', serif; font-weight: 700; font-size: 1.4rem; color: #1a3a3a;">¿Deseas añadir un comentario?</span>`,
      html: `<p style="color: #7a7a7a; font-size: 0.95rem; margin-top: 5px;">Cambiando estado a: <b>${nuevoEstado}</b></p>`,
      input: 'text',
      inputPlaceholder: 'Escribe aquí tu observación...',
      showCancelButton: true,
      confirmButtonText: 'Confirmar',
      cancelButtonText: 'Volver',
      confirmButtonColor: '#c3552b',
      cancelButtonColor: '#6c757d',
      
      background: '#fdfbf9',
      padding: '2em',
      didOpen: (popup) => {
        popup.style.borderRadius = '25px';

        const input = popup.querySelector('.swal2-input') as HTMLElement;
        if (input) {
          input.style.borderRadius = '12px';
          input.style.border = '1px solid #d1d1d1';
          input.style.boxShadow = 'none';
        }
      }
    }).then((result) => {
      if (result.isConfirmed) {
        const comentario = result.value || '';
        this.procesandoId = solicitud.id_solicitud;

        this.animalService.gestionarSolicitud(solicitud.id_solicitud, nuevoEstado, comentario).subscribe({
          next: (response) => {
            if (response.status === 'success') {
              solicitud.estado_solicitud = nuevoEstado;
              solicitud.comentario_admin = comentario;
              
              Swal.fire({
                icon: 'success',
                title: `<span style="font-family: 'Playfair Display', serif; font-weight: 700;">¡Actualizado!</span>`,
                text: `La solicitud ahora está como ${nuevoEstado}`,
                confirmButtonColor: '#c3552b',
                background: '#fdfbf9',
                didOpen: (p) => p.style.borderRadius = '25px'
              });
            } else {
              Swal.fire({
                icon: 'error',
                title: 'Error',
                text: response.message,
                background: '#fdfbf9',
                didOpen: (p) => p.style.borderRadius = '25px'
              });
            }
            this.procesandoId = null;
          },
          error: () => {
            Swal.fire({
              icon: 'error',
              title: 'Error de conexión',
              background: '#fdfbf9',
              didOpen: (p) => p.style.borderRadius = '25px'
            });
            this.procesandoId = null;
          }
        });
      }
    });
  }

  aprobarAdopcion(solicitud: any): void {
  Swal.fire({
    title: `<span style="font-family: 'Playfair Display', serif; font-weight: 700; font-size: 1.4rem; color: #1a3a3a;">¿Confirmar adopción?</span>`,
    html: `<p style="color: #7a7a7a; font-size: 0.95rem;">¿Deseas aprobar la adopción de <b>${solicitud.nombre_animal}</b>?<br><br><small>⚠️ Esto rechazará automáticamente las demás solicitudes pendientes.</small></p>`,
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Sí, aprobar',
    cancelButtonText: 'Cancelar',
    confirmButtonColor: '#c3552b',
    cancelButtonColor: '#6c757d',
    
    background: '#fdfbf9',
    padding: '2em',
    didOpen: (popup) => {
      popup.style.borderRadius = '25px';
    }
  }).then((result) => {
    if (result.isConfirmed) {
      this.procesandoId = solicitud.id_solicitud;
      
      this.animalService.validarAdopcion(solicitud.id_solicitud, solicitud.id_animal).subscribe({ 
        next: (response) => {
          if (response.status === 'success') {
            Swal.fire({
              icon: 'success',
              title: `<span style="font-family: 'Playfair Display', serif; font-weight: 700;">¡Aprobado!</span>`,
              text: response.message,
              confirmButtonColor: '#c3552b',
              background: '#fdfbf9',
              didOpen: (p) => p.style.borderRadius = '25px'
            });
            this.cargarSolicitudes();
          } else {
            Swal.fire({
              icon: 'error',
              title: 'Error',
              text: response.message,
              background: '#fdfbf9',
              didOpen: (p) => p.style.borderRadius = '25px'
            });
          }
          this.procesandoId = null;
        },
        error: () => {
          Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Ocurrió un error en el servidor',
            background: '#fdfbf9',
            didOpen: (p) => p.style.borderRadius = '25px'
          });
          this.procesandoId = null;
        }
      });
    }
  });
}

  toggleComentario(id: number): void {
    if (this.comentarioAbiertoId === id) {
      this.comentarioAbiertoId = null;
    } else {
      this.comentarioAbiertoId = id;
    }
  }
}
