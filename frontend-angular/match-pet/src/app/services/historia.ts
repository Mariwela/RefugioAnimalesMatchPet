import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { RespuestaHistorias } from '../interfaces/historia.model';
import { Observable } from 'rxjs/internal/Observable';
@Injectable({
  providedIn: 'root',
})
export class Historia {
  // ATENCIÓN: Cambia esta URL por la ruta real de tu servidor local o en producción
  private apiUrl = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/historias/listar_historias.php';

  constructor(private http: HttpClient) { }

  obtenerHistorias(): Observable<RespuestaHistorias> {
    return this.http.get<RespuestaHistorias>(this.apiUrl);
  }
}
