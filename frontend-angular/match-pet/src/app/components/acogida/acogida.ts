import { Component, inject, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { AuthService } from '../../services/auth';
import { UsuarioService } from '../../services/usuario';


@Component({
  selector: 'app-acogida',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './acogida.html',
  styleUrl: './acogida.css',
})
export class Acogida implements OnInit{

  public authService = inject(AuthService);
  public usuarioService = inject(UsuarioService);

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
        },
        error: (err) => console.error('Error al cargar perfil', err)
      });
    }
  }

  guardarPerfil(): void {
    const id = this.authService.getUsuarioId();
    if (!id) {
      alert('Sesión expirada. Por favor, vuelve a entrar.');
      return;
    }

    const datosAEnviar = { 
      id_usuario: id, 
      disponibilidad_acogida: this.perfilAcogida.disponibilidad_acogida, 
      pref_especie: this.perfilAcogida.pref_especie,
      pref_energia: this.perfilAcogida.pref_energia,
      pref_vivienda: this.perfilAcogida.pref_vivienda,
      bio_experiencia: this.perfilAcogida.bio_experiencia
    };

    this.usuarioService.editarPerfil(datosAEnviar).subscribe({
      next: (res) => {
        console.log('Respuesta éxito:', res);
        alert('¡Perfil de acogida actualizado correctamente!');
      },
      error: (err) => {
        console.error('Error al guardar:', err);
      }
    });
  }
}

