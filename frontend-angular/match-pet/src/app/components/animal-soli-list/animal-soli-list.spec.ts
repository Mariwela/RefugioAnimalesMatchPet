import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AnimalSoliList } from './animal-soli-list';

describe('AnimalSoliList', () => {
  let component: AnimalSoliList;
  let fixture: ComponentFixture<AnimalSoliList>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AnimalSoliList]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AnimalSoliList);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
