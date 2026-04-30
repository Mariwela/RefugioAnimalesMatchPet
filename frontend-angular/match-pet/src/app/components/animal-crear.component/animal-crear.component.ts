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

  // Creamos el formulario haciendo coincidir los nombres con los que espera tu PHP ($data->nombre, etc.)
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

  guardarAnimal() {
    // Si el formulario es inválido, marcamos los campos para que se muestren los errores en el HTML
    if (this.animalForm.invalid) {
      this.animalForm.markAllAsTouched();
      return;
    }

    this.cargando = true;
    this.mensaje = '';

    // Reemplaza esto con la URL real donde tengas tu archivo PHP
    const apiUrl = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/animales/insertar_animal.php';

    // Aquí enviamos el token de autorización que necesita tu auth_middleware.php
    const token = localStorage.getItem('token') || '';
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}` // Asegúrate de que el formato coincida con lo que espera tu backend
    });

    // Enviamos los valores del formulario al PHP
    this.http.post<any>(apiUrl, this.animalForm.value, { headers }).subscribe({
      next: (response) => {
        this.cargando = false;

        if (response.status === 'success') {
          this.mensaje = response.message;
          this.esError = false;
          this.animalForm.reset(); // Limpiamos el formulario
          console.log('URL de la foto asignada:', response.url_completa);
        } else {
          this.mensaje = response.message || 'Error al guardar el animal.';
          this.esError = true;
        }
      },
      error: (err) => {
        this.cargando = false;
        this.esError = true;
        this.mensaje = 'Error de comunicación con el servidor (Revisa si el middleware te está bloqueando por falta de token).';
        console.error(err);
      }
    });
  }
}
