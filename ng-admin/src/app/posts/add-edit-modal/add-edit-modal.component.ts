import { Component, OnInit, AfterViewInit, ViewChild, EventEmitter, Output, Input } from '@angular/core';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { FormComponent } from '../../shared/components/form/form.component';
import { FormBuilder, Validators } from '@angular/forms';
import { PostService } from '../../services/post.service';
import { PostModel } from '../../models/post.model';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'add-edit-post',
  templateUrl: './add-edit-modal.component.html',
  styleUrls: ['./add-edit-modal.component.less']
})
export class AddEditModalComponent extends FormComponent implements OnInit, AfterViewInit {
  @Input() postData: PostModel; 
  loading: boolean = true;
  @Input() users;
  @ViewChild('template', { static: false }) template;
  @Output() close = new EventEmitter<boolean>();
  modalRef: BsModalRef;
  constructor(private modalService: BsModalService, private formBuilder: FormBuilder, 
    private postService: PostService, private toastr: ToastrService) {
    super();
  }

  ngOnInit() {
    this.form = this.formBuilder.group({
      id: [null],
      userId: ['', Validators.required],
      title: ['', Validators.required],
      body: ['', Validators.required]
    });
    
    if (!!this.postData) {
      // set value in form when edit
      Object.keys(this.form.controls).forEach(key => {
        this.form.controls[key].patchValue(this.postData[key]);
      });
    }
    this.loading = false;
  }

  ngAfterViewInit() {
    //show view in modal popup when view init
    this.modalRef = this.modalService.show(this.template, {
      class: 'modal-dialog-centered modal-lg',
      backdrop: 'static',
      keyboard: false
    });
  }

  onSubmit() {
    // form submit for post and put
    if (this.form.invalid) {
      return;
    }
    const res = !!this.postData ? this.postService.editPost(this.form.value) :
      this.postService.addPost(this.form.value);
    res.subscribe(data => {
      console.log("user", data); //console data after success for check response
      this.closeModal();
      this.toastr.success( !!this.postData ? "User Updated Successfully" : "User Created Successfully");
    },
      error => {
        console.log(error);
      });
  }

  closeModal() {
    // form reset , close modal  on final submit or cancel
    this.modalRef.hide();
    this.form.reset();
    this.close.emit();
  }


}
