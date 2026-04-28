import { Component, OnInit, ChangeDetectorRef } from '@angular/core'; // 1. Importamos ChangeDetectorRef
import { CommonModule } from '@angular/common';
import { AnimalService } from '../../services/animal';
import { Router } from '@angular/router';

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

  // 1. NUEVO: Variable para controlar la página actual
  paginaActual: number = 1;

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
    this.cargando = true; // 2. IMPORTANTE: Ponemos esto en true para mostrar el "Cargando..." al cambiar de página

    // 3. Pasamos la página actual al servicio
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

  // 4. NUEVO: Función para cambiar de página
  cambiarPagina(nuevaPagina: number): void {
    if (nuevaPagina >= 1) {
      this.paginaActual = nuevaPagina;
      this.cargarAnimales(); // Volvemos a llamar a la base de datos con la nueva página

      // Opcional: Hace que la pantalla suba al principio de la lista al cambiar de página
      window.scrollTo({ top: 0, behavior: 'smooth' });
    }
  }
}