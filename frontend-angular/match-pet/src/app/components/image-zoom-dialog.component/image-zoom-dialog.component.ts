import { Component, Inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MAT_DIALOG_DATA, MatDialogRef, MatDialogModule } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';

@Component({
  selector: 'app-image-zoom-dialog',
  standalone: true,
  imports: [CommonModule, MatDialogModule, MatButtonModule, MatIconModule],
  template: `
    <div class="zoom-contenedor">
      <button mat-icon-button class="btn-cerrar" (click)="dialogRef.close()">
        <mat-icon>close</mat-icon>
      </button>

      @if (imagenes.length > 1) {
        <button mat-icon-button class="btn-nav anterior" (click)="fotoAnterior()">
          <mat-icon>chevron_left</mat-icon>
        </button>
      }

      <img [src]="imagenes[indiceActual]" class="imagen-zoomeada" alt="Zoom animal">

      @if (imagenes.length > 1) {
        <button mat-icon-button class="btn-nav siguiente" (click)="fotoSiguiente()">
          <mat-icon>chevron_right</mat-icon>
        </button>
      }
    </div>
  `,
  styles: [`
    .zoom-contenedor {
      position: relative;
      display: flex;
      align-items: center;
      justify-content: center;
      background-color: rgba(0, 0, 0, 0.9);
      width: 100vw;
      height: 100vh;
      overflow: hidden;
    }
    .imagen-zoomeada {
      max-width: 90vw;
      max-height: 90vh;
      object-fit: contain;
      border-radius: 8px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.5);
    }
    .btn-cerrar, .btn-nav {
      position: absolute;
      color: white;
      background: rgba(255, 255, 255, 0.1);
      z-index: 10;
    }
    .btn-cerrar:hover, .btn-nav:hover {
      background: rgba(255, 255, 255, 0.3);
    }
    .btn-cerrar {
      top: 20px;
      right: 20px;
    }
    .btn-nav {
      top: 50%;
      transform: translateY(-50%);
      width: 50px;
      height: 50px;
    }
    .btn-nav mat-icon {
      font-size: 30px;
      width: 30px;
      height: 30px;
      line-height: 30px;
    }
    .anterior { left: 20px; }
    .siguiente { right: 20px; }
  `]
})
export class ImageZoomDialogComponent {
  imagenes: string[] = [];
  indiceActual: number = 0;

  constructor(
    public dialogRef: MatDialogRef<ImageZoomDialogComponent>,
    // Recibimos las imágenes y el índice de la foto que clickeó el usuario
    @Inject(MAT_DIALOG_DATA) public data: { imagenes: string[], indiceIndex: number }
  ) {
    this.imagenes = data.imagenes;
    this.indiceActual = data.indiceIndex;
  }

  fotoSiguiente() {
    // Si llega al final, vuelve a la primera
    this.indiceActual = (this.indiceActual + 1) % this.imagenes.length;
  }

  fotoAnterior() {
    // Si está en la primera, va a la última
    this.indiceActual = (this.indiceActual - 1 + this.imagenes.length) % this.imagenes.length;
  }
}