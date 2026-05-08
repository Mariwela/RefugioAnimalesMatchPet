import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PublicarHistoriasComponent } from './publicar-historias.component';

describe('PublicarHistoriasComponent', () => {
  let component: PublicarHistoriasComponent;
  let fixture: ComponentFixture<PublicarHistoriasComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [PublicarHistoriasComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PublicarHistoriasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
