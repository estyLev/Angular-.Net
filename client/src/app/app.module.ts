import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { AppComponent } from './app.component';
import { myRoutingModule } from './myRouting.routing'
import { RouterModule } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';


import {AboutComponent} from './Components/about/about.component'
import {AddCategoryComponent} from './Components/add-category/add-category.component'
import {AddProductComponent} from './Components/add-product/add-product.component'
import {BasketComponent} from './Components/basket/basket.component'
import {FinishPurchaseComponent} from './Components/finish-purchase/finish-purchase.component'
import {HonePageComponent} from './Components/hone-page/hone-page.component'
import {LoginComponent} from './Components/login/login.component'
import {ManagerPageComponent} from './Components/manager-page/manager-page.component'
import {ProductComponent} from './Components/Product/product.component'
import {ProductsComponent} from './Components/products/products.component'
import {RegisterComponent} from './Components/register/register.component'
import {UpdateCategoryComponent} from './Components/update-category/update-category.component'
import {UpdateProductComponent} from './Components/update-product/update-product.component'
import {ViewProductsComponent} from './Components/view-products/view-products.component'
import { AdvertisementComponent } from './Components/advertisement/advertisement.component';
import { EditComponent } from './Components/edit/edit.component';
import { ViewCategoryComponent } from './Components/view-category/view-category.component';
import { NotFoundComponent } from './Components/not-found/not-found.component';
@NgModule({
  declarations: [
    AppComponent,
    AboutComponent,
    AddCategoryComponent,
    AddProductComponent,
    FinishPurchaseComponent,
    HonePageComponent,
    BasketComponent,
    LoginComponent,
    ManagerPageComponent,
    ProductComponent,
    ProductsComponent,
    RegisterComponent,
    UpdateCategoryComponent,
    UpdateProductComponent,
    ViewProductsComponent,
    AdvertisementComponent,
    EditComponent,
    ViewCategoryComponent,
    NotFoundComponent,

  ],
  imports: [
    BrowserModule,RouterModule, myRoutingModule,HttpClientModule,FormsModule,
 ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
