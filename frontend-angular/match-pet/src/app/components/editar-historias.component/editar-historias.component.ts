import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, Router, RouterModule } from '@angular/router';
import { HistoriaService } from '../../services/historia';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-editar-historias.component',
  imports: [CommonModule, ReactiveFormsModule, RouterModule],
  templateUrl: './editar-historias.component.html',
  styleUrl: './editar-historias.component.css',
})
export class EditarHistoriasComponent implements OnInit {
  fotoSeleccionada: File | null = null;
  vistaPrevia: string | null = null;
  private readonly URL_BASE_IMG = 'http://localhost/RefugioAnimalesMatchPet/backend-php/public/historias/';
  editarForm!: FormGroup;
  idHistoria!: number;
  cargando: boolean = false;
  mensajeExito: string = '';
  mensajeError: string = '';

  constructor(
    private fb: FormBuilder,
    private historiaService: HistoriaService,
    private route: ActivatedRoute,
    private router: Router,
    private cdr: ChangeDetectorRef
  ) { }

  ngOnInit(): void {
    this.idHistoria = Number(this.route.snapshot.paramMap.get('id'));
    this.editarForm = this.fb.group({
      titulo: ['', [Validators.required]],
      contenido: ['', [Validators.required]]
    });
    const historiaData = history.state.historiaData;
    if (historiaData) {
        this.rellenarFormulario(historiaData);
      } else {
        this.historiaService.obtenerHistoriaPorId(this.idHistoria).subscribe({
          next: (res) => this.rellenarFormulario(res.data),
          error: () => this.router.navigate(['/historias']) 
        });
      }
  }

  private rellenarFormulario(data: any): void {
    console.log("Revisando DATA para patchValue:", data);
    const actualData = data.data ? data.data : data;

    this.editarForm.patchValue({
      titulo: actualData.titulo || '',
      contenido: actualData.contenido || ''
    });

    Object.values(this.editarForm.controls).forEach(control => {
      control.markAsDirty();
      control.markAsTouched();
      control.updateValueAndValidity();
    });

    if (actualData.imagen_url) {
      this.vistaPrevia = `${this.URL_BASE_IMG}${actualData.imagen_url}`;
    }

    this.cdr.detectChanges();
    console.log("¿Es válido después del patch?:", this.editarForm.valid);
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

  onSubmit(): void {
    if (this.editarForm.invalid) {
      return;
    }

    this.cargando = true;
    this.mensajeExito = '';
    this.mensajeError = '';

    const { titulo, contenido } = this.editarForm.value;

    this.historiaService.editarHistoria(this.idHistoria, titulo, contenido).subscribe({
      next: (res) => {
        if (this.fotoSeleccionada) {
          this.subirNuevaFoto();
        }else{
          this.finalizarEdicion('Historia actualizada correctamente.');
        }
      },
      error: (err) => {
        this.mensajeError = 'Error al actualizar los datos.';
        this.cargando = false;
      }
    });
  }

  private subirNuevaFoto(): void {
    console.log('ID que se envía al PHP:', this.idHistoria);
    console.log('Archivo que se envía:', this.fotoSeleccionada);

    if (!this.idHistoria || !this.fotoSeleccionada) {
      console.error('Faltan datos antes de enviar');
      return;
    }

    this.historiaService.subirFotoHistoria(this.idHistoria, this.fotoSeleccionada).subscribe({
      next: (res) => {
        this.finalizarEdicion('¡Historia e imagen actualizadas correctamente!');
      },
      error: (err) => {
        console.error('Error capturado en el componente:', err);
        this.mensajeError = 'Error al subir la foto. Mira la consola (F12) -> Network';
        this.cargando = false;
        this.cdr.detectChanges();
      }
    });
  }

  private finalizarEdicion(msg: string): void {
    this.mensajeExito = msg;
    this.cargando = false;
    this.cdr.detectChanges();
    setTimeout(() => {
      this.mensajeExito = '';
      this.cdr.detectChanges();
    }, 3000);
    }
}
