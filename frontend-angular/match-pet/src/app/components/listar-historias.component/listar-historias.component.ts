import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HistoriaModel } from '../../interfaces/historia.model';
import { HistoriaService } from '../../services/historia'; // Importamos el servicio

@Component({
  selector: 'app-listar-historias',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './listar-historias.component.html',
  styleUrl: './listar-historias.component.css',
})
export class ListarHistoriasComponent implements OnInit {
  historias: HistoriaModel[] = [];
  cargando: boolean = true;
  error: string = '';

  // Inyectamos HistoriaService
  constructor(private historiaService: HistoriaService) { }

  ngOnInit(): void {
    this.cargarHistorias();
  }

  cargarHistorias(): void {
    this.historiaService.obtenerHistorias().subscribe({
      next: (respuesta) => {
        if (respuesta.status === 'success') {
          this.historias = respuesta.data;
        } else {
          this.error = 'Ocurrió un problema al cargar los datos.';
        }
        this.cargando = false;
      },
      error: (err) => {
        console.error('Error de HTTP:', err);
        this.error = 'No se pudo conectar con el servidor. Revisa la consola y el CORS.';
        this.cargando = false;
      }
    });
  }
}