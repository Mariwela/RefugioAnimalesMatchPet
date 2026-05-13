import { inject, Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AnimalService {
  private baseUrl = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/animales';

  constructor(private http: HttpClient) { }

  crearAnimal(formData: FormData): Observable<any> {
    const token = localStorage.getItem('auth_token') || '';

    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}`
    });

    return this.http.post<any>(
      `${this.baseUrl}/insertar_animal.php`,
      formData,
      { headers }
    );
  }

  getAnimalesDisponibles(pagina: number = 1): Observable<any> {
    return this.http.get<any>(`${this.baseUrl}/listar.php?pagina=${pagina}`);
  }

  eliminarAnimal(id: number): Observable<any> {
    const token = localStorage.getItem('auth_token');
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}`
    });

    return this.http.post(
      `${this.baseUrl}/eliminar_animal.php`,
      { id_animal: id },
      { headers: headers }
    );
  }

  getAnimalById(id: number): Observable<any> {
    return this.http.get<any>(`${this.baseUrl}/detalle.php?id=${id}`);
  }

  getAnimalByFoto(id: number): Observable<any> {
    return this.getAnimalById(id);
  }

  actualizarAnimal(datosAnimal: any) {
    const token = localStorage.getItem('auth_token') || '';

    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    });

    return this.http.post<any>(
      `${this.baseUrl}/editar_animal.php`,
      datosAnimal,
      { headers }
    );
  }

  getSolicitudes(): Observable<any> {
    const token = localStorage.getItem('auth_token') || '';
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}`
    });

    const urlSolicitudes = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/solicitudes/listar_solicitudes.php';

    return this.http.get<any>(urlSolicitudes, { headers });
  }

  enviarSolicitud(id_animal: number): Observable<any> {
    const token = localStorage.getItem('auth_token') || '';

    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    });

    const url = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/solicitudes/enviar_solicitud.php';

    return this.http.post<any>(url, { id_animal: id_animal }, { headers });
  }

  gestionarSolicitud(id_solicitud: number, nuevo_estado: string, comentario: string = ''): Observable<any> {
    const token = localStorage.getItem('auth_token') || '';

    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    });

    const url = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/solicitudes/gestionar_solicitud.php';

    const body = {
      id_solicitud: id_solicitud,
      nuevo_estado: nuevo_estado,
      comentario_admin: comentario
    };

    return this.http.post<any>(url, body, { headers });
  }

  validarAdopcion(id_solicitud: number, id_animal: number): Observable<any> {
    const token = localStorage.getItem('auth_token') || '';

    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    });

    const url = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/solicitudes/validar_adopcion.php';

    const body = {
      id_solicitud: id_solicitud,
      id_animal: id_animal
    };

    return this.http.post<any>(url, body, { headers });
  }

  getResumenNotificaciones(): Observable<any> {
    const token = localStorage.getItem('auth_token') || '';
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}`
    });

    const url = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/notificaciones/notificaciones.php';

    return this.http.get<any>(url, { headers });
  }

  filtrarAnimales(filtros: any): Observable<any> {
    let params = new HttpParams();

    if (filtros.texto && filtros.texto.trim() !== '') {
      params = params.set('texto', filtros.texto);
    }
    if (filtros.especie && filtros.especie !== '') {
      params = params.set('especie', filtros.especie);
    }
    if (filtros.tamano && filtros.tamano !== '') {
      params = params.set('tamano', filtros.tamano);
    }
    if (filtros.sexo && filtros.sexo !== '') {
      params = params.set('sexo', filtros.sexo);
    }

    if (filtros.nivel_energia && filtros.nivel_energia !== '') {
      params = params.set('nivel_energia', filtros.nivel_energia);
    }

    if (filtros.pagina) {
      params = params.set('pagina', filtros.pagina.toString());
    }

    return this.http.get(`${this.baseUrl}/filtrar_animales.php`, { params: params });
  }

  subirFotoAnimal(formData: FormData): Observable<any> {
    const token = localStorage.getItem('auth_token') || '';
    const headers = new HttpHeaders({ 'Authorization': `Bearer ${token}` });
    return this.http.post<any>(
      `${this.baseUrl}/subir_foto_animal.php`,
      formData,
      { headers }
    );
  }

  eliminarFotoAnimal(data: { id_foto?: number, id_animal?: number, es_portada?: number }): Observable<any> {
    const token = localStorage.getItem('auth_token') || '';
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json'
    });
    return this.http.post<any>(
      `${this.baseUrl}/eliminar_foto_animal.php`,
      data,
      { headers }
    );
  }

}
