
import { ActivatedRoute, Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { Basket } from 'src/app/Classes/basket';
import { Product } from 'src/app/Classes/product';
import { BasketService } from 'src/app/Services/basket.service';
import { ProductsService } from 'src/app/Services/products.service';

@Component({
  selector: 'app-basket',
  templateUrl: './basket.component.html',
  styleUrls: ['./basket.component.css']
})
export class BasketComponent implements OnInit {

  myBasket:Array<Basket>
  productsList:Array<Product>
  finalPrice:number
  categoryCode:number

  constructor(private basketS:BasketService
             ,private prodS:ProductsService
             ,private router:Router
             ,private active:ActivatedRoute) { }

  ngOnInit(): void {
//הצגת המוצרים ע"פ הקטגוריה שנשלחה
    this.active.params.subscribe((params) => {
      this.categoryCode = params['category'];
    });
//רשימת המוצרים בסל הקניות
    this.myBasket=this.basketS.getBasket();
//קבלת המוצרים ע"פ קטגוריה
    this.prodS.GetProductListByCategory(this.categoryCode).subscribe(
      (myProducts) => {
        this.productsList=myProducts;
      },
      (error) => {
        alert(error.massage);
      }
    );
    //המחיר עבור כל הקניה
    this.finalPrice=this.basketS.getEndPrice()
  }

  //פונקציה שמורידה אחד מהכמות שנבחרה למוצר זה
  decrease(productCode:number){
    this.basketS.decrease(productCode);
    this.myBasket=this.basketS.getBasket();
    this.finalPrice=this.basketS.getEndPrice()
  }

//פונקציה שמוסיפה אחד מהכמות שנבחרה למוצר זה
  increase(productCode:number){
    this.basketS.increase(productCode);
    this.myBasket=this.basketS.getBasket();
    this.finalPrice=this.basketS.getEndPrice()
  }

  //פונקציה שמוסיפה את המוצר לסל הקניות
  addToBasket(product: Product) {
    this.basketS.addProductToBasket(product);
    this.finalPrice=this.basketS.getEndPrice()
  }

  //מראה את התמונה בגדול
  viewProduct(product: Product) {
    this.router.navigate(['/viewCategory/product/', product.productCode]);
  }
  
  //סגירת סל הקניות
  back(){
    window.history.back();
  }
}
