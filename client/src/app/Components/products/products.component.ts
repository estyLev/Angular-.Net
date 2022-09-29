import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Product } from 'src/app/Classes/product';
import { BasketService } from 'src/app/Services/basket.service';
import { Router } from '@angular/router';
import { ProductsService } from 'src/app/Services/products.service';

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css'],
})
export class ProductsComponent implements OnInit {
  categoryCode: number;
  categoryList: Array<Product>;
  flag:boolean=false
  currentProduct:Product

  constructor(
    private prodS: ProductsService,
    private active: ActivatedRoute,
    private myBasket: BasketService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.active.params.subscribe((params) => {
      this.categoryCode = params['category'];
      this.getProductListByCategory();
    });

  }
//מכניסה את המוצרים שעונים על הקטגוריה
  getProductListByCategory() {
    this.prodS.GetProductListByCategory(this.categoryCode).subscribe(
      (myProducts) => {
        this.categoryList = myProducts;
      },
      (error) => {
        alert(error.massage);
      }
    );
  }
 //הוספת המוצר לסל
  addToBasket(product: Product) {
    this.myBasket.addProductToBasket(product);
    this.flag=true
    setTimeout(()=>{this.flag=false}, 1000);
    this.currentProduct=product
  }

  //תצוגה מקדימה של המוצר
  viewProduct(product: Product) {
    this.router.navigate(['/viewCategory/product/', product.productCode]);
  }
}
