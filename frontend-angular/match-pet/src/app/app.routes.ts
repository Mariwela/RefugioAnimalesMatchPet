import { Routes } from '@angular/router';

// Importaciones existentes
import { HomeComponent } from './home/home.component';
import { AnimalComponent } from './components/animal.component/animal.component';
import { AnimalDetalleComponent } from './components/animal-detalle.component/animal-detalle.component';
import { LoginComponent } from './components/login.component/login.component';
import { AnimalEditComponent } from './components/animal-edit.component/animal-edit.component';
import { AnimalCrearComponent } from './components/animal-crear.component/animal-crear.component';
import { MisFavoritosComponent } from './components/mis-favoritos.component/mis-favoritos.component';
import { AnimalSoliList } from './components/animal-soli-list/animal-soli-list';
import { ListarHistoriasComponent } from './components/listar-historias.component/listar-historias.component';
import { ModerarHistoriasComponent } from './components/moderar-historias.component/moderar-historias.component';
import { PublicarHistoriasComponent } from './components/publicar-historias.component/publicar-historias.component';

// 👇 IMPORTACIÓN DE GUARDS 👇
import { authGuard } from './guards/auth-guard';
import { adminGuard } from './guards/admin-guard';

import { PoliticaPrivacidad} from './pages/politica-privacidad/politica-privacidad';
import { AvisoLegal } from './pages/aviso-legal/aviso-legal';
import { SobreNosotros } from './components/sobre-nosotros/sobre-nosotros';
import { Contacto } from './pages/contacto/contacto';
import { Donar } from './pages/donar/donar';
import { Acogida } from './components/acogida/acogida';
import { Voluntariado } from './components/voluntariado/voluntariado';

export const routes: Routes = [
    { path: '', component: HomeComponent },
    { path: 'animales', component: AnimalComponent },
    { path: 'animal/:id', component: AnimalDetalleComponent },
    { path: 'login', component: LoginComponent },
    { path: 'politica-privacidad', component: PoliticaPrivacidad},
    { path: 'aviso-legal', component: AvisoLegal },
    { path: 'sobre-nosotros', component: SobreNosotros },
    { path: 'contacto', component: Contacto },
    { path: 'donar', component: Donar },
    { path: 'acogida', component: Acogida },
    { path: 'voluntariado', component: Voluntariado },

    // Rutas protegidas para gestión de animales
    { path: 'animales/editar/:id', component: AnimalEditComponent },
    { path: 'animales/crear', component: AnimalCrearComponent },

    { path: 'mis-favoritos', component: MisFavoritosComponent },
    { path: 'mis-solicitudes', component: AnimalSoliList },

    // Rutas de Historias
    { path: 'historias', component: ListarHistoriasComponent },

    // Moderación: Solo para Admins
    {
        path: 'historias/moderar',
        component: ModerarHistoriasComponent,
        canActivate: [adminGuard]
    },

    // Publicación: Para usuarios logueados que hayan adoptado
    {
        path: 'historias/publicar',
        component: PublicarHistoriasComponent,
        canActivate: [authGuard]
    },

    // RUTA COMODÍN - Siempre al final
    { path: '**', redirectTo: '' }
];