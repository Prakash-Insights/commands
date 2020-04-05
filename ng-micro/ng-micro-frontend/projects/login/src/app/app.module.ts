import { HttpClientModule } from '@angular/common/http';
import { NgModule, Injector } from '@angular/core';
import { createCustomElement } from '@angular/elements';
import { ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { DbService } from 'db';
import { JwtModule, JwtService } from 'jwt';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    ReactiveFormsModule,
    HttpClientModule,
    AppRoutingModule,
    JwtModule
  ],
  providers: [DbService, JwtService],
  bootstrap: [],
  entryComponents: [AppComponent]
})
export class AppModule {
  constructor(private injector: Injector) { }
  ngDoBootstrap() {
    // const customButton = createCustomElement(AppComponent, { injector: this.injector });
    // customElements.define('login', customButton);
    const el = createCustomElement(AppComponent, { injector: this.injector });
    if (!customElements.get('app-login')) {
      customElements.define('app-login', el);
    }
  }
}
