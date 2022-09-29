import { Injectable } from '@angular/core';
import {Basket} from '../Classes/basket'
import { Product } from '../Classes/product';
import { UsersService } from './users.service';


@Injectable({
  providedIn: 'root'
})
export class BasketService {



  constructor(private userS:UsersService) { }
//רשימת המוצרים בסל
basketList:Array<Basket>=[]
//המוצר החדש שמתווסף
newProduct:Basket;
//המחיר של הסל
endPrice=0

//פונקציה בסיום קניה לאיפוס רשימת המוצרים והמחיר
finishShoping(){
  this.basketList=[];
  this.endPrice=0
}

//קבלת המחיר
getEndPrice(){
  return this.endPrice
}

//קבלת המוצרים בסל
getBasket(){
  return this.basketList;
}

//הוספת מוצר לסל
addProductToBasket(product:Product){
    let flag = 0
    for (let i = 0; i < this.basketList.length; i++) {
            let element = this.basketList[i];
            if(element.productCode==product.productCode){
              element.amount++;
              element.finalPrice=element.amount*element.price
              this.endPrice+=element.price
              flag=1
            }
    }
    if(flag==0){
      this.newProduct=new Basket(product.productCode,this.userS.getCurrentUser().userCode,1,product.cost,product.cost,product.picture);
      this.basketList.push(this.newProduct);
      this.endPrice+=this.newProduct.price
    }
}

//הורדת כמות ממוצר מסוים
decrease(productCode:number){
  for (let i = 0; i < this.basketList.length; i++) {
    let element = this.basketList[i];
    if(element.productCode==productCode){
          if(element.amount==1){
            this.basketList.splice(i,1)
            this.endPrice-=element.price
          }
          else{
          element.amount--;
          element.finalPrice=element.amount*element.price
          this.endPrice-=element.price
          }

    }
}
}
//הוספת כמות ממוצר מסוים
increase(productCode:number){
  for (let i = 0; i < this.basketList.length; i++) {
    let element = this.basketList[i];
    if(element.productCode==productCode){
      element.amount++;
      element.finalPrice=element.amount*element.price
      this.endPrice+=element.price
   }
}
}

}
