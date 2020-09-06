import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { PostModel } from '../models/post.model';

@Injectable({
  providedIn: 'root'
})
export class PostService {

  private postsUrl: string = 'https://jsonplaceholder.typicode.com/posts';
  constructor(
    private http: HttpClient,
  ) { }

  //get Post by Post id
  getPost(id: number): Observable<PostModel> {
    return this.http.get<PostModel>(`${this.postsUrl}/${id}`)
  }

  //get All Post
  getPosts(): Observable<PostModel[]> {
    return this.http.get<PostModel[]>(`${this.postsUrl}?_sort=views&_order=desc`)
  }

   //Add Post
  addPost(post: PostModel): Observable<PostModel> {
    return this.http.post<PostModel>(this.postsUrl, post);
  }

  // Edit Post
  editPost(post: PostModel): Observable<PostModel> {
    return this.http.put<PostModel>(`${this.postsUrl}/${post.id}`, post);
  }

  // Delete Post
  deletePost(id: number) {
    return this.http.delete(`${this.postsUrl}/${id}`);
  }

}
