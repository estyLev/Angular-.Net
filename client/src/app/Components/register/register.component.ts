import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/Classes/user';
import { UsersService } from 'src/app/Services/users.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  constructor(private userS:UsersService) { }
  newUser:User= new User(0,0,"","","")
  ngOnInit(): void {
  }
  
  //החזרת המשתמש לדף הבית
  back(){
    window.history.back()
  }

//הוספת משתמש חדש
  addUesr(){
    this.newUser.userCode=Number(this.newUser.userCode)
    this.userS.AddUser(this.newUser).subscribe(
      data=>{alert("נוספת בהצלחה לרשימת הלקוחות שלנו")},
      error=>{alert(error.massage)}
    )
    this.back();
  }

}
