import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router } from '@angular/router';
import { AnimalService } from '../../services/animal';
import { AuthService } from '../../services/auth';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { ImageZoomDialogComponent } from '../image-zoom-dialog.component/image-zoom-dialog.component';
import { Favoritos } from '../../services/favoritos';

@Component({
  selector: 'app-animal-detalle',
  standalone: true,
  imports: [CommonModule, MatDialogModule],
  templateUrl: './animal-detalle.component.html',
  styleUrl: './animal-detalle.component.css'
})
export class AnimalDetalleComponent implements OnInit {
  animal: any = null;
  cargando: boolean = true;
  errorMsg: string = '';
  fotosGaleria: any[] = [];
  isAdmin: boolean = false;
  favoritosIds: number[] = [];
  enviandoSolicitud: boolean = false;
  mensajeSolicitud: string = '';
  errorSolicitud: string = '';

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private animalService: AnimalService,
    public authService: AuthService,
    private cdr: ChangeDetectorRef,
    private dialog: MatDialog,
    private favoritosService: Favoritos
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
    console.log('fecha_nacimiento raw:', this.animal?.fecha_nacimiento);
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

  solicitarAdopcion(): void {
    if (!this.authService.isLoggedIn()) {
      this.errorSolicitud = 'Debes iniciar sesión para poder adoptar.';
      this.cdr.detectChanges();
      return;
    }

    this.enviandoSolicitud = true;
    this.mensajeSolicitud = '';
    this.errorSolicitud = '';

    if (this.animal && this.animal.id_animal) {
      this.animalService.enviarSolicitud(this.animal.id_animal).subscribe({
        next: (response) => {
          if (response.status === 'success') {
            this.mensajeSolicitud = response.message || 'Solicitud enviada correctamente.';
          } else {
            this.errorSolicitud = response.message || 'Error al enviar la solicitud.';
          }
          this.enviandoSolicitud = false;
          this.cdr.detectChanges();
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
          this.cdr.detectChanges();
        }
      });
    }
  }

  abrirZoom(imagenClickeadaUrl: string): void {
    let todasLasImagenes: string[] = [];
    if (this.animal.foto_portada) {
      todasLasImagenes.push(this.animal.foto_portada);
    }

    if (this.animal.galeria && this.animal.galeria.length > 0) {
      const urlsGaleria = this.animal.galeria.map((foto: any) => foto.url_completa);
      todasLasImagenes = [...todasLasImagenes, ...urlsGaleria];
    }

    todasLasImagenes = [...new Set(todasLasImagenes)];

    let indiceClickeado = todasLasImagenes.indexOf(imagenClickeadaUrl);
    if (indiceClickeado === -1) indiceClickeado = 0;

    this.dialog.open(ImageZoomDialogComponent, {
      data: { imagenes: todasLasImagenes, indiceIndex: indiceClickeado },
      maxWidth: '100vw',
      width: '100vw',
      height: '100vh',
      panelClass: 'zoom-dialog-panel'
    });
  }

  isFavorito(id_animal: number): boolean {
    return this.favoritosIds.includes(id_animal);
  }
  toggleFavorito(id_animal: number) {
    if (this.isFavorito(id_animal)) {
      this.favoritosService.eliminarFavorito(id_animal).subscribe({
        next: () => {
          this.favoritosIds = this.favoritosIds.filter(id => id !== id_animal);
          this.cdr.detectChanges();
        },
        error: (err) => console.error("Error al eliminar de favoritos", err)
      });
    } else {
      this.favoritosService.agregarFavorito(id_animal).subscribe({
        next: () => {
          this.favoritosIds.push(id_animal);
          this.cdr.detectChanges();
        },
        error: (err) => console.error("Error al agregar a favoritos", err)
      });
    }
  }

  confirmarEliminar(): void {
  if (!this.animal || !this.animal.id_animal) return;

  const confirmar = window.confirm(
    `¿Estás seguro de que deseas eliminar a ${this.animal.nombre}? Esta acción borrará permanentemente su ficha y todas sus fotos.`
  );

  if (confirmar) {
    this.eliminarAnimal(this.animal.id_animal);
  }
}

eliminarAnimal(id: number): void {
  this.cargando = true;

  this.animalService.eliminarAnimal(id).subscribe({
    next: (res) => {
      if (res.status === 'success') {
        alert('Animal eliminado correctamente.');
        this.router.navigate(['/animales']);
      } else {
        this.errorMsg = res.message || 'No se pudo eliminar el animal.';
        this.cargando = false;
      }
    },
    error: (err) => {
      console.error('Error al eliminar:', err);
      this.errorMsg = 'Error en el servidor al intentar eliminar.';
      this.cargando = false;
      this.cdr.detectChanges();
    }
  });
}
}