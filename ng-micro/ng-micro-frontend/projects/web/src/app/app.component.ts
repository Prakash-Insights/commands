import { Component } from '@angular/core';

@Component({
  selector: 'web-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'web';

  userVerify(userValid = false): boolean {
    console.log(userValid);
    return userValid;
  }
}
