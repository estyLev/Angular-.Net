import { Injectable } from '@angular/core';
import {PurchaseDitails} from '../Classes/purchase-details'
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class PurchasesDitailsService {

  URL="https://localhost:44377/api/PurchaseDitail/";

  constructor(private http:HttpClient) { }

  //קריאות שרת  
  getPurchaseDetailsList():Observable<Array<PurchaseDitails>>
  {
    return this.http.get<Array<PurchaseDitails>>(this.URL+"GetAllPurchaseDitails")
  }
  AddPurchaseDitail(newD:PurchaseDitails):Observable<Array<PurchaseDitails>>
  {
    return this.http.post<Array<PurchaseDitails>>(this.URL+"AddPurchaseDitail",newD)
  }

}
