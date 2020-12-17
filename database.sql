CREATE DATABASE QLPhone
GO
-- USE MASTER; DROP DATABASE QLSTORE
USE QLPhone
GO
/****** Object:  UserDefinedDataType [dbo].[GUID]    Script Date: 12/2/2020 11:36:55 AM ******/
CREATE TYPE [dbo].[GUID] FROM [uniqueidentifier] NULL
GO
GO
/****** Object:  UserDefinedDataType [dbo].[STRING_LONG]    Script Date: 12/2/2020 11:36:23 AM ******/
CREATE TYPE [dbo].[STRING_LONG] FROM [nvarchar](max) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[STRING]    Script Date: 12/2/2020 11:37:28 AM ******/
CREATE TYPE [dbo].[STRING] FROM [nvarchar](200) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[STRING_SHORT]    Script Date: 12/2/2020 11:37:44 AM ******/
CREATE TYPE [dbo].[STRING_SHORT] FROM [nvarchar](50) NULL
GO



GO
--TỪ ĐIỂN
CREATE TABLE CMLoaiTuDien(
	Id GUID PRIMARY KEY,
	MaLoai STRING_SHORT,
	Ten STRING_SHORT
)
GO
CREATE TABLE CMTuDien(
	Id GUID PRIMARY KEY,
	MaTuDien STRING_SHORT,
	LoaiTuDienId GUID,
	TenNgan STRING_SHORT,
	Ten STRING_SHORT,
	GhiChu STRING,
	UuTien INT,
	Active BIT,
	CONSTRAINT FK_CMTuDien_LoaiTuDienId FOREIGN KEY (LoaiTuDienId) REFERENCES CMLoaiTuDien(Id)
)
GO
CREATE TABLE DMAnh(
	Id GUID PRIMARY KEY,
	Ten STRING,
	ImageUrl STRING,
	UuTien INT,
	Active BIT,
	LoaiAnhId GUID,
	CONSTRAINT FK_DMAnh_LoaiAnhId FOREIGN KEY (LoaiAnhId) REFERENCES CMTuDien(Id)
)
GO
-- TÀI KHOẢN
CREATE TABLE HTUser (
	Id GUID PRIMARY KEY,
	HoTen STRING_SHORT NOT NULL,
	TenKhongDau STRING_SHORT ,
	DiaChi STRING,
	NgaySinh DATETIME,
	SoDienThoai STRING_SHORT,
	GioiThieu nvarchar(500),
	Email STRING_SHORT NOT NULL,
	Username STRING_SHORT NOT NULL,
	PasswordHash STRING NOT NULL,
	CreateDate DATETIME,
	Active BIT,
	AnhId GUID,
	LoaiTaiKhoanId GUID,
	CONSTRAINT FK_HTUser_AnhIdh FOREIGN KEY (AnhId) REFERENCES DMAnh(Id),
	CONSTRAINT FK_HTUser_LoaiTaiKhoanId FOREIGN KEY (LoaiTaiKhoanId) REFERENCES CMTuDien(Id)
)
GO
CREATE TABLE DMDiaChi(
	Id GUID,
	UserId GUID,
	DiaChi STRING,
	Sdt STRING_SHORT,
	Active BIT,
	LoaiDiaChiId GUID,
	CONSTRAINT FK_DMDiaChi_UserId FOREIGN KEY (UserId) REFERENCES HTUser(Id),
	CONSTRAINT FK_DMDiaChi_LoaiDiaChiId FOREIGN KEY (LoaiDiaChiId) REFERENCES CMTuDien(Id)
)
GO
CREATE TABLE HTRole(
	Id GUID PRIMARY KEY,
	Code STRING,
	Ten STRING_SHORT,
	MoTa STRING,
)
GO
CREATE TABLE HTUserRole(
	UserId GUID,
	RoleId GUID,
	PRIMARY KEY (UserId,RoleId),
	CONSTRAINT FK_HTRole_UserId FOREIGN KEY (UserId) REFERENCES HTUser(Id),
	CONSTRAINT FK_HTRole_RoleId FOREIGN KEY (RoleId) REFERENCES HTRole(Id)
)
GO
CREATE TABLE HTMenu(
	Id GUID PRIMARY KEY,
	Icon STRING,
	Ten STRING,
	Controller STRING,
	Link STRING,
	Mota STRING,
	ParentId GUID,
	CONSTRAINT FK_HTMenu_ParentId FOREIGN KEY (ParentId) REFERENCES HTMenu(Id)
)
GO
CREATE TABLE HTRoleMenu(
	Id GUID PRIMARY KEY,
	RoleId GUID,
	MenuId GUID,
	UuTien INT,
	Mota STRING,
	CONSTRAINT FK_HTRoleMenu_RoleId FOREIGN KEY (RoleId) REFERENCES HTRole(Id),
	CONSTRAINT FK_HTRoleMenu_MenuId FOREIGN KEY (MenuId) REFERENCES HTMenu(Id)
)
GO
-- KHU VUC
CREATE TABLE DMTinhThanh(
	Id GUID PRIMARY KEY,
Ten STRING_SHORT,
	Active BIT,
	UuTien INT,
	MoTa STRING,
	ParentId GUID,
	IdLoaiTinhThanh GUID,
	CONSTRAINT FK_DMTinhThanh_ParentId FOREIGN KEY (ParentId) REFERENCES DMTinhThanh(Id),
	CONSTRAINT FK_DMTinhThanh_IdLoaiTinhThanh FOREIGN KEY (IdLoaiTinhThanh) REFERENCES CMTuDien(Id)
)
GO
CREATE TABLE DMChiNhanh(
	Id GUID PRIMARY KEY,
	Ten STRING_SHORT,
	Mota STRING,
	Phone STRING_SHORT,
	DiaChi STRING,
	UuTien INT,
	Active BIT,
	ThoiGianTao DATETIME
)
GO
CREATE TABLE DMPhongBan(
	Id GUID PRIMARY KEY,
	Ten STRING_SHORT,
	ChiNhanhId GUID,
	UserId GUID,
	Active BIT,
	CONSTRAINT FK_DMPhongBan_IdChiNhanh FOREIGN KEY (ChiNhanhId) REFERENCES DMChiNhanh(Id),
	CONSTRAINT FK_DMPhongBan_UserId FOREIGN KEY (UserId) REFERENCES HTUser(Id)
)
GO
CREATE TABLE DMKho	(
	Id GUID PRIMARY KEY,
	Ten	STRING_SHORT,
	ChiNhanhId GUID,
	Active BIT,
	CONSTRAINT FK_DMKho_ChiNhanhId FOREIGN KEY (ChiNhanhId) REFERENCES DMChiNhanh(Id)
)
GO
CREATE TABLE DMNhaCungCap(
	Id GUID PRIMARY KEY,
	Ten STRING_SHORT,
	DiaChi STRING,
	Sdt STRING_SHORT,
	Mota STRING_LONG,
	Anh STRING,
	Active BIT,
	ThoiGianTao DATETIME
)
GO
CREATE TABLE DMCauHinh(
	Id GUID PRIMARY KEY,
	ManHinh STRING_SHORT,
	CPU STRING_SHORT,
	PIN STRING_SHORT,
	RAM STRING_SHORT,
	NGAYSX DATETIME,
	ThoiGianBaoHanh INT,
	DUNGLUONG STRING_SHORT,
	MOTA STRING_LONG,
	LoaiCauHinhId GUID,
	CONSTRAINT FK_DMCauHinh_TuDienId FOREIGN KEY (LoaiCauHinhId) REFERENCES CMTuDien(Id),

)
GO
CREATE TABLE DMSanPham(
	Id GUID PRIMARY KEY,
	Ten	STRING,
	TenNgan STRING_SHORT,
	MoTa STRING_LONG,
	Rate INT,
	ViewCount INT,
	ThoiGianTao DATETIME,
	ThoiGianDong DATETIME,
	SeriesNumber STRING_SHORT,
	Color STRING_SHORT,
	Gia DECIMAL(18,2),
	TrangThaiId GUID,
	NhaCungCapId  GUID,
	AnhId  GUID,
	NguoiNhapId  GUID,
	KhoId  GUID,
	LoaiSPId  GUID,
	KhuyenMai INT,
	CauHinhId GUID,
	CONSTRAINT FK_DMSanPham_IdTrangThai FOREIGN KEY (TrangThaiId ) REFERENCES CMTuDien(Id),
	CONSTRAINT FK_DMSanPham_IdNhaCungCap FOREIGN KEY (NhaCungCapId ) REFERENCES DMNhaCungCap(Id),
	CONSTRAINT FK_DMSanPham_IdAnh FOREIGN KEY (AnhId ) REFERENCES DMAnh(Id),
	CONSTRAINT FK_DMSanPham_IdNguoiNhap FOREIGN KEY (NguoiNhapId ) REFERENCES HTUser(Id),
	CONSTRAINT FK_DMSanPham_IdKho FOREIGN KEY (KhoId ) REFERENCES DMKho(Id),
	CONSTRAINT FK_DMSanPham_IdLoaiSP FOREIGN KEY (LoaiSPId ) REFERENCES CMTuDien(Id),
	CONSTRAINT FK_DMCauHinh_CauHinhId FOREIGN KEY (CauHinhId) REFERENCES DMCauHinh(Id)
)
GO
CREATE TABLE DMCart	(
	Id GUID PRIMARY KEY,
	TinNhan	STRING_SHORT,
	TONGTIEN DECIMAL(18,2),
	THOIGIANTAO	DATETIME,
	LoaiGiaoDichId GUID,
	UserId GUID,
	TrangThaiId GUID,
	CONSTRAINT FK_DMCart_IdLoaiGD FOREIGN KEY (LoaiGiaoDichId) REFERENCES CMTuDien(Id),
	CONSTRAINT FK_DMCart_UserId FOREIGN KEY (UserId) REFERENCES HTUser(Id),
	CONSTRAINT FK_DMCart_IdTrangThai FOREIGN KEY (TrangThaiId) REFERENCES CMTuDien(Id)
)
GO
CREATE TABLE DMCartDetail(
	Id GUID PRIMARY KEY,
	SanPhamId GUID,
	CartId GUID,
	UuTien INT,
	ThoiGianTao DATETIME,
CONSTRAINT FK_DMCartDetail_IdSanPham FOREIGN KEY (SanPhamId) REFERENCES DMSanPham(Id),
	CONSTRAINT FK_DMCartDetail_CartId FOREIGN KEY (CartId) REFERENCES DMCart(Id),

)

GO
CREATE TABLE DMBaoCao(
	Id GUID PRIMARY KEY,
	TieuDe STRING,
	NoiDung	STRING_LONG,
	TEN	STRING,
	ThuTuc STRING,
	Active BIT,
)

GO
CREATE TABLE HSCmt(
	Id GUID PRIMARY KEY,
	UserId GUID,
	IdSanPham GUID,
	NoiDung STRING_LONG,
	Active BIT,
	ThoiGianTao DATETIME,
	CONSTRAINT FK_HSCmt_UserId FOREIGN KEY (UserId) REFERENCES HTUser(Id),
	CONSTRAINT FK_HSCmt_IdSanPham FOREIGN KEY (IdSanPham) REFERENCES DMSanPham(Id)
)
GO
CREATE TABLE HSTraLoiCmt(
	Id GUID PRIMARY KEY,
	IdCmt GUID,
	NoiDung STRING_LONG,
	Active BIT,
	ThoiGianTao DATETIME,
	CONSTRAINT FK_HSTraLoiCmt_IdCmt FOREIGN KEY (IdCmt) REFERENCES HSCmt(Id)
)
GO
CREATE TABLE HSTinNhan(
	Id GUID PRIMARY KEY,
	UserId GUID,
	IdTrangThai GUID,
	Active BIT,
	ThoiGianTao	DATETIME,
	CONSTRAINT FK_HSTinNhan_UserId FOREIGN KEY (UserId) REFERENCES HTUser(Id),
	CONSTRAINT FK_HSTinNhan_IdTrangThai FOREIGN KEY (IdTrangThai) REFERENCES CMTuDien(Id)
)
CREATE TABLE HSTraLoiTinNhan(
	Id GUID PRIMARY KEY,
	IdTinNhan GUID,
	NoiDung STRING_LONG,
	Active BIT,
	ThoiGianTao	DATETIME,
	Watched	BIT,
	CONSTRAINT FK_HSTraLoiTinNhan_IdTinNhan FOREIGN KEY (IdTinNhan) REFERENCES HSTinNhan(Id)
)
USE [QLPhone]
GO
INSERT [dbo].[HTUser] ([Id], [HoTen], [TenKhongDau], [DiaChi], [NgaySinh], [SoDienThoai], [GioiThieu], [Email], [Username], [PasswordHash], [CreateDate], [Active], [AnhId], [LoaiTaiKhoanId]) VALUES (N'9b76ed13-ce77-4d41-0908-08d0223497a3', N'Cường NB', N'nbc', N'sd', '19981010', N'111111111111', N'I LIKE R15', N'NBC@GMAIL.COM', N'admin', N'8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HTUser] ([Id], [HoTen], [TenKhongDau], [DiaChi], [NgaySinh], [SoDienThoai], [GioiThieu], [Email], [Username], [PasswordHash], [CreateDate], [Active], [AnhId], [LoaiTaiKhoanId]) VALUES (N'9b76ed13-ce77-4d41-0908-08d0223497b2', N'Cường NB  KHÁCH HÀNG', N'nbc', N'sd', '19981010', N'111111111111', N'I LIKE R15', N'NBC@GMAIL.COM', N'cuong', N'8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[HTRole] ([Id], [Code], [Ten], [MoTa]) VALUES (N'9b76ed13-ce77-4d41-0908-08d5423497a3', N'admin', N'admin', N'admin')
GO
INSERT [dbo].[HTRole] ([Id], [Code], [Ten], [MoTa]) VALUES (N'9b76ed13-ce77-4d41-0908-08d8123497a3', N'Nhân viên', N'nhanvien', N'nhanvien')
GO
INSERT [dbo].[HTRole] ([Id], [Code], [Ten], [MoTa]) VALUES (N'9b76ed13-ce77-4d41-0908-08d8223497a3', N'giamdoc', N'Giám Đốc', N'GIAMDOC')
GO
INSERT [dbo].[HTRole] ([Id], [Code], [Ten], [MoTa]) VALUES (N'9b76ed13-ce77-4d41-0908-08d8223497a8', N'Khách hàng', N'khachhang', N'Khách hàng')
GO
INSERT [dbo].[HTUserRole] ([UserId], [RoleId]) VALUES (N'9b76ed13-ce77-4d41-0908-08d0223497a3', N'9b76ed13-ce77-4d41-0908-08d5423497a3')
GO
INSERT [dbo].[HTUserRole] ([UserId], [RoleId]) VALUES (N'9b76ed13-ce77-4d41-0908-08d0223497b2', N'9b76ed13-ce77-4d41-0908-08d8223497a8')
GO
