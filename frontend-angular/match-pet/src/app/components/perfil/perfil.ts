import { Component, OnInit, Inject, PLATFORM_ID } from '@angular/core';
import { CommonModule, isPlatformBrowser } from '@angular/common';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators, AbstractControl, ValidationErrors } from '@angular/forms';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { AuthService } from '../../services/auth';
import { ChangeDetectorRef } from '@angular/core';
 
function passwordsMatch(control: AbstractControl): ValidationErrors | null {
  const nueva = control.get('password_nuevo')?.value;
  const confirmar = control.get('confirmar_password')?.value;
  return nueva === confirmar ? null : { passwordsMismatch: true };
}
 
@Component({
  selector: 'app-perfil',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, FormsModule],
  templateUrl: './perfil.html',
  styleUrls: ['./perfil.css']
})
export class PerfilComponent implements OnInit {
 
  private readonly BASE_URL = 'http://localhost/refugioAnimalesMatchPet/backend-php/api/usuarios';
  private readonly URL_AVATARS = 'http://localhost/refugioAnimalesMatchPet/backend-php/public/avatars/';
 
  usuario: any = null;
  cargando = true;
  tabActiva: 'datos' | 'password' | 'eliminar' = 'datos';
 
  perfilForm!: FormGroup;
  passwordForm!: FormGroup;
 
  guardando = false;
  guardandoPassword = false;
  eliminando = false;
 
  mensajeExito = '';
  mensajeError = '';
  mensajePasswordExito = '';
  mensajePasswordError = '';
 
  confirmarEliminar = false;
  emailConfirmacion = '';
 
  constructor(
    private fb: FormBuilder,
    private http: HttpClient,
    private router: Router,
    private authService: AuthService,
    private cdr: ChangeDetectorRef,
    @Inject(PLATFORM_ID) private platformId: Object
  ) {}
 
  ngOnInit(): void {
    console.log('mensajeExito al init:', this.mensajeExito);
    this.cargarPerfil();
    this.inicializarPasswordForm();
  }
 
  get urlAvatar(): string {
    const avatar = this.usuario?.avatar;
    if (avatar && avatar !== 'default_avatar.png') {
      return `${this.URL_AVATARS}${avatar}`;
    }
    return `${this.URL_AVATARS}default_avatar.png`;
  }
 
  private getHeaders(): HttpHeaders {
    const token = isPlatformBrowser(this.platformId) ? localStorage.getItem('auth_token') : '';
    return new HttpHeaders({ Authorization: `Bearer ${token}` });
  }

  notificacionVisible = true;
  notificacionFadeOut(): void {
    setTimeout(() => {
      this.notificacionVisible = false;
      this.cdr.detectChanges();

      setTimeout(() => {
        this.mensajeExito = '';
        this.mensajeError = '';
        this.mensajePasswordExito = '';
        this.mensajePasswordError = '';
        this.notificacionVisible = true;
        this.cdr.detectChanges();
      }, 1000);
    }, 4000);
  }
 
  cargarPerfil(): void {
    this.http.get<any>(`${this.BASE_URL}/ver_perfil.php`, { headers: this.getHeaders() }).subscribe({
      next: (res) => {
        console.log('Respuesta:', res);
        if (res.status === 'success') {
          this.usuario = res.data;
          this.inicializarPerfilForm();
          this.cdr.detectChanges();
        }
        this.cargando = false;
      },
      error: (err) => {
        console.log('Error ver_perfil:', err);
        this.cargando = false;
        this.cdr.detectChanges();
      }
    });
  }
 
  inicializarPerfilForm(): void {
    this.perfilForm = this.fb.group({
      nombre_completo:  [this.usuario.nombre_completo, Validators.required],
      email:            [this.usuario.email, [Validators.required, Validators.email]],
      dni_nie:          [this.usuario.dni_nie],
      fecha_nacimiento: [this.usuario.fecha_nacimiento],
      telefono:         [this.usuario.telefono],
      direccion:        [this.usuario.direccion],
      poblacion:        [this.usuario.poblacion],
      provincia:        [this.usuario.provincia],
      codigo_postal:    [this.usuario.codigo_postal],
      pref_especie:     [this.usuario.pref_especie],
      pref_energia:     [this.usuario.pref_energia],
      pref_vivienda:    [this.usuario.pref_vivienda],
      bio_experiencia:  [this.usuario.bio_experiencia],
    });
  }
 
  inicializarPasswordForm(): void {
    this.passwordForm = this.fb.group(
      {
        password_actual:    ['', Validators.required],
        password_nuevo:     ['', [Validators.required, Validators.minLength(6)]],
        confirmar_password: ['', Validators.required],
      },
      { validators: passwordsMatch }
    );
  }
 
  guardarPerfil(): void {
    if (this.perfilForm.invalid) return;
    if (!this.perfilForm.dirty) {
      this.mensajeError = 'No hay cambios para guardar.';
      this.cdr.detectChanges();
      return;
    }
    this.guardando = true;

    const payload = Object.fromEntries(
      Object.entries(this.perfilForm.value).map(([k, v]) => [k, v === '' ? null : v])
    );
 
    this.http.post<any>(`${this.BASE_URL}/editar_perfil.php`, payload, { headers: this.getHeaders() }).subscribe({
      next: (res) => {
        this.mensajeExito = res.message || 'Perfil actualizado correctamente.';
        this.guardando = false;
        this.cdr.detectChanges();
        this.notificacionFadeOut();
      },
      error: (err) => {
        this.mensajeError = err.error?.message || 'Error al guardar los cambios.';
        this.guardando = false;
        this.cdr.detectChanges();
        this.notificacionFadeOut();
      }
    });
  }

  subirAvatar(event: Event): void {
  const input = event.target as HTMLInputElement;
  if (!input.files?.length) return;

  const file = input.files[0];

  const formData = new FormData();
  formData.append('avatar', file);

  this.http.post<any>(`${this.BASE_URL}/subir_avatar.php`, formData, { headers: this.getHeaders() }).subscribe({
    next: (res) => {
      if (res.status === 'success') {
        this.usuario.avatar = res.avatar;
        localStorage.setItem('usuario_avatar', res.avatar);
        this.mensajeExito = res.message;
        this.cdr.detectChanges();
        this.notificacionFadeOut();
      }
    },
    error: (err) => {
      this.mensajeError = err.error?.message || 'Error al subir la imagen.';
      this.cdr.detectChanges();
      this.notificacionFadeOut();
    }
  });
}
 
  cambiarPassword(): void {
    if (this.passwordForm.invalid) return;
    this.guardandoPassword = true;
    this.mensajePasswordExito = '';
    this.mensajePasswordError = '';
    this.cdr.detectChanges();
 
    const { password_actual, password_nuevo } = this.passwordForm.value;
    console.log('Enviando:', { password_actual, password_nuevo });
 
    this.http.post<any>(`${this.BASE_URL}/cambiar_password.php`, { password_actual, password_nuevo }, { headers: this.getHeaders() }).subscribe({
      next: (res) => {
        this.mensajePasswordExito = res.message || 'Contraseña cambiada correctamente.';
        this.passwordForm.reset();
        this.guardandoPassword = false;
        this.cdr.detectChanges();
        this.notificacionFadeOut();
      },
      error: (err) => {
        this.mensajePasswordError = err.error?.message || 'Error al cambiar la contraseña.';
        this.guardandoPassword = false;
        this.cdr.detectChanges();
        this.notificacionFadeOut();
      }
    });
  }
 
  eliminarCuenta(): void {
    if (this.emailConfirmacion !== this.usuario.email) return;
    this.eliminando = true;
    this.cdr.detectChanges();
 
    this.http.delete<any>(`${this.BASE_URL}/eliminar_perfil.php`, { headers: this.getHeaders() }).subscribe({
      next: () => {
        this.authService.logout();
        this.router.navigate(['/']);
        this.cdr.detectChanges();
        this.notificacionFadeOut();
      },
      error: (err) => {
        this.mensajeError = err.error?.message || 'Error al eliminar la cuenta.';
        this.eliminando = false;
        this.cdr.detectChanges();
        this.notificacionFadeOut();
      }
    });
  }

  cambiarTab(tab: 'datos' | 'password' | 'eliminar'): void {
    this.tabActiva = tab;
    this.mensajeExito = '';
    this.mensajeError = '';
    this.mensajePasswordExito = '';
    this.mensajePasswordError = '';
    this.notificacionVisible = true;
    this.cdr.detectChanges();
  }
}
