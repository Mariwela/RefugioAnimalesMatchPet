import { Component, OnInit } from '@angular/core';
import { HistoriaService } from '../../services/historia';
import { HistoriaModel } from '../../interfaces/historia.model';
import { CommonModule, DatePipe } from '@angular/common';

@Component({
  selector: 'app-moderar-historias.component',
  imports: [CommonModule, DatePipe],
  templateUrl: './moderar-historias.component.html',
  styleUrl: './moderar-historias.component.css',
})
export class ModerarHistoriasComponent implements OnInit {
  historiasPendientes: HistoriaModel[] = [];
  cargando: boolean = true;
  error: string = '';

  constructor(private historiaService: HistoriaService) { }

  ngOnInit(): void {
    this.cargarPendientes();
  }

  cargarPendientes(): void {
    this.cargando = true;
    // NOTA: Asegúrate de tener un método en tu servicio que apunte a 'listar_pendientes.php'
    // Si usas el mismo de 'listar_historias.php', te traerá todas.
    this.historiaService.obtenerHistorias().subscribe({
      next: (respuesta) => {
        if (respuesta.status === 'success') {
          // Si el endpoint trae todas, podemos filtrarlas aquí:
          this.historiasPendientes = respuesta.data.filter(h => h.estado === 'Pendiente');
        } else {
          this.error = 'No se pudieron cargar las historias.';
        }
        this.cargando = false;
      },
      error: (err) => {
        console.error(err);
        this.error = 'Error de conexión con el servidor.';
        this.cargando = false;
      }
    });
  }

  cambiarEstado(historia: HistoriaModel, nuevoEstado: 'Aprobada' | 'Rechazada'): void {
    let comentario = '';

    // Si el admin rechaza la historia, le pedimos un motivo
    if (nuevoEstado === 'Rechazada') {
      const input = prompt(`¿Por qué rechazas la historia "${historia.titulo}"?`);
      if (input === null) return; // Si el admin cancela el prompt, no hacemos nada
      comentario = input;
    }

    // Llamamos al servicio (asegúrate de haber añadido el método moderarHistoria al servicio)
    this.historiaService.moderarHistoria(historia.id_historia, nuevoEstado, comentario).subscribe({
      next: (respuesta) => {
        if (respuesta.status === 'success') {
          alert(`La historia ha sido ${nuevoEstado.toLowerCase()} correctamente.`);

          // Actualizamos la lista quitando la historia que acabamos de moderar
          this.historiasPendientes = this.historiasPendientes.filter(
            h => h.id_historia !== historia.id_historia
          );
        }
      },
      error: (err) => {
        console.error('Error al moderar:', err);
        alert('Hubo un error al procesar tu solicitud.');
      }
    });
  }
}
