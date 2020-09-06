import { Injectable } from '@angular/core';
import { Login } from '../../models/login.model';
import { deepEqual } from 'assert';
import { LocalService } from '../../services/local.service';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {
  token = "admintoken123"
  adminUser: Login = {
    username: "admin@login.com",
    password: "admin@123"
  }
  constructor(private localService: LocalService) { }

  login(loginUser: Login) {
    const isAdminUser = loginUser.username.trimLeft().trimRight() === this.adminUser.username && loginUser.password === this.adminUser.password;
    if (isAdminUser) {
      this.localService.setJsonValue('token', this.token); //if login as admin then set token 
      return true;
    }
    return false;

  }


}
