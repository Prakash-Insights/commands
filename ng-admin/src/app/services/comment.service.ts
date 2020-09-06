import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CommentModel } from '../models/comment.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CommentService {
  private postUrl: string = 'https://jsonplaceholder.typicode.com/posts'
  constructor(
    private http: HttpClient
  ) { }

  //get comments by Post Id
  getCommentsfromPostId(postId: number): Observable<CommentModel[]>{
    return this.http.get<CommentModel[]>(`${this.postUrl}/${postId}/comments`)
  }
}
