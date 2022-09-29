import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Product } from 'src/app/Classes/product';
import { ProductsService } from 'src/app/Services/products.service';

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.css']
})
export class ProductComponent implements OnInit {

  constructor(private active:ActivatedRoute,private prodS:ProductsService) { }

  productCode:number
  currentProduct:Product

  //קבלת המוצר לתצוגה מקדימה ע"פ הקוד שנשלח דרך הראוטינג
  ngOnInit(): void {
    this.active.params.subscribe(params=>{
      this.productCode=params["product"]
  })

  this.prodS.GetProductById(this.productCode).subscribe(
    (myProducts) => {
      this.currentProduct=myProducts;
    },
    (error) => {
      alert(error.massage);
    }
  );

  }
  back(){
    window.history.back();
  }
}
