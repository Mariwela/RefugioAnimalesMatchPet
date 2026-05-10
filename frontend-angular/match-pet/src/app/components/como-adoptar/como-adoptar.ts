import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';

@Component({
  selector: 'app-como-adoptar',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './como-adoptar.html',
  styleUrls: ['./como-adoptar.css']
})
export class ComoAdoptarComponent {
  pasos : { numero: number; titulo: string;  descripcion: SafeHtml; icono: string }[];
  constructor(private sanitizer: DomSanitizer) {
    this.pasos = [
      {
        numero: 1,
        titulo: 'Explora',
        descripcion: this.sanitizer.bypassSecurityTrustHtml(
          'Explora nuestro catálogo de animales o aún mejor, usa nuestro <a href="/match" class="highlight">MatchPet</a> para encontrar tu compañero perfecto según tu estilo de vida y necesidades.'
        ),
        icono: '🐾'
      },
      {
        numero: 2,
        titulo: 'Dale al botón de Adoptar',
        descripcion: 'Nuesto equipo revisará tu solicitud y se pondrá en contacto contigo para coordinar los siguientes pasos. ¡Es fácil y rápido!',
        icono: '📝'
      },
      {
        numero: 3,
        titulo: 'Entrevista y Visita',
        descripcion: 'Hablaremos sobre las responsabilidades y podrás conocer al animal en persona (o por videollamada).',
        icono: '🏠'
      },
      {
        numero: 4,
        titulo: 'Contrato y Seguimiento',
        descripcion: 'Se firma el contrato legal, se abonan los gastos veterinarios mínimos y ¡listo para ir a casa!',
        icono: '🤝'
      }
    ];
  }
}