import { Injectable } from '@angular/core';
import {Product} from '../Classes/product';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ProductsService {


  URL="https://localhost:44377/api/product/";

  constructor(private http:HttpClient) { }

  //קריאות שרת  
  getProductsList():Observable<Array<Product>>
  {
    return this.http.get<Array<Product>>(this.URL+"GetAllProducts")
  }

  GetProductListByCategory(catId:number):Observable<Array<Product>>
  {
    return this.http.get<Array<Product>>(this.URL+"GetProductListByCategory/"+catId)
  }

  GetProductById(prodId:number):Observable<Product>
  {
    return this.http.get<Product>(this.URL+"GetProductByCode/"+prodId)
  }

  AddProduct(newP:Product):Observable<Array<Product>>
  {
    return this.http.post<Array<Product>>(this.URL+"AddProduct",newP);
  }
}
