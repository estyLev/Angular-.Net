import { Injectable } from '@angular/core';
import {Purchase} from '../Classes/purchase'
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class PurchasesService {

  URL="https://localhost:44377/api/Purchase/";

  constructor(private http:HttpClient) { }

  //קריאות שרת  
  getPurchaseList():Observable<Array<Purchase>>
  {
    return this.http.get<Array<Purchase>>(this.URL+"GetAllPurchases")
  }
  AddPurchase(newP:Purchase):Observable<Array<Purchase>>
  {
      return this.http.post<Array<Purchase>>(this.URL+"AddPurchase",newP);
  }

}
