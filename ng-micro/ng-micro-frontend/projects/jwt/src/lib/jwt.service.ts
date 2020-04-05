import { Injectable } from '@angular/core';
import { HttpInterceptor, HttpRequest, HttpHandler, HttpEvent } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class JwtService implements HttpInterceptor {

  constructor(private _router: Router) { }

  intercept(
    request: HttpRequest<any>,
    next: HttpHandler
  ): Observable<HttpEvent<any>> {
    console.log('lib-jwt-request.url=' + request.url);
    const storageUser = sessionStorage.getItem('token');
    const loggedUser = { token: 'yes' }; // jsonInfo ? JSON.parse(jsonInfo) : null;
    if (storageUser) {
      request = request.clone({
        headers: request.headers.set('Authorization', `Bearer ${loggedUser.token}`)
      });
    }
    return next.handle(request);
    // return next.handle(request).pipe(
    //   catchError(error => {        // Checking if it is an Authentication Error (401)
    //     if (error.status === 401) {
    //       alert('Access Denied');
    //       // <Log the user out of your application code>
    //       this._router.navigate(['login-page-route']);
    //       return throwError(error);
    //     }        // If it is not an authentication error, just throw it
    //     return throwError(error);
    //   })
    // );
  }
}
