import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AnimalDetalleComponent } from './animal-detalle.component';

describe('AnimalDetalleComponent', () => {
  let component: AnimalDetalleComponent;
  let fixture: ComponentFixture<AnimalDetalleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AnimalDetalleComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AnimalDetalleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
