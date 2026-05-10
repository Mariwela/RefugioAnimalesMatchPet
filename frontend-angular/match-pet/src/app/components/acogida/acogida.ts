import { ChangeDetectorRef, Component, inject, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { AuthService } from '../../services/auth';
import { UsuarioService } from '../../services/usuario';
import { RouterLink } from '@angular/router';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-acogida',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink],
  templateUrl: './acogida.html',
  styleUrl: './acogida.css',
})
export class Acogida implements OnInit{
  public authService = inject(AuthService);
  public usuarioService = inject(UsuarioService);
  private cdr = inject(ChangeDetectorRef);

  mensajeExito = '';
  mensajeError = '';
  guardando = false;
  notificacionVisible = true;

  perfilAcogida = {
    pref_especie: 'Cualquiera',
    pref_energia: 'Media',
    pref_vivienda: 'Piso',
    bio_experiencia: '',
    disponibilidad_acogida: 'disponible'
  };

  ngOnInit(): void {
    const id = this.authService.getUsuarioId();
    if (id) {
      this.usuarioService.verPerfil(id).subscribe({
        next: (data) => {
          this.perfilAcogida = { ...this.perfilAcogida, ...data };
          this.cdr.detectChanges();
        },
        error: (err) => console.error('Error al cargar perfil', err)
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

  guardarPerfil(form: NgForm): void {
    if (!form.dirty) {
      this.mensajeError = 'No hay cambios para guardar.';
      this.notificacionFadeOut();
      return;
    }
    const id = this.authService.getUsuarioId();
    if (!id) {
      this.mensajeError = 'Sesión expirada. Por favor, vuelve a entrar.';
      this.notificacionFadeOut();
      return;
    }

    this.guardando = true;
    const datosAEnviar = { 
      id_usuario: id, 
      ...this.perfilAcogida
    };

    this.usuarioService.editarPerfil(datosAEnviar).subscribe({
      next: (res) => {
        this.mensajeExito = res.message || 'Perfil de acogida actualizado correctamente.';
        this.guardando = false;
        form.resetForm(this.perfilAcogida);
        this.cdr.detectChanges();
        this.notificacionFadeOut();
      },
      error: (err) => {
        this.mensajeError = 'Error al guardar el perfil de acogida.';
        this.guardando = false;
        this.cdr.detectChanges();
        this.notificacionFadeOut();
      }
    });
  }
}

