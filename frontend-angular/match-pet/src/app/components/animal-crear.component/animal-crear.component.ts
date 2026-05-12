import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Router } from '@angular/router';
import id from '@angular/common/locales/extra/id';
import { response } from 'express';

@Component({
  selector: 'app-animal-crear.component',
  imports: [ReactiveFormsModule, CommonModule],
  templateUrl: './animal-crear.component.html',
  styleUrl: './animal-crear.component.css',
})
export class AnimalCrearComponent {
  private fb = inject(FormBuilder);
  private http = inject(HttpClient);
  private router = inject(Router);

  animalForm: FormGroup = this.fb.group({
    nombre: ['', Validators.required],
    especie: ['Perro', Validators.required],
    raza: [''],
    sexo: ['Macho', Validators.required],
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

  mensaje: string = '';
  esError: boolean = false;
  cargando: boolean = false;
  fotoSeleccionada: File | null = null;
  fotoPreview: string | ArrayBuffer | null = null;

  onFileSeleccionada(event: any) {
    const file = event.target.files[0];
    if (file) {
      this.fotoSeleccionada = file;

      // Lógica para generar la vista previa
      const reader = new FileReader();
      reader.onload = () => {
        this.fotoPreview = reader.result;
      };
      reader.readAsDataURL(file);
    }
  }

  guardarAnimal() {
    if (this.animalForm.invalid) {
      this.animalForm.markAllAsTouched();
      return;
    }

    this.cargando = true;
    this.mensaje = '';

    const apiUrlCrear = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/animales/insertar_animal.php';
    const token = localStorage.getItem('auth_token') || '';
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    });

    // 1️⃣ PRIMER PASO: Crear el animal con los datos de texto
    this.http.post<any>(apiUrlCrear, this.animalForm.value, { headers }).subscribe({
      next: (res) => {
        if (res.status === 'success') {
          const nuevoId = res.id_animal;

          // 2️⃣ SEGUNDO PASO: Si hay foto, la subimos usando el nuevo ID
          if (this.fotoSeleccionada) {
            this.subirFoto(res.id_animal);
          } else {
            this.finalizarCreacion('Animal creado con éxito.');
          }

        } else {
          this.mostrarError(res.message);
        }
      },
      error: () => this.mostrarError('Error de comunicación con el servidor.')
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
    formData.append('es_portada', '1');

    // ⚠️ ATENCIÓN: Al usar FormData, NO debes enviar 'Content-Type'. 
    // El navegador lo asigna automáticamente como 'multipart/form-data'.
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}`
    });

    this.http.post<any>(apiUrlFoto, formData, { headers }).subscribe({
      next: (res) => {
        this.cargando = false;
        if (res.status === 'success') {
          this.finalizarCreacion('¡Animal y foto creados correctamente!', idAnimal);
        } else {
          this.mostrarError('Animal creado, pero falló la foto: ' + res.message);
        }
      },
      error: (err) => this.mostrarError('Error al subir la foto.')
    });
  }

  private finalizarCreacion(msg: string, id?: number) {
    this.cargando = false;
    this.mensaje = msg;
    this.esError = false;
    setTimeout(() => {
      if (id) {
        this.router.navigate(['/animal', id]); // Cambia '/animales' por tu ruta de detalle, ej: '/animales/detalle', id
      } else {
        this.router.navigate(['/animales']);
      }
    }, 2000);
  }

  private mostrarError(msg: string) {
    this.cargando = false;
    this.mensaje = msg;
    this.esError = true;
  }

  reiniciarFormulario() {
    this.animalForm.reset();
    this.fotoSeleccionada = null;

    // Limpiamos el input file en el HTML manualmente
    const fileInput = document.getElementById('foto') as HTMLInputElement;
    if (fileInput) fileInput.value = '';
  }

}

