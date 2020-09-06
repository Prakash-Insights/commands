import { Component, OnInit } from '@angular/core';
import { LocalService } from '../../services/local.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.less']
})
export class HeaderComponent implements OnInit {
  menu= [];
  constructor(private localService: LocalService, private router: Router) { }

  ngOnInit() {
    this.menu = [
      { title: 'Dashboard', link: '/dashboard' },
      { title: 'Posts', link: '/posts' },
      { title: 'Users', link: '/users' }
    ];
  }

  logOut() {
    this.localService.clearToken();
    this.router.navigate(["/"]);
  }

}
