import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListarHistoriasComponent } from './listar-historias.component';

describe('ListarHistoriasComponent', () => {
  let component: ListarHistoriasComponent;
  let fixture: ComponentFixture<ListarHistoriasComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ListarHistoriasComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ListarHistoriasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
