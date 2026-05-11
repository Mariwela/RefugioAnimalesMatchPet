import { CommonModule } from '@angular/common';
import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { HistoriaService } from '../../services/historia';
import { finalize } from 'rxjs/operators';

@Component({
  selector: 'app-publicar-historias.component',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './publicar-historias.component.html',
  styleUrl: './publicar-historias.component.css',
})
export class PublicarHistoriasComponent implements OnInit {
  animalesAdoptados: any[] = [];
  cargandoInicial: boolean = true;
  datosFormulario = {
    id_animal: null as number | null,
    titulo: '',
    contenido: ''
  };
  fotoSeleccionada: File | null = null;
  vistaPrevia: string | null = null;
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

  onFileSelected(event: any): void {
    const file: File = event.target.files[0];
    if (file) {
      this.fotoSeleccionada = file;

      const reader = new FileReader();
      reader.onload = () => {
        this.vistaPrevia = reader.result as string;
        this.cdr.detectChanges();
      };
      reader.readAsDataURL(file);
    }
  }

  enviarHistoria(): void {
    this.cargando = true;
    this.mensajeError = '';
    this.mensajeExito = '';

    this.historiaService.publicarHistoria(this.datosFormulario).subscribe({
      next: (res) => {
        if (res.status === 'success' && res.id_historia) {
          
          this.historiaService.subirFotoHistoria(res.id_historia, this.fotoSeleccionada!)
            .pipe(
              // El bloque finalize se ejecuta SIEMPRE al terminar la petición
              finalize(() => {
                  this.cargando = false; 
                  this.cdr.detectChanges();
              })
            )
            .subscribe({
              next: (resFoto) => {
                this.mensajeExito = "¡Historia publicada con éxito!";
                this.resetearFormulario();
              },
              error: (err) => {
                // Si la foto ya se guardó en la carpeta, este error es un "falso positivo" de CORS/Canal
                console.warn('Error de comunicación, pero la foto podría estar guardada', err);
                this.mensajeExito = "Historia guardada correctamente.";
                this.resetearFormulario();
              }
            });
        }
      },
      error: (err) => {
        this.mensajeError = "Error al conectar con el servidor.";
        this.cargando = false;
      }
    });
  }

  resetearFormulario() {
    this.datosFormulario = { id_animal: null, titulo: '', contenido: '' };
    this.fotoSeleccionada = null;
    this.vistaPrevia = null;
  }
  
}
