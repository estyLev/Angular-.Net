//מחלקה עבור כל מוצר
export class Product {

    constructor(public productCode:number,
                public productName:string,
                public description:string,
                public categoryCode:number,
                public cost:number,
                public picture:string) {
     }
}
