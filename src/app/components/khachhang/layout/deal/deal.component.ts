import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AnhService } from 'src/app/services/danhmuc/anh.service';
import { optionservice } from 'src/app/services/danhmuc/optionSp.service';
import { SanPhamService } from 'src/app/services/danhmuc/sanpham.service';
import { TudienService } from 'src/app/services/danhmuc/tudien.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-deal',
  templateUrl: './deal.component.html',
  styleUrls: ['./deal.component.css'],
})
export class DealComponent implements OnInit {
  constructor(
    private anh: AnhService,
    private sp: SanPhamService,
    private tudien: TudienService,
    private option: optionservice,
    private router: Router
  ) {}
  dsDienThoai: any;
  url = environment.ApiUrl + 'anh/get/';

  search = {
    sSearch: '',
    pageIndex: 1,
    pageSize: 4,
    OrderByAsc: false,
  };
  ngOnInit(): void {
    this.getSPNhieuView();
  }
  getSPNhieuView() {
    this.option.GetPage(this.search).subscribe((res: any) => {
      this.dsDienThoai = res;
    });
  }
  ViewMore(){
  if (this.search.pageSize > 6) {
    return;
  }
    this.search.pageSize +=2;
    this.getSPNhieuView();
  }
  GoToDetail(item){
    this.router.navigate(['shop/chitiet/'],{queryParams: {id: item.id}});
  }
}
