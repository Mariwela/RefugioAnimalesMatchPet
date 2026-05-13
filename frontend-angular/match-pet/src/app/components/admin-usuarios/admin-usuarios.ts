import { Component, OnInit, Inject, PLATFORM_ID } from '@angular/core';
import { CommonModule, isPlatformBrowser } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { AuthService } from '../../services/auth';
import { ChangeDetectorRef } from '@angular/core';
import { debounceTime, distinctUntilChanged, Subject } from 'rxjs';
 
type Grupo = 'todos' | 'adoptante' | 'voluntario' | 'acogida';
 
interface Usuario {
  id_usuario: number;
  nombre_completo: string;
  email: string;
  telefono: string;
  poblacion: string;
  provincia: string;
  rol: string;
  avatar: string;
  fecha_registro: string;
  disponibilidad_acogida: string;
  pref_especie: string;
  area_interes: string;
  es_voluntario: boolean;
  es_acogida: boolean;
  es_adoptante: boolean;
}
 
interface Totales {
  total: string;
  voluntarios: string;
  acogida: string;
  adoptantes: string;
}
 
@Component({
  selector: 'app-admin-usuarios',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './admin-usuarios.html',
  styleUrls: ['./admin-usuarios.css']
})
export class AdminUsuariosComponent implements OnInit {
 
  private readonly BASE_URL = 'http://localhost/refugioAnimalesMatchPet/backend-php/api/usuarios';
  private readonly URL_AVATARS = 'http://localhost/refugioAnimalesMatchPet/backend-php/public/avatars/';
 
  cargando = true;
  usuarios: Usuario[] = [];
  totales: Totales = { total: '0', voluntarios: '0', acogida: '0', adoptantes: '0' };
 
  grupoActivo: Grupo = 'todos';
  busqueda = '';
  private busqueda$ = new Subject<string>();
 
  mensajeError = '';

  usuarioAEliminar: Usuario | null = null;
  eliminando = false;
  mensajeEliminacion = '';
 
  readonly grupos: { key: Grupo; label: string; emoji: string; color: string }[] = [
    { key: 'todos',      label: 'Todos',       emoji: '👥', color: 'gray'   },
    { key: 'adoptante',  label: 'Adoptantes',  emoji: '🏠', color: 'blue'   },
    { key: 'voluntario', label: 'Voluntarios', emoji: '🤝', color: 'green'  },
    { key: 'acogida',    label: 'Acogida',     emoji: '🐾', color: 'orange' },
  ];
 
  constructor(
    private http: HttpClient,
    private router: Router,
    public authService: AuthService,
    private cdr: ChangeDetectorRef,
    @Inject(PLATFORM_ID) private platformId: Object
  ) {}
 
  ngOnInit(): void {
    if (!this.authService.isAdmin()) {
      this.router.navigate(['/']);
      return;
    }
 
    this.busqueda$
      .pipe(debounceTime(350), distinctUntilChanged())
      .subscribe(() => this.cargarUsuarios());
 
    this.cargarUsuarios();
  }
 
  private getHeaders(): HttpHeaders {
    const token = isPlatformBrowser(this.platformId) ? localStorage.getItem('auth_token') : '';
    return new HttpHeaders({ Authorization: `Bearer ${token}` });
  }
 
  cargarUsuarios(): void {
    this.cargando = true;
    this.mensajeError = '';
 
    const params: Record<string, string> = { grupo: this.grupoActivo };
    if (this.busqueda.trim()) params['busqueda'] = this.busqueda.trim();
 
    const queryString = new URLSearchParams(params).toString();
 
    this.http
      .get<any>(`${this.BASE_URL}/listar_usuarios_grupos.php?${queryString}`, { headers: this.getHeaders() })
      .subscribe({
        next: (res) => {
          if (res.status === 'success') {
            this.usuarios = res.usuarios;
            this.totales  = res.totales;
          } else {
            this.mensajeError = res.message || 'Error al cargar usuarios.';
          }
          this.cargando = false;
          this.cdr.detectChanges();
        },
        error: (err) => {
          this.mensajeError = err.error?.message || 'Error de conexión.';
          this.cargando = false;
          this.cdr.detectChanges();
        }
      });
  }
 
  cambiarGrupo(grupo: Grupo): void {
    this.grupoActivo = grupo;
    this.cargarUsuarios();
  }
 
  onBusqueda(): void {
    this.busqueda$.next(this.busqueda);
  }
 
  verPerfil(id: number): void {
    this.router.navigate(['/perfil', id]);
  }
 
  abrirConfirmacion(u: Usuario): void {
    this.usuarioAEliminar = u;
    this.mensajeEliminacion = '';
  }
 
  cerrarConfirmacion(): void {
    this.usuarioAEliminar = null;
    this.mensajeEliminacion = '';
    this.eliminando = false;
  }
 
  confirmarEliminar(): void {
    if (!this.usuarioAEliminar) return;
    this.eliminando = true;
    this.mensajeEliminacion = '';
 
    this.http
      .delete<any>(
        `${this.BASE_URL}/eliminar_usuario_admin.php`,
        {
          headers: this.getHeaders(),
          body: { id_usuario: this.usuarioAEliminar.id_usuario }
        }
      )
      .subscribe({
        next: (res) => {
          this.usuarios = this.usuarios.filter(u => u.id_usuario !== this.usuarioAEliminar!.id_usuario);
          this.totales.total = String(Number(this.totales.total) - 1);
          this.cerrarConfirmacion();
          this.cdr.detectChanges();
        },
        error: (err) => {
          this.mensajeEliminacion = err.error?.message || 'Error al eliminar la cuenta.';
          this.eliminando = false;
          this.cdr.detectChanges();
        }
      });
  }
 
  getUrlAvatar(avatar: string): string {
    if (avatar && avatar !== 'default_avatar.png') {
      return `${this.URL_AVATARS}${avatar}`;
    }
    return `${this.URL_AVATARS}default_avatar.png`;
  }
 
  getTotalGrupo(grupo: Grupo): string {
    switch (grupo) {
      case 'todos':      return this.totales.total;
      case 'adoptante':  return this.totales.adoptantes;
      case 'voluntario': return this.totales.voluntarios;
      case 'acogida':    return this.totales.acogida;
    }
  }
 
  getBadgesUsuario(u: Usuario): { label: string; clase: string }[] {
    const badges = [];
    if (u.es_adoptante)  badges.push({ label: '🏠 Adoptante',  clase: 'badge--blue'   });
    if (u.es_voluntario) badges.push({ label: '🤝 Voluntario', clase: 'badge--green'  });
    if (u.es_acogida)    badges.push({ label: '🐾 Acogida',    clase: 'badge--orange' });
    if (!badges.length)  badges.push({ label: '👤 Sin grupo',  clase: 'badge--gray'   });
    return badges;
  }
 
  getEstadoAcogida(estado: string): string {
    const map: Record<string, string> = {
      disponible:    '🟢 Disponible',
      ocupado:       '🟡 Ocupado',
      pausa:         '🔴 En pausa',
      no_disponible: '⚫ No disponible',
    };
    return map[estado] ?? estado;
  }
}