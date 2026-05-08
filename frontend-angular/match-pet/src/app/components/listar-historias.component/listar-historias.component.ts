import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';
import { HistoriaModel } from '../../interfaces/historia.model';
import { HistoriaService } from '../../services/historia'; // Importamos el servicio
import { AuthService } from '../../services/auth';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-listar-historias',
  standalone: true,
  imports: [CommonModule, DatePipe, RouterModule],
  templateUrl: './listar-historias.component.html',
  styleUrl: './listar-historias.component.css',
})
export class ListarHistoriasComponent implements OnInit {
  historias: HistoriaModel[] = [];
  cargando: boolean = true;
  error: string = '';

  usuarioActualId: number | null = null;
  esAdmin: boolean = false;

  constructor(
    private historiaService: HistoriaService,
    public authService: AuthService, // <-- Lo ponemos public para usarlo en el HTML
    private cdr: ChangeDetectorRef
  ) { }

  ngOnInit(): void {


    // Obtenemos los datos del usuario actual para la lógica de borrado
    this.esAdmin = this.authService.isAdmin();
    this.usuarioActualId = this.authService.getUsuarioId();
    this.cargarHistorias();
  }

  // ... (aquí va tu método cargarHistorias() que ya tenemos) ...
  cargarHistorias(): void {
    this.cargando = true;
    this.historiaService.obtenerHistorias().subscribe({
      next: (respuesta) => {
        if (respuesta.status === 'success') {
          this.historias = respuesta.data;
        } else {
          this.error = 'No se pudieron cargar las historias.';
        }
        this.cargando = false;
        this.cdr.detectChanges(); // Forzamos actualización visual
      },
      error: (err) => {
        console.error('Error:', err);
        this.error = 'Error de conexión con el servidor.';
        this.cargando = false;
        this.cdr.detectChanges();
      }
    });
  }
  eliminarHistoria(historia: HistoriaModel): void {
    // 1. Pedimos confirmación al usuario (para evitar borrados por error)
    const confirmacion = confirm(`¿Estás seguro de que deseas eliminar la historia "${historia.titulo}"? Esta acción no se puede deshacer.`);

    if (confirmacion) {
      this.historiaService.eliminarHistoria(historia.id_historia).subscribe({
        next: (respuesta) => {
          if (respuesta.status === 'success') {
            // 2. Eliminamos la historia del array visualmente sin recargar la página
            this.historias = this.historias.filter(h => h.id_historia !== historia.id_historia);
            alert('✅ Historia eliminada correctamente.');
            this.cdr.detectChanges(); // Actualizamos la vista
          } else {
            alert('❌ Error al eliminar: ' + respuesta.message);
          }
        },
        error: (err) => {
          console.error('Error al borrar:', err);
          alert('❌ Hubo un error de conexión al intentar eliminar la historia.');
        }
      });
    }
  }
}