import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Product } from 'src/app/Classes/product';
import { ProductsService } from 'src/app/Services/products.service';

@Component({
  selector: 'app-add-product',
  templateUrl: './add-product.component.html',
  styleUrls: ['./add-product.component.css']
})
export class AddProductComponent implements OnInit {

  constructor(private productS:ProductsService, private route:Router) { }

  newP:Product=new Product(0,"","",0,0,"");
  ngOnInit(): void {
  }
  addProduct(){
//הוספת מוצר ע"י שליחת המוצר לסרביס
   this.productS.AddProduct(this.newP).subscribe(
   myC=>{alert("המוצר נוסף בהצלחה")},
   error=> {alert(error.massage)}
)
 this.route.navigate(['manager/']);
  }

}
