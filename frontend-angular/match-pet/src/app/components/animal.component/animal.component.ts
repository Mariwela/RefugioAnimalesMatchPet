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
  // 2. Inyectamos ChangeDetectorRef en el constructor


  constructor(
    private animalService: AnimalService,
    private cdr: ChangeDetectorRef,
    private router: Router
  ) { }



  ngOnInit(): void {
    this.cargarAnimales();
  }

  verDetalles(id: number) {
    // 1. Comprobamos si llega el clic y qué ID trae
    console.log('Botón pulsado. Navegando al animal con ID:', id);

    // 2. La navegación real
    this.router.navigate(['/animal', id]).then(exito => {
      if (exito) {
        console.log('Navegación exitosa');
      } else {
        console.log('La navegación falló (probablemente la ruta no existe)');
      }
    });
  }

  cargarAnimales(): void {
    this.animalService.getAnimalesDisponibles().subscribe({
      next: (res) => { // Cambiamos el nombre a 'res' para no confundir
        // REVISIÓN CLAVE: Tu JSON tiene la lista dentro de la propiedad .data
        this.animales = res.data; 
        
        this.cargando = false;
        this.cdr.detectChanges();

        console.log('Lista de animales:', this.animales);
      },
      error: (error) => {
        this.errorMsg = 'Error al cargar los animales.';
        this.cargando = false;
        this.cdr.detectChanges();
        console.error('Error:', error);
      }
    });
  }
}