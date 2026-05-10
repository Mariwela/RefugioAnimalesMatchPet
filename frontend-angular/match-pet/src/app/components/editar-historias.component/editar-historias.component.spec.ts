import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditarHistoriasComponent } from './editar-historias.component';

describe('EditarHistoriasComponent', () => {
  let component: EditarHistoriasComponent;
  let fixture: ComponentFixture<EditarHistoriasComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [EditarHistoriasComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EditarHistoriasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
