import { Routes } from '@angular/router';

// Importaciones que ya tenías
import { HomeComponent } from './home/home.component';
import { AnimalComponent } from './components/animal.component/animal.component';
import { AnimalDetalleComponent } from './components/animal-detalle.component/animal-detalle.component';
import { LoginComponent } from './components/login.component/login.component';
import { AnimalEditComponent } from './components/animal-edit.component/animal-edit.component';
import { AnimalCrearComponent } from './components/animal-crear.component/animal-crear.component';

// 👇 1. NUEVO: Importa el componente de Favoritos 👇
import { MisFavoritosComponent } from './components/mis-favoritos.component/mis-favoritos.component';

export const routes: Routes = [
    // Rutas públicas que ya tenías
    { path: '', component: HomeComponent },
    { path: 'animales', component: AnimalComponent },
    { path: 'animal/:id', component: AnimalDetalleComponent },

    // Agregamos la ruta del Login
    { path: 'login', component: LoginComponent },

    // -- Paneles de usuario (Rutas que deberían ser privadas) --
    { path: 'animales/editar/:id', component: AnimalEditComponent },
    { path: 'animales/crear', component: AnimalCrearComponent },

    // 👇 2. NUEVO: Añadimos la ruta para "Mis Favoritos" 👇
    { path: 'mis-favoritos', component: MisFavoritosComponent },

    // RUTA COMODÍN (Wildcard) - Siempre al final
    { path: '**', redirectTo: '' }
];