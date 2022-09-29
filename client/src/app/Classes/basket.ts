//מחלקה עבור כל מוצר שנכנס לסל הקניות
export class Basket {

  constructor(public productCode:number,
              public userCode:number,
              public amount:number,
              public price:number,
              public finalPrice:number,
              public picture:string) {

  }
}
