# **Admin App **

> ### Admin Side Social Media App is basically use for manage multiple posts for user with admin login. Admin Login with credentials and Create , Edit or Delete post for any Users.

## **How it works**

We are Currently peroform CRUD for Posts , manage User List and Comments so for that we have a live API server running at https://jsonplaceholder.typicode.com/ for the application to make requests against and here we get the infourmattion about routes and http methods.

 ### We are using Common Resources of JsonPlaceholders like : 
- for Posts : https://jsonplaceholder.typicode.com/posts
- for Users : https://jsonplaceholder.typicode.com/users
- for Comments: https://jsonplaceholder.typicode.com/comments


## **Installation**
> Clone

Clone your repository from `https://github.com/UP-Insights/Admin-App` 

> Setup

Perform `npm install` then Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## **Functionality overview with page breakdown**

1. Admin Login (URL: /#/ )
- Use Credentials : **UserName : admin@login.com , Password: admin@123**
- store token with encryption
- Authenticate user in each route with AuthGuard
2. Three Tabs
- Dashboard , Users aand Posts with Lazy Loading
3. Dashboard (URL: /#/dashboard )
-Show Users and Posts Count and redirect on Click
4. Posts (URL: /#/posts )
- List Posts , Add Post , Edit Post, Delete Post, Detail  of Post with user Detail and Comments
5. Users: (URL: /#/users )
- List of Users
6. Logout 
-  redirect to login and Clear Storage

## Support From

- (https://valor-software.com/ngx-bootstrap/)
- (https://www.npmjs.com/package/ngx-bootstrap-icons)
- (https://medium.com/@rupesh94/how-to-encrypt-localstorage-data-in-angular-270ebcbc1435)
- (https://angular.io/docs)
- (https://jsonplaceholder.typicode.com/)

