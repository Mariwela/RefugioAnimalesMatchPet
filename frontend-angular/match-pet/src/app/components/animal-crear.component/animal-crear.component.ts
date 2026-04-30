import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Component({
  selector: 'app-animal-crear.component',
  imports: [ReactiveFormsModule, CommonModule],
  templateUrl: './animal-crear.component.html',
  styleUrl: './animal-crear.component.css',
})
export class AnimalCrearComponent {
  private fb = inject(FormBuilder);
  private http = inject(HttpClient);

  animalForm: FormGroup = this.fb.group({
    nombre: ['', Validators.required],
    especie: ['', Validators.required],
    raza: [''],
    sexo: [''],
    fecha_nacimiento: [''],
    tamano: [''],
    descripcion: ['']
  });

  mensaje: string = '';
  esError: boolean = false;
  cargando: boolean = false;

  // 👇 Variable para guardar la foto que selecciona el usuario
  fotoSeleccionada: File | null = null;

  // 👇 Método que se ejecuta cuando el usuario elige una imagen
  onFileSeleccionada(event: any) {
    const file = event.target.files[0];
    if (file) {
      this.fotoSeleccionada = file;
    }
  }

  guardarAnimal() {
    if (this.animalForm.invalid) {
      this.animalForm.markAllAsTouched();
      return;
    }

    this.cargando = true;
    this.mensaje = '';

    const apiUrlCrear = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/animales/crear_animal.php';
    const token = localStorage.getItem('auth_token') || '';
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    });

    // 1️⃣ PRIMER PASO: Crear el animal con los datos de texto
    this.http.post<any>(apiUrlCrear, this.animalForm.value, { headers }).subscribe({
      next: (response) => {
        if (response.status === 'success') {

          // 2️⃣ SEGUNDO PASO: Si hay foto, la subimos usando el nuevo ID
          if (this.fotoSeleccionada) {
            this.subirFoto(response.id_animal);
          } else {
            // Si no hay foto, terminamos aquí
            this.cargando = false;
            this.mensaje = 'Animal creado con éxito (Sin foto).';
            this.esError = false;
            this.reiniciarFormulario();
          }

        } else {
          this.cargando = false;
          this.mensaje = response.message || 'Error al guardar el animal.';
          this.esError = true;
        }
      },
      error: (err) => {
        this.cargando = false;
        this.esError = true;
        this.mensaje = 'Error de comunicación con el servidor.';
        console.error(err);
      }
    });
  }

  // 👇 Método para subir la foto usando FormData
  subirFoto(idAnimal: number) {
    const apiUrlFoto = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/animales/subir_foto_animal.php'; // Ajusta la ruta
    const token = localStorage.getItem('auth_token') || '';

    // Usamos FormData porque vamos a enviar un archivo físico, no JSON
    const formData = new FormData();
    formData.append('foto', this.fotoSeleccionada as Blob);
    formData.append('id_animal', idAnimal.toString());
    formData.append('es_portada', '1'); // 1 = Es la foto principal

    // ⚠️ ATENCIÓN: Al usar FormData, NO debes enviar 'Content-Type'. 
    // El navegador lo asigna automáticamente como 'multipart/form-data'.
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}`
    });

    this.http.post<any>(apiUrlFoto, formData, { headers }).subscribe({
      next: (response) => {
        this.cargando = false;
        if (response.status === 'success') {
          this.mensaje = '¡Animal y foto creados correctamente!';
          this.esError = false;
          this.reiniciarFormulario();
        } else {
          this.mensaje = 'Animal creado, pero hubo un error con la foto: ' + response.message;
          this.esError = true;
        }
      },
      error: (err) => {
        this.cargando = false;
        this.mensaje = 'Animal creado, pero falló la conexión al subir la foto.';
        this.esError = true;
        console.error(err);
      }
    });
  }

  // Limpia los campos después de un guardado exitoso
  reiniciarFormulario() {
    this.animalForm.reset();
    this.fotoSeleccionada = null;

    // Limpiamos el input file en el HTML manualmente
    const fileInput = document.getElementById('foto') as HTMLInputElement;
    if (fileInput) fileInput.value = '';
  }

}

