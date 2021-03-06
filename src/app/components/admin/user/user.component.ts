import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { ToastrService } from 'ngx-toastr';
import { UserService } from 'src/app/services/user/user.service';
import { PopChangePass } from './DialogChangePass/changepass.popup';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css', '../../css/style.css'],
})
export class UserComponent implements OnInit {
  constructor(
    private user: UserService,
    private fb: FormBuilder,
    private dialogPass: MatDialog,
    private toast: ToastrService
  ) {}
  ProfileUser: FormGroup;
  MyProfile: any;
  ngOnInit() {
    const userLogin = JSON.parse(localStorage.getItem('user'));
    this.getProfile(userLogin[0].id);
  }
  // get profiukle
  getProfile(id) {
    this.ProfileUser = this.fb.group({
      Id: '',
      HoTen: '',
      DiaChi: '',
      Email: '',
      GioiThieu: '',
      SoDienThoai: '',
      TenKhongDau: '',
      Username: '',
      Tuoi: '',
    });
    this.user.getProfileById(id).subscribe((res: any) => {
      this.ProfileUser = this.fb.group({
        Id: res.id,
        HoTen: res.hoTen,
        DiaChi: res.diaChi,
        Email: res.email,
        GioiThieu: res.gioiThieu,
        SoDienThoai: res.soDienThoai,
        TenKhongDau: res.tenKhongDau,
        Username: res.username,
        Tuoi: res.tuoi,
      });
    });
  }
  // end profile
  SaveChange() {
    this.user.changeProfile(this.ProfileUser.value).subscribe(
      (res) => {
        this.toast.success("Lưu thông tin thành công","Thông báo");
      },
      (err) => {
        this.toast.error("Lưu thông tin thất bại","Thông báo");
      }
    );
  }

  OpenDialogChangePass() {
    const dialog = this.dialogPass.open(PopChangePass, {
      width: '30%',
      height: '400px',
      data: { obj: this.ProfileUser.value },
      disableClose: true,
    });

    // dialog.afterClosed().subscribe(res=>{
    // })
  }
}
