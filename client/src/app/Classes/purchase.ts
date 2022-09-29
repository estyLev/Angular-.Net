//מחלקה עבור כל מוצר שנקנה כדי לשומרו בשרת
export class Purchase {

    constructor(public purchaseCode:number,
                public purchaseDate:Date,
                public sum:number,
                public userCode:number,
        ) {
}
}
