import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { AuthService } from '../services/auth'; // <--- Verifica que esta ruta sea correcta

export const adminGuard: CanActivateFn = (route, state) => {
  const authService = inject(AuthService);
  const router = inject(Router);

  // Verificamos si es admin
  if (authService.isAdmin()) {
    return true; // Adelante, puede pasar
  }

  // Si no es admin, lo mandamos al inicio
  console.warn('Bloqueado por AdminGuard: No eres administrador.');
  router.navigate(['/']);
  return false;
};