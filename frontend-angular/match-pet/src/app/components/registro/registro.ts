import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators, AbstractControl, ValidationErrors } from '@angular/forms';
import { RouterLink, Router } from '@angular/router';
import { AuthService } from '../../services/auth';
 
function passwordsMatch(control: AbstractControl): ValidationErrors | null {
  const password = control.get('password')?.value;
  const confirmar = control.get('confirmar_password')?.value;
  return password === confirmar ? null : { passwordsMismatch: true };
}
 
@Component({
  selector: 'app-registro',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, RouterLink],
  templateUrl: './registro.html',
  styleUrls: ['./registro.css']
})
export class RegistroComponent {
  registroForm: FormGroup;
  errorMessage = '';
 
  constructor(
    private fb: FormBuilder,
    private authService: AuthService,
    private router: Router
  ) {
    this.registroForm = this.fb.group(
      {
        nombre_completo: ['', Validators.required],
        email:           ['', [Validators.required, Validators.email]],
        telefono:        [''],
        password:        ['', [Validators.required, Validators.minLength(8)]],
        confirmar_password: ['', Validators.required],
      },
      { validators: passwordsMatch }
    );
  }
 
  onSubmit(): void {
    if (this.registroForm.invalid) return;

    const { confirmar_password, ...payload } = this.registroForm.value;

    this.authService.registro(payload).subscribe({
      next: (res) => {
        if (res.token && res.user) {
          this.authService.guardarDatosSesion(
            res.token,
            res.user.nombre_completo,
            res.user.rol,
            res.user.avatar,
            res.user.id_usuario
          );
          this.router.navigate(['/home']);
        }
      },
      error: (err) => {
        this.errorMessage = err.error?.message || 'Error al conectar con el servidor';
      }
    });
  }
}
