import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
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

  // 2. Inyéctalo en el constructor
  constructor(
    private historiaService: HistoriaService,
    private cdr: ChangeDetectorRef
  ) { }

  ngOnInit(): void {
    this.cargarHistorias();
  }

  cargarHistorias(): void {
    this.cargando = true; // Iniciamos la carga

    this.historiaService.obtenerHistorias().subscribe({
      next: (respuesta) => {
        console.log('Datos recibidos de PHP:', respuesta); // <-- Para ver qué llega en la consola

        if (respuesta.status === 'success') {
          this.historias = respuesta.data;
        } else {
          this.error = 'Ocurrió un problema al cargar los datos.';
        }

        this.cargando = false; // Detenemos la carga
        this.cdr.detectChanges(); // 3. EL TOQUE MÁGICO: Actualiza la vista
      },
      error: (err) => {
        console.error('Error de HTTP:', err);
        this.error = 'No se pudo conectar con el servidor.';
        this.cargando = false; // Detenemos la carga incluso si hay error
        this.cdr.detectChanges(); // 3. EL TOQUE MÁGICO: Actualiza la vista
      }
    });
  }
}