import { Component, Inject, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ToastrService } from 'ngx-toastr';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { AnhService } from 'src/app/services/danhmuc/anh.service';
import { CauHinhService } from 'src/app/services/danhmuc/cauhinh.service';
import { NhaCungCapService } from 'src/app/services/danhmuc/nhacungcap.service';
import { SanPhamService } from 'src/app/services/danhmuc/sanpham.service';
import { TudienService } from 'src/app/services/danhmuc/tudien.service';
import { GuidId } from 'src/app/services/ERole';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'sanpham-pop',
  templateUrl: './sanpham.popup.html',
})
export class PopupSanPham implements OnInit {
  stateCtrl = new FormControl();
  filteredStates: Observable<any>;
  baseUrl = environment.ApiUrl + 'anh/get/';
  constructor(
    private dialog: MatDialogRef<PopupSanPham>,
    @Inject(MAT_DIALOG_DATA) public data,
    private sp: SanPhamService,
    private toastr: ToastrService,
    private tudien: TudienService,
    private cauhinh: CauHinhService,
    private ncc: NhaCungCapService,
    private anh: AnhService
  ) {}
  private _filterStates(value: string) {
    const filterValue = value.toLowerCase();

    return this.states.filter(
      (state) => state.code.toLowerCase().indexOf(filterValue) === 0
    );
  }
  states = [
    // {
    //   name: '218312837123123',
    //   population: '2.978M',
    //   // https://commons.wikimedia.org/wiki/File:Flag_of_Arkansas.svg
    //   flag: 'https://upload.wikimedia.org/wikipedia/commons/9/9d/Flag_of_Arkansas.svg'
    // }
  ];
  IdNull = GuidId.EmptyId;
  dsLoaiSp;
  dataSP: SanPhamModel = {
    Id: GuidId.EmptyId,
    CauHinhId: null,
    KhoId: null,
    KhuyenMai: 0,
    LoaiSPId: null,
    MoTa: '',
    NguoiNhapId: JSON.parse(localStorage.getItem('user'))[0].id,
    NhaCungCapId: null,
    Ten: '',
    TenNgan: '',
    ThoiGianDong: new Date(),
    ThoiGianTao: new Date(),
    ViewCount: 0,
    Rate: 0,
    TrangThaiId: null,
    Active: true,
    ImageUrl: '',
    GiaMacDinh: 0,
  };
  dsLoaiCauHinh;
  dsCauHinh;
  checkDsCh;
  dsNhaCungCap;
  ngOnInit() {
    //console.log(this.data);
    this.getNhaCungCap();
    this.getLoaiSanPham();

    if (this.data) {
      const item = this.data;
      this.dataSP = {
        Id: item.id,
        CauHinhId: item.cauHinhId,
        KhoId: item.khoId,
        KhuyenMai: item.khuyenMai,
        LoaiSPId: item.loaiSpid,
        MoTa: item.moTa,
        NguoiNhapId: item.nguoiNhapId,
        NhaCungCapId: item.nhaCungCapId,
        Ten: item.ten,
        TenNgan: item.tenNgan,
        ThoiGianDong: item.thoiGianDong,
        ThoiGianTao: item.thoiGianTao,
        ViewCount: item.viewCount,
        Rate: item.rate,
        TrangThaiId: item.trangThaiId,
        Active: item.active,
        ImageUrl: item.imageUrl,
        GiaMacDinh: item.giaMacDinh,
      };

      //this.getAnh(item.id);
      if (item.loaiSpid != null) {
        this.getLoaiCauHinh(item.loaiSpid);
      }
      if (item.cauHinh) {
        this.stateCtrl.setValue(item.cauHinh.code);
      }
      this.imageUrl = this.baseUrl + item.imageUrl;
    }
  }

  SelectItem(item) {
    this.dataSP = {
      Id: item.id,
      CauHinhId: item.cauHinhId,
      KhoId: item.khoId,
      KhuyenMai: item.khuyenMai,
      LoaiSPId: item.loaiSpId,
      MoTa: item.moTa,
      NguoiNhapId: item.nguoiNhapId,
      NhaCungCapId: item.nhaCungCapId,
      Ten: item.ten,
      TenNgan: item.tenNgan,
      ThoiGianDong: item.thoiGianDong,
      ThoiGianTao: item.thoiGianTao,
      ViewCount: item.viewCount,
      Rate: item.rate,
      TrangThaiId: item.trangThaiId,
      Active: item.active,
      ImageUrl: item.imageUrl,
      GiaMacDinh: item.giaMacDinh,
    };
  }

  imageUrl = '/assets/img/emptyImage.png';
  imageName = null;
  fileToUpload: File = null;
  SelectAnh: FormData = null;
  getLoaiSanPham() {
    this.tudien.getByLoai('LoaiCauHinh').subscribe((res: any) => {
      this.dsLoaiSp = res;
      //console.log(res);
    });
  }

  uploadFile(event) {
    this.fileToUpload = event.target.files[0];
    this.InfoImage.Ten = event.target.files[0].name;

    //Show image preview
    var reader = new FileReader();
    reader.onload = (event: any) => {
      this.imageUrl = event.target.result;
    };
    reader.readAsDataURL(this.fileToUpload);
    const formData = new FormData();
    formData.append('file', event.target.files[0]);
    this.SelectAnh = formData;
  }
  UploadAnh() {
    if (this.SelectAnh != null) {
      this.anh.PostAnh(this.SelectAnh).subscribe((res) => {
        //console.log(res);
      });
    }
  }
  InfoImage = {
    Id: GuidId.EmptyId,
    Ten: '',
    ImageUrl: '',
    UuTien: 0,
    Active: 1,
    AnhId: '',
  };
  getAnh(id) {
    this.anh.GetImageForId(id).subscribe((res: any) => {
      //console.log(res);

      this.imageUrl = environment.ApiUrl + 'anh/get/' + res[0].ten;
    });
  }
  // SaveURLToDB() {
  //   if (this.SelectAnh != null) {
  //     this.sp.Create(this.InfoImage).subscribe((res: any) => {
  //       console.log(res);
  //     });
  //   }
  // }
  getNhaCungCap() {
    this.ncc.GetAll().subscribe((res: any) => {
      this.dsNhaCungCap = res;
      //console.log(res);
    });
  }

  getLoaiCauHinh(id) {
    this.cauhinh.FindByLoai(id).subscribe((res: any) => {
      this.dsCauHinh = res;
      this.states = [];
      res.forEach((element) => {
        this.states.push(element);
      });
      this.filteredStates = this.stateCtrl.valueChanges.pipe(
        startWith(''),
        map((state) =>
          state ? this._filterStates(state) : this.states.slice()
        )
      );
      //console.log(this.states);
    });
  }
  CauHinhChosse() {
    if (this.stateCtrl.value) {
      var code = this.stateCtrl.value;
      this.cauhinh.getByCode(code).subscribe((res: any) => {
        //console.log(res);

        this.dataSP.CauHinhId = res[0].id;
      });
    }
  }
  CreateOrUpdate() {
    //console.log(this.dataSP);
    //get id cau hinh

    if (!this.data) {
      this.dataSP.ImageUrl = this.InfoImage.Ten;
      this.sp.Create(this.dataSP).subscribe(
        (res: any) => {
          this.InfoImage.AnhId = res.id;
          this.UploadAnh();
          this.toastr.success('Thêm thành công !', 'Thông báo');
        },
        (err) => {
          //console.log(err);
          this.toastr.error('Thao tác thất bại!', 'Thông báo');
        }
      );
    } else {
      this.dataSP.ImageUrl = this.InfoImage.Ten;
      this.sp.Update(this.dataSP).subscribe(
        (res) => {
          this.toastr.success('Cập nhật thành công !', 'Thông báo');
          this.InfoImage.AnhId = this.dataSP.Id;
          this.UploadAnh();
        },
        (err) => {
          //console.log(err);
          this.toastr.error('Thao tác thất bại!', 'Thông báo');
        }
      );
    }
  }

  Clear() {}
  ClosePopup() {
    this.dialog.close();
  }
}
export interface SanPhamModel {
  Id: string;
  Ten: string;
  TenNgan: string;
  MoTa: string;
  ViewCount: number;
  ThoiGianTao: Date;
  ThoiGianDong: Date;
  NhaCungCapId: string;
  NguoiNhapId: string;
  KhoId: string;
  LoaiSPId: string;
  KhuyenMai: number;
  CauHinhId: string;
  Rate: number;
  TrangThaiId: string;
  Active: boolean;
  ImageUrl: string;
  GiaMacDinh: number;
}
