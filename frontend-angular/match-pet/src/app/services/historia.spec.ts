import { TestBed } from '@angular/core/testing';

import { Historia } from './historia';

describe('Historia', () => {
  let service: Historia;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(Historia);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
