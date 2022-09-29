import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-hone-page',
  templateUrl: './hone-page.component.html',
  styleUrls: ['./hone-page.component.css'],
})
export class HonePageComponent implements OnInit {

  constructor(
private router:Router
  ) {}

  ngOnInit(): void {
  }
  adv(){
  this.router.navigate(["/Home"])
  }
}
