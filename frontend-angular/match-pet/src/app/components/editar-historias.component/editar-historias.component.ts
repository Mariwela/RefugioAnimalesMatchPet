import { Component, OnInit } from '@angular/core';
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
  editarForm!: FormGroup;
  idHistoria!: number;
  cargando: boolean = false;
  mensajeExito: string = '';
  mensajeError: string = '';

  constructor(
    private fb: FormBuilder,
    private historiaService: HistoriaService,
    private route: ActivatedRoute,
    private router: Router
  ) { }

  ngOnInit(): void {
    // 1. Obtenemos el ID de la URL
    this.idHistoria = Number(this.route.snapshot.paramMap.get('id'));

    // 2. Inicializamos el formulario vacío
    this.editarForm = this.fb.group({
      titulo: ['', [Validators.required, Validators.minLength(5)]],
      contenido: ['', [Validators.required, Validators.minLength(20)]]
    });

    // 3. LA MAGIA: Recuperamos los datos que nos pasó el componente de la lista
    const historiaData = history.state.historiaData;

    // Si la información existe, rellenamos el formulario automáticamente
    if (historiaData) {
      this.editarForm.patchValue({
        titulo: historiaData.titulo,
        contenido: historiaData.contenido
      });
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
      next: (respuesta) => {
        this.cargando = false; // Apagamos el botón
        this.mensajeExito = respuesta.message || 'Historia actualizada con éxito.';

        setTimeout(() => {
          this.router.navigate(['/historias']);
        }, 2000);
      },
      error: (err) => {
        // IMPRIMIMOS EL ERROR PARA VER QUÉ PASA
        console.error('Error al guardar la historia:', err);

        this.cargando = false; // SIEMPRE apagamos el botón aquí también

        // Extraemos el mensaje de error de forma segura
        this.mensajeError = err.error?.message || err.message || 'Error de conexión con el servidor.';
      }
    });
  }
}
