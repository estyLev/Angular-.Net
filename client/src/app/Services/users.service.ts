import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import {User } from '../Classes/user'


@Injectable({
  providedIn: 'root'
})
export class UsersService {

  constructor(private http:HttpClient) { }

  //המשתמש הנוכחי
  currentUser: User = new User(0, 0, '', '', '');
  URL="https://localhost:44377/api/user/";

  //פרטי המנהל
 manager = { managerCode: 1111, managerName: 'aaaa' };

 //קריאות שרת  
  getAllUsers():Observable<Array<User>>{
      return this.http.get<Array<User>>(this.URL+"getallusers")
  }
  AddUser(user:User):Observable<Array<User>>{
    return this.http.post<Array<User>>(this.URL+"AddUser",user)
  }

  //החזרת המשתנה הנוכחי
 getCurrentUser() {
    return this.currentUser;
  }

    //עריכת המשתנה הנוכחי
  setCurrentUser(user: User) {
    this.currentUser = user;
  }

  //קבלת פרטי המנהל
  getManager() {
    return this.manager;
  }

}
