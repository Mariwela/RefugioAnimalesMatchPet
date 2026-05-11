import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
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

  eliminarAnimal(id: number): Observable<any> {
    // 1. Rescatamos el token guardado cuando el usuario hizo login
    const token = localStorage.getItem('auth_token'); // Asegúrate de que este es el nombre con el que guardas tu token

    // 2. Preparamos la cabecera (Header) con el token
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}`
    });

    // 3. Enviamos la petición POST: URL, Cuerpo ({id_animal}), y las Cabeceras
    return this.http.post(
      `${this.baseUrl}/eliminar_animal.php`,
      { id_animal: id },
      { headers: headers }
    );
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

  // animal.service.ts
  getSolicitudes(): Observable<any> {
    const token = localStorage.getItem('auth_token') || '';
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}`
    });

    // REVISA ESTA LÍNEA: debe coincidir con el nombre de tu archivo en la carpeta
    const urlSolicitudes = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/solicitudes/listar_solicitudes.php';

    return this.http.get<any>(urlSolicitudes, { headers });
  }

  // Enviar una nueva solicitud de adopción
  enviarSolicitud(id_animal: number): Observable<any> {
    const token = localStorage.getItem('auth_token') || '';

    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    });

    // Ajusta 'crear.php' al nombre real de tu archivo
    const url = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/solicitudes/enviar_solicitud.php';

    // Enviamos el id_animal en el cuerpo (body) de la petición como espera tu PHP
    return this.http.post<any>(url, { id_animal: id_animal }, { headers });
  }

  // Gestionar el estado de una solicitud (Solo Admin)
  gestionarSolicitud(id_solicitud: number, nuevo_estado: string, comentario: string = ''): Observable<any> {
    const token = localStorage.getItem('auth_token') || '';

    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    });

    // Asegúrate de que el nombre del archivo sea exacto
    const url = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/solicitudes/gestionar_solicitud.php';

    const body = {
      id_solicitud: id_solicitud,
      nuevo_estado: nuevo_estado,
      comentario_admin: comentario
    };

    return this.http.post<any>(url, body, { headers });
  }

  // Validar adopción (Aprueba solicitud, adopta animal y rechaza las demás)
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

    // 👇 AQUÍ ESTÁ EL CAMBIO: apuntamos a notificaciones.php 👇
    const url = 'http://localhost/RefugioAnimalesMatchPet/backend-php/api/notificaciones/notificaciones.php';

    return this.http.get<any>(url, { headers });
  }

  filtrarAnimales(filtros: any): Observable<any> {
    let params = new HttpParams();

    // Solo añadimos a la URL los filtros que tengan texto
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

    // Petición GET enviando los parámetros
    return this.http.get(`${this.baseUrl}/filtrar_animales.php`, { params: params });
  }

}

