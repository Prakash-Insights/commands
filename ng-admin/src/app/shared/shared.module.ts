import { NgModule, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";
import { ModalModule, BsModalService } from "ngx-bootstrap/modal";
import { FormComponent } from './components/form/form.component';
import { ConfirmationComponent } from './confirmation/confirmation.component';
import { NgxBootstrapIconsModule, allIcons } from 'ngx-bootstrap-icons';
import { HttpClientModule } from '@angular/common/http';

@NgModule({
  declarations: [ConfirmationComponent],
  imports: [
    CommonModule,
    FormsModule,
    HttpClientModule,
    ReactiveFormsModule,
    ModalModule.forRoot(),
    NgxBootstrapIconsModule.pick(allIcons)
  ],
  exports: [
    CommonModule,
    FormsModule,
    HttpClientModule,
    ReactiveFormsModule,
    ModalModule,
    NgxBootstrapIconsModule,
    ConfirmationComponent
  ],
  providers: [BsModalService],
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
})
export class SharedModule { }
