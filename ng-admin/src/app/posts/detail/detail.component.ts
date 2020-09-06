import { Component, OnInit, OnDestroy } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PostService } from '../../services/post.service';
import { UserService } from '../../services/user.service';
import { CommentService } from '../../services/comment.service';
import { PostModel } from '../../models/post.model';
import { Subscription } from 'rxjs';

@Component({
  selector: 'post-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.less']
})
export class DetailComponent implements OnInit, OnDestroy {
  postId: number;
  userId: number;
  post: PostModel;
  sub: Subscription;
  loading: boolean = true;
  constructor(private activatedRoute: ActivatedRoute, private postsService: PostService, 
    private userService: UserService, private commentsService: CommentService) {
    this.sub = this.activatedRoute.queryParams.subscribe(params => {
       this.postId = params['postId'];
       this.userId = params['userId'];
    });
   }

  ngOnInit() {
    Promise.all([
      this.postsService.getPost(this.postId).toPromise(),
      this.userService.getUser(this.userId).toPromise(),
      this.commentsService.getCommentsfromPostId(this.postId).toPromise()
    ]).then(
      ([post, user,comments]) => {
        this.post = post;
        this.post.user = user;
        this.post.comments = comments;
        console.log(post);
      }).catch(e => console.error(e)).finally(() => this.loading = false);
  }

  ngOnDestroy() {
    // unsubscribe subcription to avoid memory leaks
    this.sub.unsubscribe();
  }
}
