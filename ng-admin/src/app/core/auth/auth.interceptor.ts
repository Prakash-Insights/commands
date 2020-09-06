import { Injectable } from "@angular/core";
import {
    HttpInterceptor,
    HttpRequest,
    HttpHandler,
    HttpEvent,
    HttpResponseBase,
    HttpErrorResponse,
    HTTP_INTERCEPTORS,
    HttpResponse,
} from "@angular/common/http";
import { Router } from "@angular/router";
import { ToastrService } from "ngx-toastr";
import { Observable, NEVER, throwError } from "rxjs";
import { tap } from "rxjs/operators";

@Injectable()
export class AuthInterceptor implements HttpInterceptor {
    constructor(
        private router: Router,
        private toastr: ToastrService
    ) { }

    intercept(
        req: HttpRequest<any>,
        next: HttpHandler
    ): Observable<HttpEvent<any>> {
        req = req.clone({
            // here we set headers which can set  in every api arequest
            setHeaders: {
             'Content-Type': 'application/json; charset=UTF-8',
              // here we have to pass token also in headers but currently not needed
            }
          });

          return next.handle(req).pipe(
              //here we have to manage response of request api 
            tap(
              (ev: HttpEvent<any>) => {
                if (this.checkUnauthorized(ev as HttpResponseBase)) return NEVER;
              },
              (response) => {
                if (this.checkUnauthorized(response)) return NEVER;
                return throwError(response);
              }
            )
          );
    }

    checkUnauthorized(res: HttpResponseBase): boolean {
        if (res instanceof HttpErrorResponse || res instanceof HttpResponse) {
            if (
                res.status === 401 ||
                res.status === 402 ||
                res.statusText === "Unauthorized"
            ) {
                this.router.navigate(["/"]);
                return true;
            }
            if (res.status === 403) {
                this.toastr.error(
                    "Not enough rights for this action"
                );
                return true;
            }
        }
        return false;
    }
}

export const authInterceptorProvider = {
    provide: HTTP_INTERCEPTORS,
    useClass: AuthInterceptor,
    multi: true,
};
