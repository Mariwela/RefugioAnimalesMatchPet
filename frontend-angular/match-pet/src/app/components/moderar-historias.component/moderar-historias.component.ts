import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { HistoriaService } from '../../services/historia';
import { HistoriaModel } from '../../interfaces/historia.model';
import { CommonModule, DatePipe } from '@angular/common';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-moderar-historias.component',
  standalone: true,
  imports: [CommonModule, DatePipe, RouterModule],
  templateUrl: './moderar-historias.component.html',
  styleUrl: './moderar-historias.component.css',
})
export class ModerarHistoriasComponent implements OnInit {
  private readonly URL_HISTORIAS = 'http://localhost/RefugioAnimalesMatchPet/backend-php/public/historias/';

  todasHistorias: HistoriaModel[] = [];
  historiasFiltradas: HistoriaModel[] = [];
  historiaSeleccionada: HistoriaModel | null = null;
  filtroActivo: string = 'todas';
  cargando: boolean = true;
  error: string = '';

  constructor(private historiaService: HistoriaService, private cdr: ChangeDetectorRef) { }

  ngOnInit(): void {
    this.cargarTodas();
  }

  cargarTodas(): void {
    this.cargando = true;
    this.error = '';

    this.historiaService.obtenerTodasAdmin().subscribe({
      next: (respuesta) => {
        if (respuesta.status === 'success') {
          this.todasHistorias = respuesta.data;
          this.aplicarFiltro(this.filtroActivo);
        } else {
          this.error = respuesta.message || 'No hay historias.';
        }
        this.cargando = false;
        this.cdr.detectChanges();
      },
      error: () => {
        this.error = 'Error al conectar con el servidor.';
        this.cargando = false;
        this.cdr.detectChanges();
      }
    });
  }

  aplicarFiltro(filtro: string): void {
    this.filtroActivo = filtro;
    if (filtro === 'todas') {
      this.historiasFiltradas = [...this.todasHistorias];
    } else {
      const estadoMap: Record<string, string> = {
        pendientes: 'Pendiente',
        aprobadas: 'Aprobada',
        rechazadas: 'Rechazada'
      };
      this.historiasFiltradas = this.todasHistorias.filter(
        h => h.estado === estadoMap[filtro]
      );
    }
    this.cdr.detectChanges();
  }

  getImagenUrl(ruta: string | undefined): string {
    if (ruta && ruta.trim() !== '') {
      return `${this.URL_HISTORIAS}${ruta}`;
    }
    return 'historia-default.png'; 
  }

  cambiarEstado(historia: HistoriaModel, nuevoEstado: 'Aprobada' | 'Rechazada'): void {
    let comentario = '';

    if (nuevoEstado === 'Rechazada') {
      const input = prompt(`¿Por qué rechazas la historia "${historia.titulo}"?`);
      if (input === null) return;
      comentario = input;
    }

    this.historiaService.moderarHistoria(historia.id_historia, nuevoEstado, comentario).subscribe({
      next: (respuesta) => {
        if (respuesta.status === 'success') {
          // Actualizamos el estado en local sin recargar
          const h = this.todasHistorias.find(h => h.id_historia === historia.id_historia);
          if (h) h.estado = nuevoEstado;
          this.aplicarFiltro(this.filtroActivo);
        }
      },
      error: () => alert('Error al procesar la solicitud.')
    });
  }

  eliminarHistoria(historia: HistoriaModel): void {
    const confirmacion = confirm(`¿Eliminar la historia "${historia.titulo}"? Esta acción no se puede deshacer.`);
    if (!confirmacion) return;

    this.historiaService.eliminarHistoria(historia.id_historia).subscribe({
      next: (respuesta) => {
        if (respuesta.status === 'success') {
          this.todasHistorias = this.todasHistorias.filter(h => h.id_historia !== historia.id_historia);
          this.aplicarFiltro(this.filtroActivo);
        }
      },
      error: () => alert('Error al eliminar la historia.')
    });
  }

  abrirPreview(historia: HistoriaModel): void {
    this.historiaSeleccionada = historia;
  }

  cerrarPreview(): void {
    this.historiaSeleccionada = null;
  }
}
