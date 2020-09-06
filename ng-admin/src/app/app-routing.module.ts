import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';


const routes: Routes = [
  {
    path: "",
    loadChildren: () =>
      import("./login/login.module").then((m) => m.LoginModule),
      pathMatch: "full"
  },
{
  path: "",
  loadChildren: () =>
    import("./layout/layout.module").then((m) => m.LayoutModule),
},
{
  path: "**",
  loadChildren: () =>
    import("./login/login.module").then((m) => m.LoginModule),
    pathMatch: "full"
}]

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
