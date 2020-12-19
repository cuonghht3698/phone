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
	AnhId GUID,
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
	LoaiTaiKhoanId GUID,
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
	NguoiNhapId  GUID,
	KhoId  GUID,
	LoaiSPId  GUID,
	KhuyenMai INT,
	CauHinhId GUID,
  Active BIT
	CONSTRAINT FK_DMSanPham_IdTrangThai FOREIGN KEY (TrangThaiId ) REFERENCES CMTuDien(Id),
	CONSTRAINT FK_DMSanPham_IdNhaCungCap FOREIGN KEY (NhaCungCapId ) REFERENCES DMNhaCungCap(Id),
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
INSERT [dbo].[CMLoaiTuDien] ([Id], [MaLoai], [Ten]) VALUES (N'7653e060-2ed6-4b8e-8b3c-1b2453faef6c', N'TrangThai', N'Trạng thái')
GO
INSERT [dbo].[CMLoaiTuDien] ([Id], [MaLoai], [Ten]) VALUES (N'd5360145-9662-4c6b-a8f1-5813af3fa34f', N'LoaiTinhThanh', N'Loại tỉnh thành')
GO
INSERT [dbo].[CMLoaiTuDien] ([Id], [MaLoai], [Ten]) VALUES (N'98a7e3b2-4ac4-4db6-ba85-9d6f963d62de', N'LoaiCauHinh', N'Loại cấu hình')
GO
INSERT [dbo].[CMLoaiTuDien] ([Id], [MaLoai], [Ten]) VALUES (N'89fe7160-5bda-4f1d-b34e-9f79d6943573', N'LoaiTaiKhoan', N'Loai Tài khoản')
GO
INSERT [dbo].[CMTuDien] ([Id], [MaTuDien], [LoaiTuDienId], [TenNgan], [Ten], [GhiChu], [UuTien], [Active]) VALUES (N'6106b96d-9229-49ca-a01d-24795b7f4274', N'PC', N'98a7e3b2-4ac4-4db6-ba85-9d6f963d62de', N'Máy tính', N'Máy tính', N'Máy tính', 2, 1)
GO
INSERT [dbo].[CMTuDien] ([Id], [MaTuDien], [LoaiTuDienId], [TenNgan], [Ten], [GhiChu], [UuTien], [Active]) VALUES (N'e6f2d412-4247-40c7-b2d2-49e51658ca0d', N'Tinh', N'd5360145-9662-4c6b-a8f1-5813af3fa34f', N'Tỉnh', N'Tỉnh', N'Cấp tỉnh', 1, 1)
GO
INSERT [dbo].[CMTuDien] ([Id], [MaTuDien], [LoaiTuDienId], [TenNgan], [Ten], [GhiChu], [UuTien], [Active]) VALUES (N'5d47cc16-bb8d-458c-998d-61513d9f9833', N'Huyen', N'd5360145-9662-4c6b-a8f1-5813af3fa34f', N'Huyện', N'Huyện', N'Cấp Huyện', 2, 1)
GO
INSERT [dbo].[CMTuDien] ([Id], [MaTuDien], [LoaiTuDienId], [TenNgan], [Ten], [GhiChu], [UuTien], [Active]) VALUES (N'ae678359-7493-4ba0-b9e1-a112b11ef7b7', N'Phone', N'98a7e3b2-4ac4-4db6-ba85-9d6f963d62de', N'Điện thoại', N'Điện thoại', N'Điện thoại', 1, 1)
GO
INSERT [dbo].[CMTuDien] ([Id], [MaTuDien], [LoaiTuDienId], [TenNgan], [Ten], [GhiChu], [UuTien], [Active]) VALUES (N'6d7c04cb-185d-47ab-8f6b-e3c903824481', N'Thon', N'd5360145-9662-4c6b-a8f1-5813af3fa34f', N'Thôn', N'Thôn', N'Cấp Thôn', 4, 1)
GO
INSERT [dbo].[CMTuDien] ([Id], [MaTuDien], [LoaiTuDienId], [TenNgan], [Ten], [GhiChu], [UuTien], [Active]) VALUES (N'1cee9b7e-5d4b-41a3-870a-e93c86d1e69d', N'Laptop', N'98a7e3b2-4ac4-4db6-ba85-9d6f963d62de', N'Laptop', N'Laptop', N'Laptop', 3, 1)
GO
INSERT [dbo].[CMTuDien] ([Id], [MaTuDien], [LoaiTuDienId], [TenNgan], [Ten], [GhiChu], [UuTien], [Active]) VALUES (N'd87ed10e-bfad-4eb5-85ef-feac78b57edd', N'Xa', N'd5360145-9662-4c6b-a8f1-5813af3fa34f', N'Xã', N'Xã', N'Cấp Xã', 3, 1)
GO
INSERT [dbo].[HTUser] ([Id], [HoTen], [TenKhongDau], [DiaChi], [NgaySinh], [SoDienThoai], [GioiThieu], [Email], [Username], [PasswordHash], [CreateDate], [Active], [LoaiTaiKhoanId]) VALUES (N'9b76ed13-ce77-4d41-0908-08d0223497a3', N'Cường NB', N'nbc', N'sd', CAST(N'1998-10-10T00:00:00.000' AS DateTime), N'111111111111', N'I LIKE R15', N'NBC@GMAIL.COM', N'admin', N'8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', NULL, NULL, NULL)
GO
INSERT [dbo].[HTUser] ([Id], [HoTen], [TenKhongDau], [DiaChi], [NgaySinh], [SoDienThoai], [GioiThieu], [Email], [Username], [PasswordHash], [CreateDate], [Active], [LoaiTaiKhoanId]) VALUES (N'9b76ed13-ce77-4d41-0908-08d0223497b2', N'Cường NB  KHÁCH HÀNG', N'nbc', N'sd', CAST(N'1998-10-10T00:00:00.000' AS DateTime), N'111111111111', N'I LIKE R15', N'NBC@GMAIL.COM', N'cuong', N'8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', NULL, NULL, NULL)
GO
INSERT [dbo].[DMTinhThanh] ([Id], [Ten], [Active], [UuTien], [MoTa], [ParentId], [IdLoaiTinhThanh]) VALUES (N'43c02908-1ac0-43e6-bce7-45f6c31b7fa8', N'Hà nội', 1, 1, N'Hà Nội', NULL, N'e6f2d412-4247-40c7-b2d2-49e51658ca0d')
GO
INSERT [dbo].[DMTinhThanh] ([Id], [Ten], [Active], [UuTien], [MoTa], [ParentId], [IdLoaiTinhThanh]) VALUES (N'91529ad7-c16b-470d-8cae-e24c13892cce', N'Đan phượng', 1, 3, N'Đan phượng', N'43c02908-1ac0-43e6-bce7-45f6c31b7fa8', N'5d47cc16-bb8d-458c-998d-61513d9f9833')
GO
INSERT [dbo].[DMCauHinh] ([Id], [ManHinh], [CPU], [PIN], [RAM], [NGAYSX], [ThoiGianBaoHanh], [DUNGLUONG], [MOTA], [LoaiCauHinhId]) VALUES (N'31f0e5e9-2c62-418c-88d6-09809c5ddfc6', N'', N'', N'', N'', CAST(N'2020-12-18T04:49:46.797' AS DateTime), 0, N'', N'', NULL)
GO
INSERT [dbo].[DMCauHinh] ([Id], [ManHinh], [CPU], [PIN], [RAM], [NGAYSX], [ThoiGianBaoHanh], [DUNGLUONG], [MOTA], [LoaiCauHinhId]) VALUES (N'87e9643a-ab90-4d75-92d1-18fa4b6adc76', N'sadfsd', N'fdsf', N'sdf', N'sdf', CAST(N'2020-12-19T10:12:59.893' AS DateTime), 233, N'3', N'Cpu: fdsfRam: sdfPin: sdfMàn hình: sadfsd.....', N'6106b96d-9229-49ca-a01d-24795b7f4274')
GO
INSERT [dbo].[DMCauHinh] ([Id], [ManHinh], [CPU], [PIN], [RAM], [NGAYSX], [ThoiGianBaoHanh], [DUNGLUONG], [MOTA], [LoaiCauHinhId]) VALUES (N'20ed7bb2-6e4e-43aa-a8a7-6ec5c3aa74e1', N'PC GAMING 1', N'I7 10000K', N'', N'16GB', CAST(N'2020-12-01T17:00:00.000' AS DateTime), NULL, N'1000GB', N'', N'6106b96d-9229-49ca-a01d-24795b7f4274')
GO
INSERT [dbo].[DMCauHinh] ([Id], [ManHinh], [CPU], [PIN], [RAM], [NGAYSX], [ThoiGianBaoHanh], [DUNGLUONG], [MOTA], [LoaiCauHinhId]) VALUES (N'd076f160-4bdc-4d47-86cd-ba1e8e3dd92a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL)
GO
INSERT [dbo].[DMSanPham] ([Id], [Ten], [TenNgan], [MoTa], [Rate], [ViewCount], [ThoiGianTao], [ThoiGianDong], [SeriesNumber], [Color], [Gia], [TrangThaiId], [NhaCungCapId], [NguoiNhapId], [KhoId], [LoaiSPId], [KhuyenMai], [CauHinhId], [Active]) VALUES (N'a2410eda-f62e-4bad-a5e8-0e8b488725e3', N'22', N'', N'2', 0, 0, CAST(N'2020-12-19T09:58:32.007' AS DateTime), CAST(N'2020-12-19T09:58:32.007' AS DateTime), N'2', N'2', CAST(2.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, N'6106b96d-9229-49ca-a01d-24795b7f4274', 2, NULL, NULL)
GO
INSERT [dbo].[DMSanPham] ([Id], [Ten], [TenNgan], [MoTa], [Rate], [ViewCount], [ThoiGianTao], [ThoiGianDong], [SeriesNumber], [Color], [Gia], [TrangThaiId], [NhaCungCapId], [NguoiNhapId], [KhoId], [LoaiSPId], [KhuyenMai], [CauHinhId], [Active]) VALUES (N'982de781-a2ac-4405-9ddc-d0b7e7c955dd', N'PC GAME 2', N'', N'ADGSADGSADGSADG2SDGDSBGDSGBDGSDSG', 0, 0, CAST(N'2020-12-19T10:14:11.210' AS DateTime), CAST(N'2020-12-19T10:14:11.210' AS DateTime), N'BGSDGDFSGDSGSGSG', N'ĐEN XANH ĐỎ', CAST(20000002.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, N'6106b96d-9229-49ca-a01d-24795b7f4274', 102, N'87e9643a-ab90-4d75-92d1-18fa4b6adc76', NULL)
GO
INSERT [dbo].[DMSanPham] ([Id], [Ten], [TenNgan], [MoTa], [Rate], [ViewCount], [ThoiGianTao], [ThoiGianDong], [SeriesNumber], [Color], [Gia], [TrangThaiId], [NhaCungCapId], [NguoiNhapId], [KhoId], [LoaiSPId], [KhuyenMai], [CauHinhId], [Active]) VALUES (N'32e9b1ab-bc72-4803-b4d2-f35065bb2613', N'PC GAME 1', N'', N'ADGSADGSADGSADG', 0, 0, CAST(N'2020-12-19T10:14:11.210' AS DateTime), CAST(N'2020-12-19T10:14:11.210' AS DateTime), N'12312ADFS', N'ĐEN XANH', CAST(2000000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, N'6106b96d-9229-49ca-a01d-24795b7f4274', 10, N'87e9643a-ab90-4d75-92d1-18fa4b6adc76', NULL)
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
INSERT [dbo].[DMBaoCao] ([Id], [TieuDe], [NoiDung], [TEN], [ThuTuc], [Active]) VALUES (N'00000000-0000-0000-0000-000000000000', NULL, N'null', NULL, NULL, NULL)
GO
