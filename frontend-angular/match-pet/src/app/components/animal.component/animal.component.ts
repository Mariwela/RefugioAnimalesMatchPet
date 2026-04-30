import { Component, OnInit, ChangeDetectorRef, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AnimalService } from '../../services/animal';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth';
import { HttpClient, HttpHeaders } from '@angular/common/http';

// 👇 NUEVO: Importamos el servicio de Favoritos
import { Favoritos } from '../../services/favoritos';

@Component({
  selector: 'app-animal',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './animal.component.html',
  styleUrl: './animal.component.css'
})
export class AnimalComponent implements OnInit {
  animales: any[] = [];
  cargando: boolean = true;
  errorMsg: string = '';
  animalIdSeleccionado: number | null = null;
  paginaActual: number = 1;

  // 👇 NUEVO: Array para guardar los IDs de los animales favoritos
  favoritosIds: number[] = [];

  public authService = inject(AuthService);
  private http = inject(HttpClient);

  constructor(
    private animalService: AnimalService,
    private cdr: ChangeDetectorRef,
    private router: Router,
    private favoritosService: Favoritos // 👈 NUEVO: Inyectamos el servicio de Favoritos en el constructor
  ) { }

  ngOnInit(): void {
    this.cargarAnimales();
    this.cargarFavoritosUsuario(); // 👈 NUEVO: Llamamos a cargar los favoritos al inicio
  }

  // ---------------------------------------------------
  // 👇 NUEVA SECCIÓN DE FAVORITOS 👇
  // ---------------------------------------------------

  cargarFavoritosUsuario() {
    if (this.authService.isLoggedIn()) {
      this.favoritosService.getFavoritos().subscribe({
        next: (res) => {
          if (res.status === 'success') {
            this.favoritosIds = res.data.map((fav: any) => fav.id_animal);
            this.cdr.detectChanges(); // 👈 Avisamos a Angular que repinte la vista para mostrar los corazones rojos
          }
        },
        error: (err) => console.error("Error al cargar favoritos", err)
      });
    }
  }

  isFavorito(id_animal: number): boolean {
    return this.favoritosIds.includes(id_animal);
  }

  toggleFavorito(id_animal: number) {
    if (this.isFavorito(id_animal)) {
      // Eliminar de favoritos
      this.favoritosService.eliminarFavorito(id_animal).subscribe({
        next: () => {
          this.favoritosIds = this.favoritosIds.filter(id => id !== id_animal);
          this.cdr.detectChanges(); // 👈 Repintamos para que el corazón se ponga blanco
        },
        error: (err) => console.error("Error al eliminar de favoritos", err)
      });
    } else {
      // Agregar a favoritos
      this.favoritosService.agregarFavorito(id_animal).subscribe({
        next: () => {
          this.favoritosIds.push(id_animal);
          this.cdr.detectChanges(); // 👈 Repintamos para que el corazón se ponga rojo
        },
        error: (err) => console.error("Error al agregar a favoritos", err)
      });
    }
  }

  // ---------------------------------------------------
  // 👆 FIN SECCIÓN DE FAVORITOS 👆
  // ---------------------------------------------------

  verDetalles(id: number) {
    console.log('Botón pulsado. Navegando al animal con ID:', id);
    this.router.navigate(['/animal', id]).then(exito => {
      if (exito) {
        console.log('Navegación exitosa');
      } else {
        console.log('La navegación falló (probablemente la ruta no existe)');
      }
    });
  }

  cargarAnimales(): void {
    this.cargando = true;

    this.animalService.getAnimalesDisponibles(this.paginaActual).subscribe({
      next: (res) => {
        this.animales = res.data;
        this.cargando = false;
        this.cdr.detectChanges();
        console.log(`Lista de animales (Página ${this.paginaActual}):`, this.animales);
      },
      error: (error) => {
        this.errorMsg = 'Error al cargar los animales.';
        this.cargando = false;
        this.cdr.detectChanges();
        console.error('Error:', error);
      }
    });
  }

  cambiarPagina(nuevaPagina: number): void {
    if (nuevaPagina >= 1) {
      this.paginaActual = nuevaPagina;
      this.cargarAnimales();
      window.scrollTo({ top: 0, behavior: 'smooth' });
    }
  }

  eliminarAnimal(idAnimal: number, nombreAnimal: string) {
    const confirmacion = window.confirm(`¿Estás seguro de que deseas eliminar a ${nombreAnimal}? Esta acción borrará todas sus fotos y no se puede deshacer.`);

    if (!confirmacion) {
      return;
    }

    const apiUrlEliminar = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/animales/eliminar_animal.php';
    const token = this.authService.getToken() || '';

    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    });

    this.http.post<any>(apiUrlEliminar, { id_animal: idAnimal }, { headers }).subscribe({
      next: (response) => {
        if (response.status === 'success') {
          alert(`¡${nombreAnimal} ha sido eliminado correctamente!`);

          this.animales = this.animales.filter(a => a.id_animal !== idAnimal);
          this.cdr.detectChanges();

          if (this.animales.length === 0 && this.paginaActual > 1) {
            this.cambiarPagina(this.paginaActual - 1);
          }
        } else {
          alert('Error: ' + response.message);
        }
      },
      error: (err) => {
        console.error(err);
        alert('Error de conexión al intentar eliminar.');
      }
    });
  }
}