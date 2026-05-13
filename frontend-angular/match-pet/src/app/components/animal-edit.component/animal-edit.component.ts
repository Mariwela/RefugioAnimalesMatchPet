import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { AnimalService } from '../../services/animal';
import { CommonModule } from '@angular/common';
import { AuthService } from '../../services/auth';
import { HttpClient, HttpHeaders } from '@angular/common/http';

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
  mensajeExito: string = '';
  mensajeError: string = '';
  notificacionVisible: boolean = true;
  idAnimal!: number;
  borrando: boolean = false;
  fotosGaleria: any[] = [];
  fotoPortadaUrl: string = '';
  nuevaPortada: File | null = null;
  nuevaPortadaPreview: string | null = null;
  nuevasFotosGaleria: File[] = [];
  nuevasFotosPreview: string[] = [];
  subiendoFotos: boolean = false;

  public baseImageUrl = 'http://localhost/RefugioAnimalesMatchPet/backend-php/public/img/animales/';
  
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

    if (rolActual !== 'admin') {
      this.mensaje = '⛔ Acceso denegado. No tienes permisos de administrador.';
      this.cargando = false;

      setTimeout(() => this.router.navigate(['/animales']), 3000);

      return;
    }

    const idString = this.route.snapshot.paramMap.get('id');
    if (idString) {
      this.idAnimal = Number(idString);
      this.cargarDatosAnimal(this.idAnimal);
    } else {
      this.mensaje = 'ID no válido';
      this.cargando = false;
    }
  }

  notificacionFadeOut(): void {
    this.notificacionVisible = true;
    this.cdr.detectChanges();

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

  cargarDatosAnimal(id: number): void {
    console.log('1. Iniciando petición para el animal ID:', id);

    this.animalService.getAnimalById(id).subscribe({
      next: (res) => {
        console.log('2. Respuesta del PHP recibida:', res);

        if (res.status === 'success') {
          try {
            const animalData = res.data;
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

            this.animalForm.patchValue(animalData);
            this.fotoPortadaUrl = animalData.foto_portada;
            this.fotosGaleria = res.data.galeria || [];
            console.log('4. ¡Formulario rellenado con éxito!');

          } catch (error) {
            console.error('❌ Error al meter los datos al formulario:', error);
            this.mensaje = 'Hubo un problema al procesar los datos.';
          }
        } else {
          this.mensaje = 'Error al cargar datos: ' + res.message;
        }

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

  guardarCambios(): void {
    if (this.animalForm.invalid) {
      this.mensajeError = 'Por favor, rellena todos los campos obligatorios.';
      this.notificacionFadeOut();
      return;
    }

    if (this.animalForm.pristine) {
      this.mensajeError = 'No has realizado ningún cambio para guardar.';
      this.notificacionFadeOut();
      return;
    }

    this.guardando = true;
    this.mensaje = '';

    this.animalService.actualizarAnimal(this.animalForm.value).subscribe({
      next: (res) => {
        this.guardando = false;
        if (res.status === 'success') {
          this.mensaje = '¡Ficha de animal actualizada correctamente!';
          this.animalForm.markAsPristine();
          this.notificacionFadeOut();
          setTimeout(() => this.router.navigate(['/animal', this.idAnimal]), 2000);
        } else {
          this.mensaje = 'Error: ' + res.message;
          this.notificacionFadeOut();
        }
      },
      error: (err) => {
        this.guardando = false;
        this.mensaje = 'Error al guardar los cambios.';
        this.notificacionFadeOut();
        console.error(err);
      }
    });
  }

  cancelar(): void {
    this.router.navigate(['/animal', this.idAnimal]);
  }

  eliminarAnimal(): void {
    const confirmar = confirm(`¿Estás seguro de eliminar a ${this.animalForm.value.nombre}? Esta acción borrará permanentemente el registro y todas sus fotos.`);

    if (!confirmar) return;

    this.borrando = true;

    this.animalService.eliminarAnimal(this.idAnimal).subscribe({
      next: (res) => {
        this.borrando = false;
        if (res.status === 'success') {
          this.mensajeExito = '¡Animal y fotos eliminados correctamente!';
          this.notificacionFadeOut();

          setTimeout(() => this.router.navigate(['/animales']), 2000);
        } else {
          this.mensajeError = 'Error: ' + res.message;
          this.notificacionFadeOut();
        }
      },
      error: (err) => {
        this.borrando = false;
        this.mensajeError = 'Error técnico al intentar eliminar.';
        this.notificacionFadeOut();
        console.error(err);
      }
    });
  }

  onNuevaPortada(event: any): void {
    const file = event.target.files[0];
    if (!file) return;
    this.nuevaPortada = file;
    const reader = new FileReader();
    reader.onload = (e: any) => {
      this.nuevaPortadaPreview = e.target.result;
      this.cdr.detectChanges();
    };
    reader.readAsDataURL(file);
  }

  onNuevasFotosGaleria(event: any): void {
    const files: FileList = event.target.files;
    if (!files) return;
    Array.from(files).forEach(file => {
      const reader = new FileReader();
      reader.onload = (e: any) => {
        this.nuevasFotosPreview.push(e.target.result);
        this.nuevasFotosGaleria.push(file);
        this.cdr.detectChanges();
      };
      reader.readAsDataURL(file);
    });
  }

  getFotoUrl(ruta: string): string {
    if (!ruta) return this.baseImageUrl + 'default.jpg';
    if (ruta.startsWith('http')) return ruta;
    return this.baseImageUrl + ruta;
  }

  quitarNuevaFotoGaleria(index: number): void {
    this.nuevasFotosGaleria.splice(index, 1);
    this.nuevasFotosPreview.splice(index, 1);
  }

  eliminarFotoExistente(foto: any): void {
    if (!confirm('¿Eliminar esta foto?')) return;
    this.animalService.eliminarFotoAnimal({ id_foto: foto.id_foto }).subscribe({
      next: (res) => {
        if (res.status === 'success') {
          this.fotosGaleria = this.fotosGaleria.filter(f => f.id_foto !== foto.id_foto);
          this.cdr.detectChanges();
        } else {
          this.mensajeError = 'Error al eliminar la foto';
          this.notificacionFadeOut();
        }
      },
      error: () => {
        this.mensajeError = 'Error de conexión al eliminar';
        this.notificacionFadeOut();
      }
    });
  }

  async guardarFotos(): Promise<void> {
    if (!this.nuevaPortada && this.nuevasFotosGaleria.length === 0) return;

    this.subiendoFotos = true;
    this.cdr.detectChanges();

    if (this.nuevaPortada) {
      const fd = new FormData();
      fd.append('foto', this.nuevaPortada);
      fd.append('id_animal', this.idAnimal.toString());
      fd.append('es_portada', '1');
      await this.animalService.subirFotoAnimal(fd).toPromise();
      this.nuevaPortada = null;
      this.nuevaPortadaPreview = null;
    }

    for (const foto of this.nuevasFotosGaleria) {
      const fd = new FormData();
      fd.append('foto', foto);
      fd.append('id_animal', this.idAnimal.toString());
      fd.append('es_portada', '0');
      await this.animalService.subirFotoAnimal(fd).toPromise();
    }

    this.nuevasFotosGaleria = [];
    this.nuevasFotosPreview = [];
    this.subiendoFotos = false;
    this.mensajeExito = 'Fotos actualizadas correctamente';
    this.notificacionFadeOut();

    this.cargarDatosAnimal(this.idAnimal);
  }
}
