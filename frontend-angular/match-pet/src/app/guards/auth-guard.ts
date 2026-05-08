import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { AuthService } from '../services/auth'; // <-- Ajusta esta ruta a donde esté tu AuthService

export const authGuard: CanActivateFn = (route, state) => {
  const authService = inject(AuthService);
  const router = inject(Router);

  // Si el usuario tiene sesión iniciada, lo dejamos pasar
  if (authService.isLoggedIn()) {
    return true;
  }

  // Si no, lo mandamos al login
  router.navigate(['/login']);
  return false;
};