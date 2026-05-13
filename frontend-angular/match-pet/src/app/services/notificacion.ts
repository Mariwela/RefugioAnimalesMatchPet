import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class Notificacion {
  private url = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/notificaciones/notificaciones.php';
  private urlMarcarLeida = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/notificaciones/marcar_leida.php';

  constructor(private http: HttpClient) { }

  getResumenNotificaciones(): Observable<any> {
    const token = localStorage.getItem('auth_token') || '';
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}`
    });

    return this.http.get<any>(this.url, { headers });
  }


  marcarComoLeida(idNotificacion: number): Observable<any> {
    const token = localStorage.getItem('auth_token') || '';
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}`
    });


    return this.http.post<any>(this.urlMarcarLeida, { id: idNotificacion }, { headers });
  }
}