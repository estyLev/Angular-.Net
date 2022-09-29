import { error } from '@angular/compiler/src/util';
import { Component, OnInit } from '@angular/core';
import { Category } from 'src/app/Classes/category';
import { CategorysService } from 'src/app/Services/categorys.service';

@Component({
  selector: 'app-add-category',
  templateUrl: './add-category.component.html',
  styleUrls: ['./add-category.component.css']
})
export class AddCategoryComponent implements OnInit {

  constructor(private categoryS:CategorysService) { }
newCat:Category=new Category("",0)
  ngOnInit(): void {
  }
  addCategory(){
//הוספת קטגוריה ע"י שליחת הקטגוריה לסרביס
   this.categoryS.addCategory(this.newCat).subscribe(
   myC=>{alert("הקטגוריה נוספה בהצלחה")},
   error=> {alert(error.massage)}
)
  }
}
