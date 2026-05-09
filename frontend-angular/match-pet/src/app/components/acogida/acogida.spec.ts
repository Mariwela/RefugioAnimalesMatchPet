import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Acogida } from './acogida';

describe('Acogida', () => {
  let component: Acogida;
  let fixture: ComponentFixture<Acogida>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Acogida]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Acogida);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
