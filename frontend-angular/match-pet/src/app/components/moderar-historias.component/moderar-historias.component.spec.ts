import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModerarHistoriasComponent } from './moderar-historias.component';

describe('ModerarHistoriasComponent', () => {
  let component: ModerarHistoriasComponent;
  let fixture: ComponentFixture<ModerarHistoriasComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ModerarHistoriasComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ModerarHistoriasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
