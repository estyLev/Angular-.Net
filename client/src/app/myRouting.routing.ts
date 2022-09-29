import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { AppComponent } from './app.component';
import { CommonModule } from '@angular/common';

import { AboutComponent } from './Components/about/about.component';
import { AddCategoryComponent } from './Components/add-category/add-category.component';
import { AddProductComponent } from './Components/add-product/add-product.component';
import { BasketComponent } from './Components/basket/basket.component';
import { FinishPurchaseComponent } from './Components/finish-purchase/finish-purchase.component';
import { HonePageComponent } from './Components/hone-page/hone-page.component';
import { LoginComponent } from './Components/login/login.component';
import { ManagerPageComponent } from './Components/manager-page/manager-page.component';
import { ProductComponent } from './Components/Product/product.component';
import {NotFoundComponent} from './Components/not-found/not-found.component'
import { ProductsComponent } from './Components/products/products.component';
import { RegisterComponent } from './Components/register/register.component';
import { UpdateCategoryComponent } from './Components/update-category/update-category.component';
import { UpdateProductComponent } from './Components/update-product/update-product.component';
import { ViewProductsComponent } from './Components/view-products/view-products.component';
import { AdvertisementComponent } from './Components/advertisement/advertisement.component';
import { ViewCategoryComponent } from './Components/view-category/view-category.component';
import { EditComponent } from './Components/edit/edit.component';

const appRoutes: Routes = [
  {
    path: '',
    component: HonePageComponent,

    children: [
      { path: 'Home', component: AdvertisementComponent },
      { path: '', redirectTo: 'Home',pathMatch:"full" },
      { path: 'about', component: AboutComponent },
      { path: 'login', component: LoginComponent },
      {
        path: 'viewCategory',
        component: ViewCategoryComponent,
        children: [
          { path: 'products/:category', component: ProductsComponent },
          { path: 'product/:product', component: ProductComponent },
          { path: 'basket/:category', component: BasketComponent },
        ],
      },
      { path: 'finishPurchase', component: FinishPurchaseComponent },
      { path: 'register', component: RegisterComponent },
      { path: 'viewProducts', component: ViewProductsComponent },
    ],
  },
  {
    path: 'manager',
    component: ManagerPageComponent,
    children: [
      {
        path: 'edit',
        component: EditComponent,
        children: [
          { path: 'updateCategory', component: UpdateCategoryComponent },
          { path: 'addCategory', component: AddCategoryComponent },
          { path: 'updateProduct', component: UpdateProductComponent },
          { path: 'addProduct', component: AddProductComponent },
        ],
      },
      { path: 'viewProducts', component: ViewProductsComponent },
    ],
  },
  {path:"not-found", component:NotFoundComponent},
  {path:"**", redirectTo:"/not-found"}
];

@NgModule({
  imports: [RouterModule.forRoot(appRoutes), CommonModule],
  declarations: [],
})
export class myRoutingModule {}
