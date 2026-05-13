import { Component, OnInit, ChangeDetectorRef, inject } from '@angular/core';
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
  baseUrlImagenes = 'http://localhost/RefugioAnimalesMatchPet/backend-php/public/img/animales/';
  private favoritosService = inject(Favoritos);
  private router = inject(Router);
  private cdr = inject(ChangeDetectorRef);

  ngOnInit(): void {
    this.cargarMisFavoritos();
  }

  cargarMisFavoritos() {
    this.cargando = true;
    this.favoritosService.getFavoritos().subscribe({
      next: (res) => {
        console.log("Respuesta favoritos:", res);
        if (res.status === 'success') {
          this.animalesFavoritos = res.data;
        } else {
          this.errorMsg = 'Hubo un problema al cargar tus favoritos.';
        }
        this.cargando = false;
        this.cdr.detectChanges();
      },
      error: (err) => {
        console.error("Error en favoritos:", err);
        this.errorMsg = 'Error de conexión. Inténtalo de nuevo.';
        this.cargando = false;
        this.cdr.detectChanges();
      }
    });
  }

  quitarDeFavoritos(id_animal: number) {
    this.favoritosService.eliminarFavorito(id_animal).subscribe({
      next: () => {
        this.animalesFavoritos = this.animalesFavoritos.filter(a => a.id_animal !== id_animal);
        this.cdr.detectChanges();
      }
    });
  }

  verDetalles(id_animal: number) {
    this.router.navigate(['/animal', id_animal]);
  }

  getImagenUrl(foto: string): string {
    if (!foto) return 'assets/img/default_animal.jpg';
    if (foto.startsWith('http')) {
      return foto;
    }

    return `${this.baseUrlImagenes}${foto}`;
  }
}
