import { Component } from '@angular/core';
import { CommonModule } from '@angular/common'; // Necesario si usas *ngIf en el HTML
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms'; // Añadido ReactiveFormsModule
import { Router, RouterLink } from '@angular/router';
import { AuthService } from '../../services/auth';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule, RouterLink],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css',
})
export class LoginComponent {
  loginForm: FormGroup;
  errorMessage: string = '';

  constructor(
    private fb: FormBuilder,
    private authService: AuthService,
    private router: Router
  ) {
    this.loginForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', Validators.required]
    });
  }

  onSubmit() {
    if (this.loginForm.valid) {
      const { email, password } = this.loginForm.value;

  this.authService.login(email, password).subscribe({
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
}