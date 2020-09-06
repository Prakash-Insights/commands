import { Component, OnInit } from '@angular/core';
import { PostService } from '../services/post.service';
import { PostModel } from '../models/post.model';
import { UserService } from '../services/user.service';
import { UserModel } from '../models/user.model';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';

@Component({
  selector: 'app-posts',
  templateUrl: './posts.component.html',
  styleUrls: ['./posts.component.less']
})
export class PostsComponent implements OnInit {
  loading: boolean = true;
  posts: PostModel[];
  users: UserModel[];
  selectedPostData = null;
  selectedId: number = null;
  isShowPopUp: boolean = false;
  isShowDeletePopUp: boolean = false;

  constructor(private postsService: PostService, private userService: UserService,
    private toastr: ToastrService, private router: Router) { }

  ngOnInit() {
    //get list of posts and users 
    this.getData();
  }

  getData() {
    Promise.all([
      this.postsService.getPosts().toPromise(),
      this.userService.getUsers().toPromise()
    ]).then(
      ([posts, users]) => {
        this.posts = posts;
        this.users = users;
        this.setUser();
      }).catch(e => console.error(e))
      .finally(() => { this.loading = false });
  }

  setUser() {
    // set user name in posts data to display in grid data
    if (this.posts && this.users) {
      for (const post of this.posts) {
        for (const user of this.users) {
          if (post.userId === user.id) {
            post.name = user.name
          }
        }
      }
    }
  }

  // open popup for Add and Edit Post
  openModal(post?: PostModel) {
    this.selectedPostData = !!post ? post : null;
    this.isShowPopUp = true;
  }

  // Close popup of Add and Edit Post
  closePopup() {
    this.isShowPopUp = false;
    this.selectedPostData = null;
    //  this.getData();  -- here we need to get data again after add and Edit but in our case currently on server no change data
  }

  // on delete click - check for confirmation
  deleteModal(post?: PostModel) {
    this.isShowDeletePopUp = true;
    this.selectedId = post.id;
  }

  // manage delete Confirmation Response
  closeDeletePopup(isDelete: boolean) {
    if (isDelete) {
      this.postsService.deletePost(this.selectedId).subscribe(data => {
        console.log(data);  //console data after success for check response
        this.toastr.success("Post Deleted Successfully");
        //  this.getData();  -- here we need to get data again after Delete but in our case currently on server no change data
      }, error => { console.log(error) }
      )
    }
    this.isShowDeletePopUp = false;
    this.selectedId = null;
  }

  redirectToDetail(id: number, userId: number) {
    //redirect to detail page with query param postId and userId
    this.router.navigate(['/posts/detail'], { queryParams: { postId: id, userId: userId } });
  }

}
