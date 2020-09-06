import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LayoutComponent } from './layout.component';
import {  AuthGuardService as AuthGuard } from '../core/auth/auth-guard.service';


const routes: Routes = [ {
  path: '',
  component: LayoutComponent,
  children: [
    {
      path: 'dashboard',
      loadChildren: () => import('../dashboard/dashboard.module').then(m => m.DashboardModule),
      canActivate: [AuthGuard]
    },
    {
      path: 'users',
      loadChildren: () => import('../users/users.module').then(m => m.UsersModule),
      canActivate: [AuthGuard]
    },{
      path: 'posts',
      loadChildren: () => import('../posts/posts.module').then(m => m.PostsModule),
      canActivate: [AuthGuard]
    }]
  }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LayoutRoutingModule { }
