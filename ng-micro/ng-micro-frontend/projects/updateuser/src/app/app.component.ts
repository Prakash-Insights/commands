import { Component } from '@angular/core';
import { DbService } from 'db';

@Component({
  selector: 'up-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'updateuser';

  constructor(private dbService: DbService) {
    this.dbService.getAllUsers().subscribe(all => {
      console.log(all);
    });
  }
}
