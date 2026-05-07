import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';

@Injectable({
  providedIn: 'root',
})
export class Notificacion {
  // Apuntamos exactamente al archivo que me mostraste en tu carpeta
  private url = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/notificaciones/notificaciones.php';

  constructor(private http: HttpClient) { }

  getResumenNotificaciones(): Observable<any> {
    const token = localStorage.getItem('auth_token') || '';
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}`
    });

    return this.http.get<any>(this.url, { headers });
  }
}
