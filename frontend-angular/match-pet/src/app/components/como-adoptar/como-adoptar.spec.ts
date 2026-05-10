import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ComoAdoptar } from './como-adoptar';

describe('ComoAdoptar', () => {
  let component: ComoAdoptar;
  let fixture: ComponentFixture<ComoAdoptar>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ComoAdoptar]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ComoAdoptar);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
