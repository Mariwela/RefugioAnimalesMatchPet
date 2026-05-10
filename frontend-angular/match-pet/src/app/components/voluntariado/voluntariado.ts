import { Component, OnInit, inject, ChangeDetectorRef } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../../services/auth';
import { UsuarioService } from '../../services/usuario';
import { RouterLink } from '@angular/router';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-voluntariado',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink],
  templateUrl: './voluntariado.html',
  styleUrls: ['./voluntariado.css']
})

export class Voluntariado implements OnInit {
  public authService = inject(AuthService);
  public usuarioService = inject(UsuarioService);
  private cdr = inject(ChangeDetectorRef);

  perfilVoluntario = {
    disponibilidad_voluntario: 'si',
    area_interes: 'Paseo de perros',
    horario_voluntario: '',
    comentarios_voluntario: ''
  };

  opcionSeleccionada = 'Paseo de perros';
  areaPersonalizada = '';
  opcionesFijas = ['Paseo de perros', 'Cuidado y Limpieza', 'Eventos y Difusión', 'Apoyo Veterinario'];

  mensajeExito = '';
  mensajeError = '';
  guardando = false;
  notificacionVisible = true;

  ngOnInit(): void {
    const id = this.authService.getUsuarioId();
    if (id) {
      this.usuarioService.verPerfil(id).subscribe({
        next: (data) => {
          this.perfilVoluntario = { ...this.perfilVoluntario, ...data };
          
          const valorCargado = this.perfilVoluntario.area_interes;
          if (valorCargado && !this.opcionesFijas.includes(valorCargado)) {
            this.opcionSeleccionada = 'Otros';
            this.areaPersonalizada = valorCargado;
          } else {
            this.opcionSeleccionada = valorCargado || 'Paseo de perros';
          }
        },
        error: (err) => console.error('Error cargando perfil:', err)
      });
    }
  }

  notificacionFadeOut(): void {
    this.notificacionVisible = true;
    setTimeout(() => {
      this.notificacionVisible = false;
      this.cdr.detectChanges();

      setTimeout(() => {
        this.mensajeExito = '';
        this.mensajeError = '';
        this.notificacionVisible = true;
        this.cdr.detectChanges();
      }, 1000);
    }, 4000);
  }

  gestionarCambioArea(): void {
    if (this.opcionSeleccionada !== 'Otros') {
      this.perfilVoluntario.area_interes = this.opcionSeleccionada;
      this.areaPersonalizada = '';
    } else {
      this.perfilVoluntario.area_interes = this.areaPersonalizada;
    }
  }

  actualizarAreaTexto(): void {
    if (this.opcionSeleccionada === 'Otros') {
      this.perfilVoluntario.area_interes = this.areaPersonalizada;
    }
  }

  guardarVoluntariado(form: NgForm): void {
    if (!form.dirty) {
      this.mensajeError = 'No hay cambios para guardar.';
      this.notificacionFadeOut();
      return;
    }
    const id = this.authService.getUsuarioId();
    if (!id) {
      this.mensajeError = 'Debes iniciar sesión para realizar esta acción.';
      this.notificacionFadeOut();
      return;
    }

    this.guardando = true;
    this.perfilVoluntario.disponibilidad_voluntario = 'si';

    const datos = { 
      id_usuario: id, 
      ...this.perfilVoluntario
    };

    this.usuarioService.editarPerfil(datos).subscribe({
      next: (res) => {
        this.mensajeExito = res.message || '¡Perfil de voluntario actualizado!';
        this.guardando = false;
        form.resetForm({
          area_interes: this.opcionSeleccionada,
          area_interes_texto: this.areaPersonalizada,
          horario_voluntario: this.perfilVoluntario.horario_voluntario,
          comentarios_voluntario: this.perfilVoluntario.comentarios_voluntario
        });
        this.cdr.detectChanges();
        this.notificacionFadeOut();
      },
      error: (err) => {
        this.mensajeError = err.error?.message || 'Error al guardar los datos.';
        this.guardando = false;
        this.cdr.detectChanges();
        this.notificacionFadeOut();
      }
    });
  }
}