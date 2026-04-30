import { Component, OnInit, ChangeDetectorRef, inject } from '@angular/core'; // 👈 Añadido ChangeDetectorRef e inject
import { CommonModule } from '@angular/common';
import { RouterModule, Router } from '@angular/router';
import { Favoritos } from '../../services/favoritos';

@Component({
  selector: 'app-mis-favoritos',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './mis-favoritos.component.html',
  styleUrl: './mis-favoritos.component.css',
})
export class MisFavoritosComponent implements OnInit {
  animalesFavoritos: any[] = [];
  cargando: boolean = true;
  errorMsg: string = '';

  // Usamos inject para seguir tu estilo de código
  private favoritosService = inject(Favoritos);
  private router = inject(Router);
  private cdr = inject(ChangeDetectorRef); // 👈 Inyectamos el detector de cambios

  ngOnInit(): void {
    this.cargarMisFavoritos();
  }

  cargarMisFavoritos() {
    this.cargando = true;
    this.favoritosService.getFavoritos().subscribe({
      next: (res) => {
        console.log("Respuesta favoritos:", res); // Para ver qué llega en la consola
        if (res.status === 'success') {
          this.animalesFavoritos = res.data;
        } else {
          this.errorMsg = 'Hubo un problema al cargar tus favoritos.';
        }
        this.cargando = false;
        this.cdr.detectChanges(); // 👈 ¡CLAVE! Avisamos a la vista que ya no cargue
      },
      error: (err) => {
        console.error("Error en favoritos:", err);
        this.errorMsg = 'Error de conexión. Inténtalo de nuevo.';
        this.cargando = false;
        this.cdr.detectChanges(); // 👈 También aquí en caso de error
      }
    });
  }

  quitarDeFavoritos(id_animal: number) {
    this.favoritosService.eliminarFavorito(id_animal).subscribe({
      next: () => {
        this.animalesFavoritos = this.animalesFavoritos.filter(a => a.id_animal !== id_animal);
        this.cdr.detectChanges(); // 👈 Repintamos la lista tras borrar
      }
    });
  }

  verDetalles(id_animal: number) {
    this.router.navigate(['/animal', id_animal]);
  }
}