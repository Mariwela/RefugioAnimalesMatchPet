import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditarHistoria } from './editar-historia';

describe('EditarHistoria', () => {
  let component: EditarHistoria;
  let fixture: ComponentFixture<EditarHistoria>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [EditarHistoria]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EditarHistoria);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
