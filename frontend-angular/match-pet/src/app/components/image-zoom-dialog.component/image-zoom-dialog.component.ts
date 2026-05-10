// image-zoom-dialog.component.ts
import { Component, Inject, HostListener } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MAT_DIALOG_DATA, MatDialogRef, MatDialogModule } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';

@Component({
  selector: 'app-image-zoom-dialog',
  standalone: true,
  imports: [
    CommonModule,
    MatDialogModule,
    MatButtonModule,
    MatIconModule
  ],
  templateUrl: './image-zoom-dialog.component.html',
  styleUrls: ['./image-zoom-dialog.component.css']
})
export class ImageZoomDialogComponent {
  imagenes: string[] = [];
  indiceActual: number = 0;

  constructor(
    public dialogRef: MatDialogRef<ImageZoomDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: { imagenes: string[], indiceIndex: number }
  ) {
    this.imagenes = data.imagenes;
    this.indiceActual = data.indiceIndex;
  }

  // 👇 Navegación por teclado (¡Muy importante para la UX!) 👇
  @HostListener('window:keydown', ['$event'])
  manejarTeclado(event: KeyboardEvent) {
    if (this.imagenes.length > 1) {
      if (event.key === 'ArrowRight') {
        this.fotoSiguiente();
      } else if (event.key === 'ArrowLeft') {
        this.fotoAnterior();
      }
    }
  }

  fotoSiguiente() {
    this.indiceActual = (this.indiceActual + 1) % this.imagenes.length;
  }

  fotoAnterior() {
    this.indiceActual = (this.indiceActual - 1 + this.imagenes.length) % this.imagenes.length;
  }
}