import { Component } from '@angular/core';
import { CommonModule } from '@angular/common'; // Necesario si usas *ngIf en el HTML
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms'; // Añadido ReactiveFormsModule
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth';

@Component({
  selector: 'app-login', // Le quité el '.component' para seguir el estándar
  standalone: true, // Asegura que es standalone
  imports: [ReactiveFormsModule, CommonModule], // ¡Muy importante para que funcione el formulario!
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
        next: (response: any) => {
          // Verificamos si el PHP devolvió éxito
          if (response.user) {
              this.authService.guardarDatosSesion(
                  response.token || 'token_ficticio', 
                  response.user.nombre_completo, // <-- Aquí añadimos .user
                  response.user.rol              // <-- Aquí también
              );

              alert('¡Bienvenido ' + response.user.nombre_completo + '!');
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