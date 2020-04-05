import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { of, Observable } from 'rxjs';
import { DummyUsers } from './dummy-users';

@Injectable({
  providedIn: 'root'
})
export class DbService {
  users: DummyUsers;
  fkUsers: any[];
  editUserData: any;
  constructor(private http: HttpClient) {
    this.users = new DummyUsers;
    this.fkUsers = this.users.fakeUsers;
  }
  getAllUsers(): Observable<any> {
    return of(this.fkUsers);
  }
  deleteUser(id: number): Observable<any> {
    this.fkUsers = this.fkUsers.filter(u => u['id'] !== id);
    return of(this.fkUsers);
  }
  addUser(data: any): Observable<any> {
    let count = 0;
    this.fkUsers.map(() => count++);
    data.id = count + 1;
    console.log(data);
    this.fkUsers.push(data);
    return of(true);
  }
  validUser(loginData: any): Observable<any> {
    const check = this.users.fakeUsers.find(x => {
      // console.log(x);
      return x.email === loginData.username && x.password === loginData.password
    });
    sessionStorage.setItem('token', check ? 'true' : 'false');
    return of(check);
  }
}
