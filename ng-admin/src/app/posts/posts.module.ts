import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PostsRoutingModule } from './posts-routing.module';
import { PostsComponent } from './posts.component';
import { SharedModule } from '../shared/shared.module';
import { AddEditModalComponent } from './add-edit-modal/add-edit-modal.component';
import { DetailComponent } from './detail/detail.component';


@NgModule({
  declarations: [PostsComponent, AddEditModalComponent, DetailComponent],
  imports: [
    CommonModule,
    PostsRoutingModule,
    SharedModule
  ],
})
export class PostsModule { }
