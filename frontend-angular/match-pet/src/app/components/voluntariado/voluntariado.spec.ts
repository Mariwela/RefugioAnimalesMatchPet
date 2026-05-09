import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Voluntariado } from './voluntariado';

describe('Voluntariado', () => {
  let component: Voluntariado;
  let fixture: ComponentFixture<Voluntariado>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Voluntariado]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Voluntariado);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
