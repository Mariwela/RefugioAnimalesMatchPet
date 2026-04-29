import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { AnimalService } from '../../services/animal';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-animal-edit.component',
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './animal-edit.component.html',
  styleUrl: './animal-edit.component.css',
})
export class AnimalEditComponent implements OnInit {
  animalForm!: FormGroup;
  cargando: boolean = true;
  guardando: boolean = false;
  mensaje: string = '';
  idAnimal!: number;

  constructor(
    private fb: FormBuilder,
    private route: ActivatedRoute,
    private router: Router,
    private animalService: AnimalService
  ) {
    this.iniciarFormulario();
  }

  ngOnInit(): void {
    const idString = this.route.snapshot.paramMap.get('id');
    if (idString) {
      this.idAnimal = Number(idString);
      this.cargarDatosAnimal(this.idAnimal);
    } else {
      this.mensaje = 'ID no válido';
      this.cargando = false;
    }
  }

  // 1. Estructuramos el formulario idéntico a tu tabla 'animales'
  iniciarFormulario(): void {
    this.animalForm = this.fb.group({
      id_animal: ['', Validators.required],
      nombre: ['', Validators.required],
      especie: ['', Validators.required],
      raza: [''],
      sexo: ['', Validators.required],
      microchip: [''],
      fecha_nacimiento: [''],
      tamano: ['Mediano'],
      peso: [''],
      descripcion: [''],
      nivel_energia: ['Media'],
      apto_pisos: [false],
      sociable_ninos: [false],
      sociable_perros: [false],
      sociable_gatos: [false],
      enfermedad_cronica: [false],
      esterilizado: [false],
      nivel_paciencia: ['Baja'],
      es_para_principiantes: [true],
      aviso_importante: [''],
      estado: ['Disponible']
    });
  }

  // 2. Traemos los datos de la DB y los metemos en el formulario
  cargarDatosAnimal(id: number): void {
    this.animalService.getAnimalById(id).subscribe({
      next: (res) => {
        if (res.status === 'success') {
          // patchValue rellena automáticamente los campos que coincidan
          this.animalForm.patchValue(res.data);
        } else {
          this.mensaje = 'Error al cargar datos: ' + res.message;
        }
        this.cargando = false;
      },
      error: () => {
        this.mensaje = 'Error de conexión con el servidor.';
        this.cargando = false;
      }
    });
  }

  // 3. Enviamos los datos actualizados a tu PHP
  guardarCambios(): void {
    if (this.animalForm.invalid) {
      this.mensaje = 'Revisa los campos obligatorios.';
      return;
    }

    this.guardando = true;
    this.mensaje = '';

    this.animalService.actualizarAnimal(this.animalForm.value).subscribe({
      next: (res) => {
        this.guardando = false;
        if (res.status === 'success') {
          this.mensaje = '¡Animal actualizado correctamente!';
          // Opcional: Volver al detalle tras 2 segundos
          setTimeout(() => this.router.navigate(['/animal', this.idAnimal]), 2000);
        } else {
          this.mensaje = 'Error: ' + res.message;
        }
      },
      error: (err) => {
        this.guardando = false;
        this.mensaje = 'Error al guardar los cambios.';
        console.error(err);
      }
    });
  }

  cancelar(): void {
    this.router.navigate(['/animal', this.idAnimal]);
  }
}
