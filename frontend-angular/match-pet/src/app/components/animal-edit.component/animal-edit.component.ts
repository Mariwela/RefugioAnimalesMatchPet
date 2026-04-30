import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { AnimalService } from '../../services/animal';
import { CommonModule } from '@angular/common';
import { AuthService } from '../../services/auth';

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
    private animalService: AnimalService,
    private authService: AuthService,
    private cdr: ChangeDetectorRef
  ) {
    this.iniciarFormulario();
  }

  ngOnInit(): void {
    const rolActual = this.authService.getRol();

    // 1. BARRERA DE SEGURIDAD: Si no es admin, lo bloqueamos inmediatamente
    if (rolActual !== 'admin') {
      this.mensaje = '⛔ Acceso denegado. No tienes permisos de administrador.';
      this.cargando = false;

      // Opcional: Lo expulsamos de vuelta a la lista tras 3 segundos
      setTimeout(() => this.router.navigate(['/animales']), 3000);

      return; // ¡ESTO ES CLAVE! Detiene la función aquí mismo. No lee más código.
    }

    // 2. Si pasa la barrera (es admin), entonces sí buscamos el ID y cargamos los datos
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
  // 2. Traemos los datos de la DB y los metemos en el formulario
  // 2. Traemos los datos de la DB y los metemos en el formulario
  cargarDatosAnimal(id: number): void {
    console.log('1. Iniciando petición para el animal ID:', id);

    this.animalService.getAnimalById(id).subscribe({
      next: (res) => {
        console.log('2. Respuesta del PHP recibida:', res);

        if (res.status === 'success') {
          try {
            const animalData = res.data;

            // TRADUCCIÓN DE DATOS PARA ANGULAR
            animalData.apto_pisos = animalData.apto_pisos == 1;
            animalData.sociable_ninos = animalData.sociable_ninos == 1;
            animalData.sociable_perros = animalData.sociable_perros == 1;
            animalData.sociable_gatos = animalData.sociable_gatos == 1;
            animalData.enfermedad_cronica = animalData.enfermedad_cronica == 1;
            animalData.esterilizado = animalData.esterilizado == 1;
            animalData.es_para_principiantes = animalData.es_para_principiantes == 1;

            animalData.aviso_importante = animalData.aviso_importante || '';
            animalData.raza = animalData.raza || '';
            animalData.microchip = animalData.microchip || '';

            console.log('3. Datos traducidos, listos para el formulario:', animalData);

            // Rellenamos el formulario
            this.animalForm.patchValue(animalData);
            console.log('4. ¡Formulario rellenado con éxito!');

          } catch (error) {
            console.error('❌ Error al meter los datos al formulario:', error);
            this.mensaje = 'Hubo un problema al procesar los datos.';
          }
        } else {
          this.mensaje = 'Error al cargar datos: ' + res.message;
        }

        // Sea cual sea el resultado, quitamos la pantalla de carga
        this.cargando = false;
        this.cdr.detectChanges();
      },
      error: (err) => {
        console.error('❌ Error crítico en la conexión:', err);
        this.mensaje = 'Error de conexión con el servidor.';
        this.cargando = false;
        this.cdr.detectChanges();
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
