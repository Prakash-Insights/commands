import { Component, OnInit } from '@angular/core';
import { FormGroup, AbstractControl, FormArray } from '@angular/forms';
import { HttpErrorResponse } from '@angular/common/http';


export class FormComponent {
  form: FormGroup;

  // get form Control by control name
  control(controlName: string): AbstractControl {
    return this.form.get(controlName);
  }

  //get form control value by control name
  value(controlName: string) {
    return this.control(controlName).value;
  }

  // check form control is touched and invalid - return true or false
  showError(controlName: string): boolean {
    return this.control(controlName).touched && this.control(controlName).invalid;
  }

   // check form control value -- basically use for show common pattern for  validation message
  fieldError(controlName: string): string {
    return this.value(controlName) ? 'Invalid' : 'Required';
  }
}
