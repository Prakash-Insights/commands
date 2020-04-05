import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { FormBuilder, FormGroup, Validators, FormControl } from "@angular/forms";
import { Router } from '@angular/router';
import { DbService } from 'projects/db/src/public-api';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-login',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'login';
  loginForm: FormGroup;
  invalidUser: boolean = false;
  @Output() userVerify = new EventEmitter<boolean>();

  constructor(private formBuilder: FormBuilder,
    private httpClient: HttpClient,
    private dbService: DbService, private router: Router) { }

  ngOnInit() {
    this.loginForm = this.formBuilder.group({
      username: ['', Validators.required],
      password: ['', Validators.required]

    })
  }

  get f() {
    return this.loginForm.controls;
  }
  submit(loginForm: FormGroup) {
    // this.httpClient.get('https://jsonplaceholder.typicode.com/todos/1').subscribe( res => {
    //   console.log(res);
    // });
    console.log(loginForm.value);
    if (loginForm.invalid) {
      return false;
    }
    this.dbService.validUser(loginForm.value).subscribe(x => {
      console.log(x);
      if (x) {
        console.log('www');
        this.invalidUser = false;
        this.loginForm.reset();
        // this.router.navigate(['./list']);
        this.userVerify.emit(true);
      } else {
        this.userVerify.emit(false);
      }
    });
    this.dbService.deleteUser(1).subscribe(data => console.log(data));
    this.dbService.addUser(
      { firstName: 'aaa', lastName: 'Insight', email: 'aaa.insights@gmail.com', password: 'aaa' })
      .subscribe(
        data => console.log(data)
      );
  }
}
