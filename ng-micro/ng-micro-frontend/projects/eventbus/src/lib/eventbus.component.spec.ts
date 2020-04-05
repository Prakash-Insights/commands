import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EventbusComponent } from './eventbus.component';

describe('EventbusComponent', () => {
  let component: EventbusComponent;
  let fixture: ComponentFixture<EventbusComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EventbusComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EventbusComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
