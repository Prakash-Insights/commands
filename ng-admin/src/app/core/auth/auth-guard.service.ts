import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Login } from '../../models/login.model';
import { LocalService } from '../../services/local.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuardService {

  constructor(private router: Router, private localService: LocalService) { 
  }

  canActivate(): boolean {
    //check user can logged in then redirect to route else return to login
    const token =  this.localService.getJsonValue('token');;
    if (token == null || token === "") {
      sessionStorage.clear();
      this.router.navigate(["/"]);
      return false;
    }
    return true;
  }
}
