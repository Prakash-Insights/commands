import { Component, OnInit } from '@angular/core';
import { PostService } from '../services/post.service';
import { UserService } from '../services/user.service';
import { PostsModule } from '../posts/posts.module';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.less']
})
export class DashboardComponent implements OnInit {
  postsCount: Number;
  usersCount: Number;
  loading:boolean = true;
  constructor(private postsService: PostService, private userService: UserService) { }

  ngOnInit() {
    Promise.all([
      this.postsService.getPosts().toPromise(),
      this.userService.getUsers().toPromise()
    ]).then(
      ([posts, users]) => {
        this.postsCount = posts.length || 0;
        this.usersCount = users.length || 0;
      }).catch(e => console.error(e))
      .finally(() => { this.loading = false });
  }

}
