import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common'; // Importante para usar DatePipe y directivas en el HTML
import { AnimalService } from '../../services/animal'; // ¡Ajusta esta ruta a donde esté tu servicio!
import { AuthService } from '../../services/auth';

@Component({
  selector: 'app-animal-soli-list',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './animal-soli-list.html',
  styleUrl: './animal-soli-list.css',
})
export class AnimalSoliList implements OnInit {
  solicitudes: any[] = [];
  cargando: boolean = true;
  errorMensaje: string = '';
  isAdmin: boolean = false;
  procesandoId: number | null = null; // Para mostrar carga en un botón específico

  constructor(
    private animalService: AnimalService,
    private authService: AuthService,
    private cdr: ChangeDetectorRef
  ) { }

  ngOnInit(): void {
    this.isAdmin = this.authService.getRol() === 'admin';
    this.cargarSolicitudes();
  }

  cargarSolicitudes(): void {
    this.cargando = true;

    this.animalService.getSolicitudes().subscribe({
      next: (response) => {
        if (response.status === 'success') {
          this.solicitudes = response.data;
        } else {
          this.errorMensaje = response.message || 'Error al obtener datos.';
        }
        this.cargando = false;
        this.cdr.detectChanges(); // <-- 3. EL TOQUE MÁGICO: Fuerza a Angular a actualizar el HTML
      },
      error: (error) => {
        this.errorMensaje = 'Ocurrió un error de conexión con el servidor.';
        this.cargando = false;
        this.cdr.detectChanges(); // <-- Aquí también por si hay error
      }
    });
  }

  cambiarEstado(solicitud: any, nuevoEstado: string): void {
    // Usamos un prompt nativo del navegador para pedir el comentario de forma sencilla
    const comentario = prompt(`¿Deseas añadir un comentario al cambiar a ${nuevoEstado}? (Opcional)`) || '';

    this.procesandoId = solicitud.id_solicitud; // Bloqueamos los botones de esa fila

    this.animalService.gestionarSolicitud(solicitud.id_solicitud, nuevoEstado, comentario).subscribe({
      next: (response) => {
        if (response.status === 'success') {
          // Actualizamos visualmente el estado en la tabla sin tener que recargar la página
          solicitud.estado_solicitud = nuevoEstado;
          solicitud.comentario_admin = comentario;
          alert(`✅ Solicitud ${nuevoEstado} exitosamente.`);
        } else {
          alert(`❌ Error: ${response.message}`);
        }
        this.procesandoId = null;
      },
      error: (error) => {
        alert('❌ Error al procesar la solicitud.');
        this.procesandoId = null;
      }
    });
  }
}
