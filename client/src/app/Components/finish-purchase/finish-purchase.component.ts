import { Component, OnInit } from '@angular/core';
import { BasketService } from 'src/app/Services/basket.service';
import {Purchase} from '../../Classes/purchase';
import {PurchaseDitails} from '../../Classes/purchase-details';
import {Basket} from '../../Classes/basket';
import { UsersService } from 'src/app/Services/users.service';
import { PurchasesService } from 'src/app/Services/purchases.service';
import { PurchasesDitailsService } from 'src/app/Services/purchases-ditails.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-finish-purchase',
  templateUrl: './finish-purchase.component.html',
  styleUrls: ['./finish-purchase.component.css']
})
export class FinishPurchaseComponent implements OnInit {

  constructor(private basketS:BasketService,private userS:UsersService,
    private purchaseS:PurchasesService,
    private detailS:PurchasesDitailsService,
    private router:Router) { }
  amount:number
  purchase:Purchase
  basketList:Array<Basket>=[]
  purchaseDitail:PurchaseDitails;

  ngOnInit(): void {
    this.basketList=this.basketS.getBasket();
      this.amount=this.basketS.getEndPrice();
  }

  //חזרה לסל הקניות
  back(){
    window.history.back()
  }

  //פונקציה שמבצעת את התשלום
  payment(){
    // this.userS.getCurrentUser().userCode
    this.purchase=new Purchase(this.basketS.getEndPrice(),new Date(),
    this.basketS.getEndPrice(),this.userS.getCurrentUser().userCode)
    this.purchaseS.AddPurchase(this.purchase).subscribe(
      newP=>{alert("התשלום עבר בהצלחה")},
      error=> {alert(error.massage)}
    )
    this.basketList.forEach(element=>{
      this.purchaseDitail=new PurchaseDitails(0,this.userS.getCurrentUser().userCode,
      element.productCode,element.amount)
      this.detailS.AddPurchaseDitail(this.purchaseDitail).subscribe(
        newP=> {},
        error=> {alert(error.massage)}
      )
    })
    this.router.navigate(["/Home"]);
    this.basketS.finishShoping();
  }
}
