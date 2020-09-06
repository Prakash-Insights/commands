import { Component, OnInit } from '@angular/core';
import { Validators, FormBuilder } from '@angular/forms';
import { FormComponent } from '../shared/components/form/form.component';
import { AuthenticationService } from '../core/auth/authentication.service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.less']
})
export class LoginComponent extends FormComponent implements OnInit {
  loading: boolean = true;
  constructor(
    private formBuilder: FormBuilder,
    private authenticationService: AuthenticationService,
    private router: Router,
    private toastr: ToastrService
  ) {
    super();
  }

  ngOnInit() {
    this.form = this.formBuilder.group({
      username: ['', Validators.required],
      password: ['', Validators.required]
    });
    this.loading = false;
  }

  onSubmit() {
    this.router.navigate(['./dashboard']);
    // stop here if form is invalid
    if (this.form.invalid) {
      //if username and password is not enter then return
      return;
    }
    const res = this.authenticationService.login(this.form.value);
    if (res) {
       // on success redirect on dashboard
      this.router.navigate(['./dashboard']);
    } else {
      // if username or password invalid then show toastr message
      this.toastr.error("Invalid username or password");
    }
  }

}
