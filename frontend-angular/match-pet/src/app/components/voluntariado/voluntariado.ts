import { Component, OnInit, inject, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../../services/auth';
import { UsuarioService } from '../../services/usuario';

@Component({
  selector: 'app-voluntariado',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './voluntariado.html',
  styleUrls: ['./voluntariado.css']
})

export class Voluntariado implements OnInit {
  public authService = inject(AuthService);
  public usuarioService = inject(UsuarioService);

  perfilVoluntario = {
    disponibilidad_voluntario: 'si',
    area_interes: 'Paseo de perros',
    horario_voluntario: '',
    comentarios_voluntario: ''
  };

  opcionSeleccionada = 'Paseo de perros';
  areaPersonalizada = '';
  opcionesFijas = ['Paseo de perros', 'Cuidado y Limpieza', 'Eventos y Difusión', 'Apoyo Veterinario'];

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

  guardarVoluntariado(): void {
    const id = this.authService.getUsuarioId();
    
    this.perfilVoluntario.disponibilidad_voluntario = 'si';

    const datos = { 
      id_usuario: id, ...this.perfilVoluntario
    };

    this.usuarioService.editarPerfil(datos).subscribe({
      next: (res) => {
        alert('¡Tu perfil de voluntario se ha actualizado con éxito!');
      },
      error: (err) => {
        alert('Hubo un error al guardar los datos.');
      }
    });
  }
}