import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { AuthenticationService } from 'src/app/services/authService/authentication.service';
import { TrangThaiGiaoDich } from 'src/app/services/constrans';
import { CartService } from 'src/app/services/danhmuc/cart.service';
import { EmailService } from 'src/app/services/danhmuc/email.service';
import { optionservice } from 'src/app/services/danhmuc/optionSp.service';
import { UserService } from 'src/app/services/user/user.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-chitiet-donhang',
  templateUrl: './chitiet-donhang.component.html',
  styleUrls: ['./chitiet-donhang.component.css'],
})
export class ChitietDonhangComponent implements OnInit {
  constructor(
    private cart: CartService,
    private router: ActivatedRoute,
    private user: UserService,
    private toarst: ToastrService,
    private auth: AuthenticationService,
    private option:optionservice,
    private email:EmailService
  ) {}
  dataCartDetail: [];
  truSoLuong = [];
  dataUser: any = {
    hoTen: '',
    gioThieu: '',
    soDienThoai: '',
    gioiTinh: '',
    email: '',
  };
  dataCart: any = {
    diaChi: '',
    sdt: '',
    tinNhan: '',
    tongTien: 0,
    trangThai: {
      maTuDien:''
    }
  };
  ngOnInit(): void {
    this.router.queryParams.subscribe((res) => {
      this.getDonHangDetail(res.id);
      this.getCart(res.id);
    });
  }
  Print() {
    const printContent = document.getElementById('print');
    const WindowPrt = window.open('', '');
    WindowPrt.document.write(printContent.innerHTML);
    WindowPrt.document.close();
    WindowPrt.focus();
    WindowPrt.print();
    WindowPrt.close();
  }

  url = environment.ApiUrl + 'anh/get/';
  getDonHangDetail(id) {
    this.cart.ShowShoppingCartById(id).subscribe((res: any) => {
      this.dataCartDetail = res;
      this.truSoLuong = [];
      this.dataCartDetail.forEach((element:any) => {
        this.dataSentEmail.NoiDung += "Tên sản phẩm : " + element.tenSp + " - " + element.cauHinh + " Giá : " + element.gia + " số lượng : " + element.soLuong + " <br />";
        this.truSoLuong.push({Id: element.idOption, SoLuong:element.soLuong});
      });
      this.dataSentEmail.NoiDung += "Tổng tiền " + this.dataCart.tongTien + " đồng <br/>";
      this.dataSentEmail.NoiDung += "Chúng tôi sẽ liên hệ với bạn mong bạn để ý điện thoại! Cảm ơn bạn đã tin tưởng.";

    });
  }
  tenNV = JSON.parse(localStorage.getItem('user'))[0].hoTen;
  dataIn = {
    DiaChi: '',
    TongTien: 0,
    Sdt: '',
    Email: '',
    HoTen: '',
    DSSanPham: [],
  };


  getCart(id) {
    this.cart.GetCartId(id).subscribe((res: any) => {
      this.dataCart = res;
      console.log(res);

      this.getUser(res.userId);
    });
  }
  getUser(id) {
    this.user.getProfileById(id).subscribe((res) => {
      this.dataUser = res;
    });
  }

  GiaoHang() {
    let user = this.auth.getUserLocal();

    var data = {
      Id: this.dataCart.id,
      NhanVienId: user.id,
    };
    this.cart.DatHang(data).subscribe((res) => {
      this.TruOptionSanPham();
      this.getCart(data.Id);
      this.sentEmail();
      this.toarst.success('Thao tác thành công', 'Thông báo!');
    });
  }
  dataSentEmail = {
    Email : '',
    TieuDe: "Đơn hàng của bạn đã được xác nhận.",
    NoiDung: "Bao gồm sản phẩm: <br/> "
  }
  sentEmail(){
    this.dataSentEmail.Email = this.dataUser.email;
    this.email.SentEmail(this.dataSentEmail).then((res)=>{
      this.toarst.success("Gửi email thành công!","Thông báo!");
    }).catch((err)=>console.log(err));

  }
  TruOptionSanPham(){
    this.option.TruSoLuong(this.truSoLuong).subscribe((res)=>{
    })
  }
  // Cộng khi đơn hàng đã xác nhận thành công
  CongSoLuong(){
    this.option.CongSoLuong(this.truSoLuong).subscribe((res)=>{
    })
  }
  HuyDon(isDaXacNhan){
    let user = this.auth.getUserLocal();
    var data = {
      Id: this.dataCart.id,
      NhanVienId: user.id,
    };
    this.cart.HuyDon(data).subscribe((res) => {
      if (isDaXacNhan) {
        this.CongSoLuong();
      }
      this.getCart(data.Id);
      this.toarst.success('Hủy đơn thành công', 'Thông báo!');
    });
  }
}
