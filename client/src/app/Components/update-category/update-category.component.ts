import { Component, OnInit } from '@angular/core';
import { Category } from 'src/app/Classes/category';
import { CategorysService } from 'src/app/Services/categorys.service';

@Component({
  selector: 'app-update-category',
  templateUrl: './update-category.component.html',
  styleUrls: ['./update-category.component.css']
})
export class UpdateCategoryComponent implements OnInit {

  constructor(private categoryS:CategorysService) { }
  Categorys:Array<Category>
  flag:boolean=false
  current:Category

  ngOnInit(): void {
//הטענת רשימת הקטגוריות
    this.categoryS.getCategorysList().subscribe(
      (myCategorys) => {
        this.Categorys=myCategorys;
      },
      (error) => {
        alert(error.massage);
      }
    );

  }

  //בלחיצה על כפתור מסוים שיראה את טיבות הטקסט
  changeFlag(c){
    this.flag=true
    this.current=c;
  }

//עדכון הקטגוריה
  updateCategory(name:string){
    let newCat=new Category(name,this.current.categoryCode)

    this.categoryS.updateCategory(this.current.categoryCode,newCat).subscribe(
      myCategorys=>{
                    this.Categorys=myCategorys;
                    this.flag=false
                   },
      error => {alert("error.massage");}
    )


  }
}
