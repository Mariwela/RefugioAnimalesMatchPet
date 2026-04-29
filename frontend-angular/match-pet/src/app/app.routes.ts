import { Routes } from '@angular/router';

// Importaciones que ya tenías
import { HomeComponent } from './home/home.component';
import { AnimalComponent } from './components/animal.component/animal.component';
import { AnimalDetalleComponent } from './components/animal-detalle.component/animal-detalle.component';

// 1. IMPORTANTE: Importar tu nuevo componente de Login
// (Asegúrate de que la ruta coincida con la ubicación real de tu archivo)
import { LoginComponent } from './components/login.component/login.component';
import { AnimalEditComponent } from './componentes/animal-edit.component/animal-edit.component';

export const routes: Routes = [
    // Rutas públicas que ya tenías
    { path: '', component: HomeComponent },
    { path: 'animales', component: AnimalComponent },
    { path: 'animal/:id', component: AnimalDetalleComponent },

    // 2. Agregamos la ruta del Login
    { path: 'login', component: LoginComponent },

    // 3. Aquí irás agregando los demás componentes a medida que los crees.
    // Por ahora los dejamos comentados para que no te dé error si aún no existen los archivos:

    // { path: 'eventos', component: EventosComponent },
    // { path: 'comunidad', component: ComunidadComponent },

    // -- Paneles de usuario (Rutas que deberían ser privadas) --
    // { path: 'admin-panel', component: AdminPanelComponent },
    // { path: 'veterinaria-panel', component: VetPanelComponent },
    // { path: 'acogida-dashboard', component: AcogidaComponent },
    { path: 'animales/editar/:id', component: AnimalEditComponent },
    // 4. RUTA COMODÍN (Wildcard)
    // Es una buena práctica poner esto al final. Si el usuario escribe una URL 
    // que no existe (ej: localhost:4200/rutainventada), lo redirige al inicio.
    { path: '**', redirectTo: '' }
];