import { CommentModel } from './comment.model';
import { UserModel } from './user.model';

export interface PostModel {
    userId: number;
    id: number;
    name?: string;
    title: string;
    body: string;
    user?: UserModel;
    comments?: CommentModel[];
  }