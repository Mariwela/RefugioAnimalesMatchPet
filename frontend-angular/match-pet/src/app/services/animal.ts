import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AnimalService {
  // CORRECCIÓN CLAVE: La URL ahora coincide exactamente con tu servidor local
  private baseUrl = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/animales';

  constructor(private http: HttpClient) { }

  // 2. Conecta con listar.php
  getAnimalesDisponibles(pagina: number = 1): Observable<any> {
    return this.http.get<any>(`${this.baseUrl}/listar.php?pagina=${pagina}`);
  }

  // 3. Conecta con detalle.php (trae TODO: animal + fotos + salud)
  getAnimalById(id: number): Observable<any> {
    return this.http.get<any>(`${this.baseUrl}/detalle.php?id=${id}`);
  }

  // 4. Esta función ya no es necesaria porque detalle.php ya trae las fotos,
  // la dejamos vacía o retornando el detalle para que el código de tu amigo no explote.
  getAnimalByFoto(id: number): Observable<any> {
    return this.getAnimalById(id);
  }

  actualizarAnimal(datosAnimal: any) {
    const token = localStorage.getItem('auth_token') || '';

    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    });

    // CORRECCIÓN: Usamos this.baseUrl en lugar de 'http://tu-dominio/...'
    return this.http.post<any>(
      `${this.baseUrl}/editar_animal.php`,
      datosAnimal,
      { headers }
    );
  }
  // ... (resto de tu código arriba)

  getSolicitudes(): Observable<any> {
    const token = localStorage.getItem('auth_token') || '';

    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}`
    });

    // CORRECCIÓN: Ponemos la ruta exacta hacia la carpeta de solicitudes
    // (Ajusta 'listar.php' si el archivo PHP se llama de otra manera)
    const urlSolicitudes = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/solicitudes/listar_solicitudes.php';

    return this.http.get<any>(urlSolicitudes, { headers });
  }

}

