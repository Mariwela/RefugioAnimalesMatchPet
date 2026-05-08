import { CommonModule } from '@angular/common';
import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { HistoriaService } from '../../services/historia';

@Component({
  selector: 'app-publicar-historias.component',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './publicar-historias.component.html',
  styleUrl: './publicar-historias.component.css',
})
export class PublicarHistoriasComponent implements OnInit {
  animalesAdoptados: any[] = []; // <-- Guardaremos aquí sus animales
  cargandoInicial: boolean = true;

  datosFormulario = {
    id_animal: null as number | null,
    titulo: '',
    contenido: ''
  };

  cargando: boolean = false;
  mensajeExito: string = '';
  mensajeError: string = '';

  constructor(private historiaService: HistoriaService, private cdr: ChangeDetectorRef) { }

  ngOnInit(): void {
    console.log('1. Arranca ngOnInit y pide los animales...');

    this.historiaService.obtenerMisAdoptados().subscribe({
      next: (res) => {
        console.log('2. ¡Angular recibió la respuesta!', res);

        if (res.status === 'success') {
          this.animalesAdoptados = res.data;
          console.log('3. Animales guardados en la variable:', this.animalesAdoptados);
        } else {
          console.log('El status no fue success:', res.status);
        }

        this.cargandoInicial = false; // Esto quita el mensaje de "Verificando..."
        this.cdr.detectChanges(); // Forzar la detección de cambios
      },
      error: (err) => {
        console.error('2. Ocurrió un error en la suscripción:', err);
        this.cargandoInicial = false;
        this.cdr.detectChanges(); // Forzar la detección de cambios
      }
    });
  }

  enviarHistoria(): void {
    if (!this.datosFormulario.id_animal || !this.datosFormulario.titulo || !this.datosFormulario.contenido) {
      this.mensajeError = 'Por favor, rellena todos los campos.';
      return;
    }

    this.cargando = true;
    this.mensajeError = '';
    this.mensajeExito = '';

    this.historiaService.publicarHistoria(this.datosFormulario as any).subscribe({
      next: (respuesta) => {
        if (respuesta.status === 'success') {
          this.mensajeExito = '¡Historia enviada a moderación con éxito!';
          this.datosFormulario = { id_animal: null, titulo: '', contenido: '' };
        }
        this.cargando = false;
      },
      error: (err) => {
        this.mensajeError = err.error?.message || 'Hubo un error al publicar la historia.';
        this.cargando = false;
      }
    });
  }
}
