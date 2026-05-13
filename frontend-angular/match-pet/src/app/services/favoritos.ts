import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class Favoritos {
  private apiUrl = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/favoritos';

  constructor(private http: HttpClient) { }

  private getHeaders(): HttpHeaders {
    const token = localStorage.getItem('auth_token');

    console.log("Token recuperado para la petición:", token);

    return new HttpHeaders({
      'Authorization': `Bearer ${token}`
    });
  }

  getFavoritos(): Observable<any> {
    return this.http.get(`${this.apiUrl}/listar_favoritos.php`, { headers: this.getHeaders() });
  }

  agregarFavorito(id_animal: number): Observable<any> {
    return this.http.post(`${this.apiUrl}/agregar_favorito.php`, { id_animal }, { headers: this.getHeaders() });
  }

  eliminarFavorito(id_animal: number): Observable<any> {
    return this.http.post(`${this.apiUrl}/eliminar_favorito.php`, { id_animal }, { headers: this.getHeaders() });
  }

}
