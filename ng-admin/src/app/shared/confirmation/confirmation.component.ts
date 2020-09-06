import { Component, OnInit, Input, EventEmitter, ViewChild, Output } from '@angular/core';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';

@Component({
  selector: 'app-confirmation',
  templateUrl: './confirmation.component.html',
  styleUrls: ['./confirmation.component.less']
})
export class ConfirmationComponent implements OnInit {
  @Input() text ?= "Are you Sure you want to Delete ?";
  @Output() close = new EventEmitter<boolean>();
  @ViewChild('confTemplate', { static: false }) confTemplate;
  confModalRef: BsModalRef;
  constructor(private modalService: BsModalService) { }

  ngOnInit() {
  }
  
  ngAfterViewInit() {
    this.confModalRef = this.modalService.show(this.confTemplate, {
      class: 'modal-dialog-centered modal-lg'
    });
  }

  closeModal(val: boolean) {
    this.confModalRef.hide();
    this.close.emit(val);
  }
}
