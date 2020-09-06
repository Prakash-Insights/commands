import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PostsComponent } from './posts.component';
import { DetailComponent } from './detail/detail.component';
import {  AuthGuardService as AuthGuard } from '../core/auth/auth-guard.service';


const routes: Routes = [{
  path: '',
  component: PostsComponent
},
{
  path: 'detail',
  component: DetailComponent,
  canActivate: [AuthGuard]
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PostsRoutingModule { }
