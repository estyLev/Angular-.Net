import { Component, OnInit } from '@angular/core';
import {ProductsComponent} from '../products/products.component'
import {UsersService} from '../../Services/users.service'
import { User } from '../../Classes/user';
import { myRoutingModule } from '../../myRouting.routing'
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor(private router:Router,private userS:UsersService) { }

  usersList:Array<User>
  currentUser:User
  manager:{managerCode:number,managerName:string};

  ngOnInit(): void {
    //קריאת שרת לרשימת הלקוחות
    this.userS.getAllUsers().subscribe(
      (myUsers) => {
        this.usersList=myUsers;
      },
      (error) => {
        alert(error.massage);
      }
    );

    this.currentUser=this.userS.getCurrentUser();
    this.manager=this.userS.getManager()


  }

  //פונקציה שבודקת האם המשתמש קיים כבר במערכת
  checkUesr(){
    this.usersList.forEach(element => {
      //אם הוא מנהל ,ישלח לתחום המנהל
      if(this.currentUser.userCode==this.manager.managerCode && this.currentUser.userName==this.manager.managerName)
      {
        this.currentUser.userId=11111111;
        this.router.navigate(["/manager"]);

      }

      //'אם הוא רשום ישלח ל'חנות
      else if(element.userCode==this.currentUser.userCode && element.userName==this.currentUser.userName)
      {
        this.router.navigate(["/viewCategory"]);
        this.userS.setCurrentUser(element);
        this.currentUser=element
      }

  });
//אם אינו רשום ישלח לטופס הרשמה
  if(this.currentUser.userId==0)
  {alert("אינך רשום במערכת עליך קודם להירשם")
        this.router.navigate(["/register"]);}

  }

}
