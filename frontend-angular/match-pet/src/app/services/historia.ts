import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs'; // Importación estándar
import { RespuestaHistorias } from '../interfaces/historia.model';

@Injectable({
  providedIn: 'root',
})
export class HistoriaService { // Renombrado a HistoriaService
  private apiUrl = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/historias/listar_historias.php';

  constructor(private http: HttpClient) { }

  obtenerHistorias(): Observable<RespuestaHistorias> {
    return this.http.get<RespuestaHistorias>(this.apiUrl);
  }
}