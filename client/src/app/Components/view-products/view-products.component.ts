import { Component, OnInit } from '@angular/core';
import { Product } from 'src/app/Classes/product';
import { ProductsService } from 'src/app/Services/products.service';

@Component({
  selector: 'app-view-products',
  templateUrl: './view-products.component.html',
  styleUrls: ['./view-products.component.css']
})
export class ViewProductsComponent implements OnInit {

  constructor(private prodS:ProductsService) { }
  products:Array<Product>
  ngOnInit(): void {
//קבלת הקטגוריות
    this.prodS.getProductsList().subscribe(
      (myProducts) => {
        this.products=myProducts;
      },
      (error) => {
        alert(error.massage);
      }
    );


  }
}
