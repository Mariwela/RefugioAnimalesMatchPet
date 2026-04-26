import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router } from '@angular/router';
import { AnimalService } from '../../services/animal'; // Ajusta esta ruta si es diferente

@Component({
  selector: 'app-animal-detalle',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './animal-detalle.component.html',
  styleUrl: './animal-detalle.component.css'
})
export class AnimalDetalleComponent implements OnInit {
  animal: any = null; // Guardará los datos del peludo
  cargando: boolean = true;
  errorMsg: string = '';
  fotosGaleria: any[] = [];
  constructor(
    private route: ActivatedRoute, // Para leer el "?id=" de la URL
    private router: Router,        // Para poder volver atrás
    private animalService: AnimalService,
    private cdr: ChangeDetectorRef // Nuestro toque mágico
  ) { }

  ngOnInit(): void {
    // 1. Extraemos el ID de la barra de direcciones (ej: /animal/3 -> pilla el 3)
    const idString = this.route.snapshot.paramMap.get('id');

    if (idString) {
      // 2. Lo convertimos a número y ejecutamos la búsqueda
      const idAnimal = Number(idString);
      this.cargarPerfilAnimal(idAnimal);
    } else {
      // Si por algún motivo entra sin ID
      this.errorMsg = 'No se encontró el perfil del animal.';
      this.cargando = false;
    }
  }

  cargarPerfilAnimal(id: number): void {
    this.animalService.getAnimalById(id).subscribe({
      next: (res) => {
        if (res.status === 'success') {
          // 1. Guardamos los datos básicos del animal
          this.animal = res.data;
          
          // 2. Extraemos la galería que el PHP metió dentro de 'data'
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
    if (!fechaNacimiento || fechaNacimiento === '0000-00-00'){
      return null;
    }

    const nacimiento = new Date(fechaNacimiento);
    const hoy = new Date();
    
    // Si la fecha es inválida (ej. texto mal formado)
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
  
  // Función para el botón de "Volver"
  volver(): void {
    this.router.navigate(['/animales']);
  }
}