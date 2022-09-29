import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Product } from '../../Classes/product';
import { Category } from '../../Classes/category';
import { CategorysService } from 'src/app/Services/categorys.service';

@Component({
  selector: 'app-view-category',
  templateUrl: './view-category.component.html',
  styleUrls: ['./view-category.component.css'],
})
export class ViewCategoryComponent implements OnInit {
  constructor(private categoryS:CategorysService ,private router:Router) { }

  categorysList:Array<Category>
  ngOnInit(): void {
//קבלת הקטגוריות
    this.categoryS.getCategorysList().subscribe(
      (myCategorys) => {
        this.categorysList=myCategorys;
      },
      (error) => {
        alert(error.massage);
      }
    );
}
//שינוי הראוטינג ע"פ הקטגוריה
  route(cat:number){
 this.router.navigate(["/viewCategory/products/",cat])
  }
}
