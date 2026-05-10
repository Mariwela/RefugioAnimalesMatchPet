import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router } from '@angular/router';
import { AnimalService } from '../../services/animal'; // Ajusta esta ruta si es diferente
import { AuthService } from '../../services/auth';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { ImageZoomDialogComponent } from '../image-zoom-dialog.component/image-zoom-dialog.component';

@Component({
  selector: 'app-animal-detalle',
  standalone: true,
  imports: [CommonModule, MatDialogModule],
  templateUrl: './animal-detalle.component.html',
  styleUrl: './animal-detalle.component.css'
})
export class AnimalDetalleComponent implements OnInit {
  animal: any = null; // Guardará los datos del peludo
  cargando: boolean = true;
  errorMsg: string = '';
  fotosGaleria: any[] = [];
  isAdmin: boolean = false;

  // 👇 NUEVAS VARIABLES PARA LA SOLICITUD 👇
  enviandoSolicitud: boolean = false;
  mensajeSolicitud: string = '';
  errorSolicitud: string = '';

  constructor(
    private route: ActivatedRoute, // Para leer el "?id=" de la URL
    private router: Router,        // Para poder volver atrás
    private animalService: AnimalService,
    public authService: AuthService, // Cambiado a 'public' si lo usas en el HTML
    private cdr: ChangeDetectorRef,
    private dialog: MatDialog// Nuestro toque mágico
  ) { }

  ngOnInit(): void {
    const idString = this.route.snapshot.paramMap.get('id');
    this.verificarPermisos();
    if (idString) {
      const idAnimal = Number(idString);
      this.cargarPerfilAnimal(idAnimal);
    } else {
      this.errorMsg = 'No se encontró el perfil del animal.';
      this.cargando = false;
    }
  }

  verificarPermisos() {
    const rol = this.authService.getRol();
    this.isAdmin = (rol === 'admin');
  }

  cargarPerfilAnimal(id: number): void {
    this.animalService.getAnimalById(id).subscribe({
      next: (res) => {
        if (res.status === 'success') {
          this.animal = res.data;
          this.fotosGaleria = res.data.galeria || [];
          this.cargando = false;
          this.cdr.detectChanges();
          console.log('Todo cargado:', this.animal);
        } else {
          this.errorMsg = res.message || 'Error desconocido';
          this.cargando = false;
        }
      },
      error: (error) => {
        this.errorMsg = 'Hubo un error al buscar los datos.';
        this.cargando = false;
        this.cdr.detectChanges();
      }
    });
  }

  getEdad(fechaNacimiento: string): string | null {
    if (!fechaNacimiento || fechaNacimiento === '0000-00-00') {
      return null;
    }

    const nacimiento = new Date(fechaNacimiento);
    const hoy = new Date();

    if (isNaN(nacimiento.getTime())) return null;

    let años = hoy.getFullYear() - nacimiento.getFullYear();
    let meses = hoy.getMonth() - nacimiento.getMonth();

    if (meses < 0 || (meses === 0 && hoy.getDate() < nacimiento.getDate())) {
      años--;
      meses += 12;
    }

    if (años === 0) {
      return meses === 0 ? 'Recién nacido' : (meses === 1 ? '1 mes' : `${meses} meses`);
    } else {
      let textoAños = años === 1 ? '1 año' : `${años} años`;
      if (meses > 0) {
        textoAños += ` y ${meses} ${meses === 1 ? 'mes' : 'meses'}`;
      }
      return textoAños;
    }
  }

  volver(): void {
    this.router.navigate(['/animales']);
  }

  irAEditar(): void {
    if (this.animal && this.animal.id_animal) {
      this.router.navigate(['/animales/editar', this.animal.id_animal]);
    }
  }

  // 👇 NUEVA FUNCIÓN PARA SOLICITAR ADOPCIÓN 👇
  solicitarAdopcion(): void {
    // 1. Verificamos si el usuario ha iniciado sesión
    if (!this.authService.isLoggedIn()) {
      this.errorSolicitud = 'Debes iniciar sesión para poder adoptar.';
      this.cdr.detectChanges();
      return;
    }

    // 2. Preparamos el estado de carga
    this.enviandoSolicitud = true;
    this.mensajeSolicitud = '';
    this.errorSolicitud = '';

    // 3. Llamamos al servicio
    if (this.animal && this.animal.id_animal) {
      this.animalService.enviarSolicitud(this.animal.id_animal).subscribe({
        next: (response) => {
          if (response.status === 'success') {
            this.mensajeSolicitud = response.message || 'Solicitud enviada correctamente.';
          } else {
            this.errorSolicitud = response.message || 'Error al enviar la solicitud.';
          }
          this.enviandoSolicitud = false;
          this.cdr.detectChanges(); // Actualizamos la vista
        },
        error: (error) => {
          if (error.status === 409) {
            this.errorSolicitud = 'Ya has enviado una solicitud para este animal anteriormente.';
          } else if (error.status === 401) {
            this.errorSolicitud = 'Tu sesión ha expirado. Por favor, inicia sesión de nuevo.';
          } else {
            this.errorSolicitud = error.error?.message || 'Ocurrió un error al enviar la solicitud.';
          }
          this.enviandoSolicitud = false;
          this.cdr.detectChanges(); // Actualizamos la vista
        }
      });
    }
  }

  // 👇 FUNCIÓN CORREGIDA CON TUS NOMBRES DE VARIABLES 👇
  abrirZoom(imagenClickeadaUrl: string): void {
    let todasLasImagenes: string[] = [];

    // 1. Metemos la foto principal usando TU variable: 'foto_portada'
    if (this.animal.foto_portada) {
      todasLasImagenes.push(this.animal.foto_portada);
    }

    // 2. Metemos las de la galería usando TU variable: 'url_completa'
    if (this.animal.galeria && this.animal.galeria.length > 0) {
      const urlsGaleria = this.animal.galeria.map((foto: any) => foto.url_completa);
      todasLasImagenes = [...todasLasImagenes, ...urlsGaleria];
    }

    // 3. Eliminamos duplicados (por si la portada se repite en la galería)
    todasLasImagenes = [...new Set(todasLasImagenes)];

    // 4. Buscamos qué posición ocupa la imagen que clickeó el usuario
    let indiceClickeado = todasLasImagenes.indexOf(imagenClickeadaUrl);
    if (indiceClickeado === -1) indiceClickeado = 0;

    // 5. Abrimos el modal
    this.dialog.open(ImageZoomDialogComponent, {
      data: { imagenes: todasLasImagenes, indiceIndex: indiceClickeado },
      maxWidth: '100vw',
      width: '100vw',
      height: '100vh',
      panelClass: 'zoom-dialog-panel'
    });
  }
}