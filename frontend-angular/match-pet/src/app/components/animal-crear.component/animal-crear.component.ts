import { Component, inject, ChangeDetectorRef } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Router } from '@angular/router';
import id from '@angular/common/locales/extra/id';
import { response } from 'express';
import { AnimalService } from '../../services/animal';
import { AuthService } from '../../services/auth'; 

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
  private cdr = inject(ChangeDetectorRef);
  private animalService = inject(AnimalService);
  private authService = inject(AuthService);

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
  esExito: boolean = false;
  esError: boolean = false;
  cargando: boolean = false;
  fotoSeleccionada: File | null = null;
  fotosGaleria: File[] = [];
  fotosGaleriaPreview: string[] = [];
  fotoPreview: string | ArrayBuffer | null = null;

  onFileSeleccionada(event: any) {
    const file = event.target.files[0];
    if (file) {
      this.fotoSeleccionada = file;

      const reader = new FileReader();
      reader.onload = () => {
        this.fotoPreview = reader.result;
        this.cdr.detectChanges(); 
      };
      reader.readAsDataURL(file);
    }
  }

  onFotosGaleriaSeleccionadas(event: any) {
    const files: FileList = event.target.files;
    if (!files) return;

    Array.from(files).forEach((file) => {
      const reader = new FileReader();
      reader.onload = (e: any) => {
        this.fotosGaleriaPreview.push(e.target.result);
        this.fotosGaleria.push(file);
        
        this.cdr.detectChanges();
      };
      reader.readAsDataURL(file);
    });
  }

  quitarFotoGaleria(index: number) {
    this.fotosGaleria.splice(index, 1);
    this.fotosGaleriaPreview.splice(index, 1);
  }

  guardarAnimal() {
    if (this.animalForm.invalid) {
      this.mostrarError('Por favor, rellena los campos obligatorios.');
      return;
    }

    this.cargando = true;
    this.esError = false;
    this.esExito = false;

    const formData = new FormData();

    Object.keys(this.animalForm.controls).forEach(key => {
      const value = this.animalForm.get(key)?.value;
      if (typeof value === 'boolean') {
        formData.append(key, value ? '1' : '0');
      } else {
        formData.append(key, value || '');
      }
    });

    this.animalService.crearAnimal(formData).subscribe({
      next: (res) => {
        if (res.status === 'success') {
          const idNuevo = res.id_animal;

          if (this.fotoSeleccionada) {
            this.subirFoto(idNuevo);
          } else if (this.fotosGaleria.length > 0) {
            this.finalizarCreacion('¡Animal creado!', idNuevo);
          } else {
            this.finalizarCreacion('¡Animal creado correctamente!', idNuevo);
          }
        } else {
          this.mostrarError(res.message || 'Error al crear el animal');
        }
      },
      error: (err) => {
        console.error(err);
        this.mostrarError(err.error?.message || 'Error de conexión con el servidor');
        this.cargando = false;
        this.cdr.detectChanges();
      }
    });
  }

subirFoto(idAnimal: number) {
    const apiUrlFoto = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/animales/subir_foto_animal.php';
    const token = this.authService.getToken() || ''; 

    const formData = new FormData();
    formData.append('foto', this.fotoSeleccionada as Blob);
    formData.append('id_animal', idAnimal.toString());
    formData.append('es_portada', '1');

    const headers = new HttpHeaders({ 'Authorization': `Bearer ${token}` });;

    this.http.post<any>(apiUrlFoto, formData, { headers }).subscribe({
      next: (res) => {
        if (res.status === 'success') {
          this.finalizarCreacion('¡Animal y fotos creados correctamente!', idAnimal);
        } else {
          this.mostrarError('Animal creado, pero falló la foto: ' + res.message);
        }
      },
      error: () => this.mostrarError('Error al subir la foto.')
    });
  }

 private subirFotoGaleria(foto: File, idAnimal: number): Promise<void> {
    const apiUrlFoto = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/animales/subir_foto_animal.php';
    const token = this.authService.getToken() || '';

    const formData = new FormData();
    formData.append('foto', foto);
    formData.append('id_animal', idAnimal.toString());
    formData.append('es_portada', '0');

    const headers = new HttpHeaders({ 'Authorization': `Bearer ${token}` });

    return new Promise((resolve) => {
      this.http.post<any>(apiUrlFoto, formData, { headers }).subscribe({
        next: (res) => {
          console.log('Foto de galería subida:', res);
          resolve();
        },
        error: (err) => {
          console.error('Error al subir foto de galería:', err);
          resolve();
        }
      });
    });
  }

  private async finalizarCreacion(msg: string, id?: number) {
    if (id && this.fotosGaleria.length > 0) {
      this.mensaje = 'Subiendo galería...';
      this.cdr.detectChanges();
      
      for (const foto of this.fotosGaleria) {
        await this.subirFotoGaleria(foto, id);
      }
    }

    this.cargando = false;
    this.mensaje = msg;
    this.esError = false;
    this.esExito = true;
    this.cdr.detectChanges();

    setTimeout(() => {
      this.router.navigate(id ? ['/animal', id] : ['/animales']);
    }, 2000);
  }

  private mostrarError(msg: string) {
    this.cargando = false;
    this.mensaje = msg;
    this.esError = true;
    this.esExito = false;
    this.cdr.detectChanges();
  }

  reiniciarFormulario() {
    this.animalForm.reset();
    this.fotoSeleccionada = null;
    this.fotoPreview = null;
    this.fotosGaleria = [];
    this.fotosGaleriaPreview = [];

    const fileInput = document.getElementById('inputFoto') as HTMLInputElement;
    if (fileInput) fileInput.value = '';

    const galeriaInput = document.getElementById('inputGaleria') as HTMLInputElement;
    if (galeriaInput) galeriaInput.value = '';
  }

}

