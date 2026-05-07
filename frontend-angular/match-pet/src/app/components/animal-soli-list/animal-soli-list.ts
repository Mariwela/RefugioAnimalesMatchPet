import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common'; // Importante para usar DatePipe y directivas en el HTML
import { AnimalService } from '../../services/animal'; // ¡Ajusta esta ruta a donde esté tu servicio!

@Component({
  selector: 'app-animal-soli-list',
  imports: [CommonModule],
  templateUrl: './animal-soli-list.html',
  styleUrl: './animal-soli-list.css',
})
export class AnimalSoliList implements OnInit {
  solicitudes: any[] = [];
  cargando: boolean = true;
  errorMensaje: string = '';

  // Inyectamos AnimalService
  constructor(private animalService: AnimalService) { }

  ngOnInit(): void {
    this.cargarSolicitudes();
  }

  cargarSolicitudes(): void {
    this.cargando = true;

    // Llamamos a la función desde AnimalService
    this.animalService.getSolicitudes().subscribe({
      next: (response) => {
        if (response.status === 'success') {
          this.solicitudes = response.data;
        } else {
          this.errorMensaje = response.message || 'No se pudieron obtener las solicitudes.';
        }
        this.cargando = false;
      },
      error: (error) => {
        console.error('Error al traer las solicitudes:', error);
        this.errorMensaje = 'Ocurrió un error de conexión con el servidor.';
        this.cargando = false;
      }
    });
  }
}
