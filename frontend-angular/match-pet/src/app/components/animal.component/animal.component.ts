import { Component, OnInit, ChangeDetectorRef, inject } from '@angular/core'; // 👇 NUEVO: importamos inject
import { CommonModule } from '@angular/common';
import { AnimalService } from '../../services/animal';
import { Router } from '@angular/router';
// 👇 NUEVO: Importamos el servicio de Auth y el cliente HTTP
import { AuthService } from '../../services/auth'; // ⚠️ Ajusta esta ruta si tu servicio de auth está en otra carpeta
import { HttpClient, HttpHeaders } from '@angular/common/http';

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

  // 👇 NUEVO: Inyectamos authService como público para el HTML y http para hacer la petición
  public authService = inject(AuthService);
  private http = inject(HttpClient);

  constructor(
    private animalService: AnimalService,
    private cdr: ChangeDetectorRef,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.cargarAnimales();
  }

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

  // 👇 NUEVO: Método para eliminar un animal
  eliminarAnimal(idAnimal: number, nombreAnimal: string) {
    const confirmacion = window.confirm(`¿Estás seguro de que deseas eliminar a ${nombreAnimal}? Esta acción borrará todas sus fotos y no se puede deshacer.`);

    if (!confirmacion) {
      return;
    }

    // ⚠️ Asegúrate de que esta URL coincida con la ruta de tu proyecto PHP
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

          // Filtramos el array para quitar la tarjeta instantáneamente sin recargar la página
          this.animales = this.animales.filter(a => a.id_animal !== idAnimal);

          // Le avisamos a Angular que repinte la vista porque quitamos un animal
          this.cdr.detectChanges();

          // (Opcional) Si la página se quedó vacía, volvemos a la anterior
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
  // Define este array en tu componente para guardar los IDs de los favoritos
  favoritosIds: number[] = [];

  // En tu ngOnInit, si el usuario está logueado, llama a la API de lista de favoritos
  cargarFavoritosUsuario() {
    if (this.authService.isLoggedIn()) {
      this.favoritosService.getFavoritos().subscribe({
        next: (res) => {
          if (res.status === 'success') {
            // Extraemos solo los IDs para hacer la comprobación más rápida
            this.favoritosIds = res.data.map((fav: any) => fav.id_animal);
          }
        },
        error: (err) => console.error("Error al cargar favoritos", err)
      });
    }
  }

  // Método para que el HTML compruebe si el corazón va en rojo o blanco
  isFavorito(id_animal: number): boolean {
    return this.favoritosIds.includes(id_animal);
  }

  // Método que se ejecuta al hacer clic en el corazón
  toggleFavorito(id_animal: number) {
    if (this.isFavorito(id_animal)) {
      // Si ya es favorito, llamamos a la API de ELIMINAR
      this.favoritosService.eliminarFavorito(id_animal).subscribe(() => {
        // Lo quitamos del array local para que el corazón se ponga blanco de inmediato
        this.favoritosIds = this.favoritosIds.filter(id => id !== id_animal);
      });
    } else {
      // Si no es favorito, llamamos a la API de AGREGAR
      this.favoritosService.agregarFavorito(id_animal).subscribe(() => {
        // Lo añadimos al array local para que el corazón se ponga rojo de inmediato
        this.favoritosIds.push(id_animal);
      });
    }
  }
}