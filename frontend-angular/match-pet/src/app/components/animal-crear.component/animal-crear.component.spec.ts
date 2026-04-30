import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AnimalCrearComponent } from './animal-crear.component';

describe('AnimalCrearComponent', () => {
  let component: AnimalCrearComponent;
  let fixture: ComponentFixture<AnimalCrearComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AnimalCrearComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AnimalCrearComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
