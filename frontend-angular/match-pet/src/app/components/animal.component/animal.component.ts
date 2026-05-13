import { Component, OnInit, ChangeDetectorRef, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AnimalService } from '../../services/animal';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Favoritos } from '../../services/favoritos';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-animal',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './animal.component.html',
  styleUrl: './animal.component.css'
})
export class AnimalComponent implements OnInit {
  animales: any[] = [];
  cargando: boolean = true;
  errorMsg: string = '';
  animalIdSeleccionado: number | null = null;

  paginaActual: number = 1;

  favoritosIds: number[] = [];

  filtros = {
    texto: '',
    especie: '',
    tamano: '',
    sexo: '',
    nivel_energia: ''
  };

  public authService = inject(AuthService);
  private http = inject(HttpClient);
  private readonly URL_BASE_IMAGENES = 'http://localhost/RefugioAnimalesMatchPet/backend-php/public/img/animales/';

  constructor(
    private animalService: AnimalService,
    private cdr: ChangeDetectorRef,
    private router: Router,
    private favoritosService: Favoritos
  ) { }

  ngOnInit(): void {
    this.cargarFavoritosUsuario();
    this.cargarAnimales();
  }

  cargarFavoritosUsuario() {
    if (this.authService.isLoggedIn()) {
      this.favoritosService.getFavoritos().subscribe({
        next: (res) => {
          if (res.status === 'success') {
            this.favoritosIds = res.data.map((fav: any) => fav.id_animal);
            this.cdr.detectChanges();
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

  verDetalles(id: number) {
    this.router.navigate(['/animal', id]).then(exito => {
      if (!exito) console.log('La navegación falló');
    });
  }

  cargarAnimales(): void {
    this.cargando = true;

    this.animalService.getAnimalesDisponibles(this.paginaActual).subscribe({
      next: (res) => {
        this.animales = res.data;
        this.cargando = false;
        this.cdr.detectChanges();
      },
      error: (error) => {
        this.errorMsg = 'Error al cargar los animales.';
        this.cargando = false;
        this.cdr.detectChanges();
        console.error('Error:', error);
      }
    });
  }

  hayFiltrosActivos(): boolean {
    return this.filtros.texto !== '' ||
      this.filtros.especie !== '' ||
      this.filtros.tamano !== '' ||
      this.filtros.sexo !== '' ||
      this.filtros.nivel_energia !== '';
  }

  cambiarPagina(nuevaPagina: number): void {
    if (nuevaPagina >= 1) {
      this.paginaActual = nuevaPagina;


      if (this.hayFiltrosActivos()) {
        this.aplicarFiltros();
      } else {
        this.cargarAnimales();
      }

      window.scrollTo({ top: 0, behavior: 'smooth' });
    }
  }



  buscarConFiltros(): void {
    this.paginaActual = 1;
    this.aplicarFiltros();
  }

  aplicarFiltros(): void {
    this.cargando = true;
    this.cdr.detectChanges();

    const filtrosConPagina = {
      ...this.filtros,
      pagina: this.paginaActual
    };

    this.animalService.filtrarAnimales(filtrosConPagina).subscribe({
      next: (res) => {

        this.animales = res.data || [];
        this.cargando = false;
        this.cdr.detectChanges();
      },
      error: (err) => {
        this.errorMsg = 'Error al aplicar filtros.';
        this.cargando = false;
        this.cdr.detectChanges();
      }
    });
  }

  limpiarFiltros(): void {
    this.filtros = { texto: '', especie: '', tamano: '', sexo: '', nivel_energia: '' };
    this.paginaActual = 1;
    this.cargarAnimales(); 
  }

  eliminarAnimal(idAnimal: number, nombreAnimal: string) {
    const confirmacion = window.confirm(`¿Estás seguro de que deseas eliminar a ${nombreAnimal}? Esta acción borrará todas sus fotos y no se puede deshacer.`);

    if (!confirmacion) return;

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

  getFotoUrl(foto: string): string {
    if (!foto || foto === 'default_animal.jpg') {
      return 'assets/img/default_animal.jpg';
    }

    if (foto.startsWith('http')) {
      return foto;
    }

    return `${this.URL_BASE_IMAGENES}${foto}`;
  }
}