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
    // Si el formulario no es válido, no hacemos nada
    if (this.editarForm.invalid) {
      return;
    }

    this.cargando = true;
    this.mensajeExito = '';
    this.mensajeError = '';

    const { titulo, contenido } = this.editarForm.value;

    // 3. Llamamos al servicio que creamos antes
    this.historiaService.editarHistoria(this.idHistoria, titulo, contenido).subscribe({
      next: (respuesta) => {
        this.cargando = false;
        this.mensajeExito = respuesta.message || 'Historia actualizada. Queda pendiente de revisión.';

        // Redirigimos al usuario a sus historias después de 2 segundos
        setTimeout(() => {
          this.router.navigate(['/mis-historias']); // Cambia esta ruta según tu proyecto
        }, 2000);
      },
      error: (error) => {
        this.cargando = false;
        this.mensajeError = error.error?.message || 'Ocurrió un error al actualizar la historia.';
      }
    });
  }
}
