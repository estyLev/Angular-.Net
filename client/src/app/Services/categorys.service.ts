import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import {Category} from '../Classes/category'
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CategorysService {

  URL="https://localhost:44377/api/category/";

  constructor(private http:HttpClient) { }
 
//קריאות שרת  
getCategorysList():Observable<Array<Category>>
{
  return this.http.get<Array<Category>>(this.URL+"getallcategorys")
}
updateCategory(code:number,newCat:Category):Observable<Array<Category>>{
  return this.http.put<Array<Category>>(this.URL+"UpdateCategory/"+code,newCat)
}
addCategory(newCat:Category):Observable<Array<Category>>{
  return this.http.post<Array<Category>>(this.URL+"AddCategory",newCat)
}
}
