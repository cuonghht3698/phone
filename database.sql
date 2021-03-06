USE [QLPhone]
GO
/****** Object:  Table [dbo].[CMLoaiTuDien]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMLoaiTuDien](
	[Id] [dbo].[GUID] NOT NULL,
	[MaLoai] [dbo].[STRING_SHORT] NULL,
	[Ten] [dbo].[STRING_SHORT] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMTuDien]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMTuDien](
	[Id] [dbo].[GUID] NOT NULL,
	[MaTuDien] [dbo].[STRING_SHORT] NULL,
	[LoaiTuDienId] [dbo].[GUID] NULL,
	[TenNgan] [dbo].[STRING_SHORT] NULL,
	[Ten] [dbo].[STRING_SHORT] NULL,
	[GhiChu] [dbo].[STRING] NULL,
	[UuTien] [int] NULL,
	[Active] [bit] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DMAnh]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMAnh](
	[Id] [dbo].[GUID] NOT NULL,
	[Ten] [dbo].[STRING] NULL,
	[ImageUrl] [dbo].[STRING] NULL,
	[UuTien] [int] NULL,
	[Active] [bit] NULL,
	[AnhId] [dbo].[GUID] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DMBaoCao]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMBaoCao](
	[Id] [dbo].[GUID] NOT NULL,
	[TieuDe] [dbo].[STRING] NULL,
	[NoiDung] [dbo].[STRING_LONG] NOT NULL,
	[TEN] [dbo].[STRING] NULL,
	[ThuTuc] [dbo].[STRING] NULL,
	[Active] [bit] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DMCart]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMCart](
	[Id] [dbo].[GUID] NOT NULL,
	[TinNhan] [dbo].[STRING_SHORT] NULL,
	[TONGTIEN] [decimal](18, 2) NULL,
	[THOIGIANTAO] [datetime] NULL,
	[LoaiGiaoDichId] [dbo].[GUID] NULL,
	[UserId] [dbo].[GUID] NULL,
	[TrangThaiId] [dbo].[GUID] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DMCartDetail]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMCartDetail](
	[Id] [dbo].[GUID] NOT NULL,
	[SanPhamId] [dbo].[GUID] NULL,
	[CartId] [dbo].[GUID] NULL,
	[UuTien] [int] NULL,
	[ThoiGianTao] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DMCauHinh]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMCauHinh](
	[Id] [dbo].[GUID] NOT NULL,
	[ManHinh] [dbo].[STRING_SHORT] NULL,
	[CPU] [dbo].[STRING_SHORT] NULL,
	[PIN] [dbo].[STRING_SHORT] NULL,
	[RAM] [dbo].[STRING_SHORT] NULL,
	[NGAYSX] [datetime] NULL,
	[ThoiGianBaoHanh] [int] NULL,
	[DUNGLUONG] [dbo].[STRING_SHORT] NULL,
	[MOTA] [dbo].[STRING_LONG] NOT NULL,
	[LoaiCauHinhId] [dbo].[GUID] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DMChiNhanh]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMChiNhanh](
	[Id] [dbo].[GUID] NOT NULL,
	[Ten] [dbo].[STRING_SHORT] NULL,
	[Mota] [dbo].[STRING] NULL,
	[Phone] [dbo].[STRING_SHORT] NULL,
	[DiaChi] [dbo].[STRING] NULL,
	[UuTien] [int] NULL,
	[Active] [bit] NULL,
	[ThoiGianTao] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DMDiaChi]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMDiaChi](
	[Id] [dbo].[GUID] NULL,
	[UserId] [dbo].[GUID] NULL,
	[DiaChi] [dbo].[STRING] NULL,
	[Sdt] [dbo].[STRING_SHORT] NULL,
	[Active] [bit] NULL,
	[LoaiDiaChiId] [dbo].[GUID] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DMKho]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMKho](
	[Id] [dbo].[GUID] NOT NULL,
	[Ten] [dbo].[STRING_SHORT] NULL,
	[ChiNhanhId] [dbo].[GUID] NULL,
	[Active] [bit] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DMNhaCungCap]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMNhaCungCap](
	[Id] [dbo].[GUID] NOT NULL,
	[Ten] [dbo].[STRING_SHORT] NULL,
	[DiaChi] [dbo].[STRING] NULL,
	[Sdt] [dbo].[STRING_SHORT] NULL,
	[Mota] [dbo].[STRING_LONG] NOT NULL,
	[Active] [bit] NULL,
	[ThoiGianTao] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DMPhongBan]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMPhongBan](
	[Id] [dbo].[GUID] NOT NULL,
	[Ten] [dbo].[STRING_SHORT] NULL,
	[ChiNhanhId] [dbo].[GUID] NULL,
	[UserId] [dbo].[GUID] NULL,
	[Active] [bit] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DMSanPham]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMSanPham](
	[Id] [dbo].[GUID] NOT NULL,
	[Ten] [dbo].[STRING] NULL,
	[TenNgan] [dbo].[STRING_SHORT] NULL,
	[MoTa] [dbo].[STRING_LONG] NOT NULL,
	[Rate] [int] NULL,
	[ViewCount] [int] NULL,
	[ThoiGianTao] [datetime] NULL,
	[ThoiGianDong] [datetime] NULL,
	[SeriesNumber] [dbo].[STRING_SHORT] NULL,
	[Color] [dbo].[STRING_SHORT] NULL,
	[Gia] [decimal](18, 2) NULL,
	[TrangThaiId] [dbo].[GUID] NULL,
	[NhaCungCapId] [dbo].[GUID] NULL,
	[NguoiNhapId] [dbo].[GUID] NULL,
	[KhoId] [dbo].[GUID] NULL,
	[LoaiSPId] [dbo].[GUID] NULL,
	[KhuyenMai] [int] NULL,
	[CauHinhId] [dbo].[GUID] NULL,
	[Active] [bit] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DMTinhThanh]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMTinhThanh](
	[Id] [dbo].[GUID] NOT NULL,
	[Ten] [dbo].[STRING_SHORT] NULL,
	[Active] [bit] NULL,
	[UuTien] [int] NULL,
	[MoTa] [dbo].[STRING] NULL,
	[ParentId] [dbo].[GUID] NULL,
	[IdLoaiTinhThanh] [dbo].[GUID] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HSCmt]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HSCmt](
	[Id] [dbo].[GUID] NOT NULL,
	[UserId] [dbo].[GUID] NULL,
	[IdSanPham] [dbo].[GUID] NULL,
	[NoiDung] [dbo].[STRING_LONG] NOT NULL,
	[Active] [bit] NULL,
	[ThoiGianTao] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HSTinNhan]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HSTinNhan](
	[Id] [dbo].[GUID] NOT NULL,
	[UserId] [dbo].[GUID] NULL,
	[IdTrangThai] [dbo].[GUID] NULL,
	[Active] [bit] NULL,
	[ThoiGianTao] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HSTraLoiCmt]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HSTraLoiCmt](
	[Id] [dbo].[GUID] NOT NULL,
	[IdCmt] [dbo].[GUID] NULL,
	[NoiDung] [dbo].[STRING_LONG] NOT NULL,
	[Active] [bit] NULL,
	[ThoiGianTao] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HSTraLoiTinNhan]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HSTraLoiTinNhan](
	[Id] [dbo].[GUID] NOT NULL,
	[IdTinNhan] [dbo].[GUID] NULL,
	[NoiDung] [dbo].[STRING_LONG] NOT NULL,
	[Active] [bit] NULL,
	[ThoiGianTao] [datetime] NULL,
	[Watched] [bit] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HTMenu]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HTMenu](
	[Id] [dbo].[GUID] NOT NULL,
	[Icon] [dbo].[STRING] NULL,
	[Ten] [dbo].[STRING] NULL,
	[Controller] [dbo].[STRING] NULL,
	[Link] [dbo].[STRING] NULL,
	[Mota] [dbo].[STRING] NULL,
	[ParentId] [dbo].[GUID] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HTRole]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HTRole](
	[Id] [dbo].[GUID] NOT NULL,
	[Code] [dbo].[STRING] NULL,
	[Ten] [dbo].[STRING_SHORT] NULL,
	[MoTa] [dbo].[STRING] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HTRoleMenu]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HTRoleMenu](
	[Id] [dbo].[GUID] NOT NULL,
	[RoleId] [dbo].[GUID] NULL,
	[MenuId] [dbo].[GUID] NULL,
	[UuTien] [int] NULL,
	[Mota] [dbo].[STRING] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HTUser]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HTUser](
	[Id] [dbo].[GUID] NOT NULL,
	[HoTen] [dbo].[STRING_SHORT] NOT NULL,
	[TenKhongDau] [dbo].[STRING_SHORT] NULL,
	[DiaChi] [dbo].[STRING] NULL,
	[NgaySinh] [datetime] NULL,
	[SoDienThoai] [dbo].[STRING_SHORT] NULL,
	[GioiThieu] [nvarchar](500) NULL,
	[Email] [dbo].[STRING_SHORT] NOT NULL,
	[Username] [dbo].[STRING_SHORT] NOT NULL,
	[PasswordHash] [dbo].[STRING] NOT NULL,
	[CreateDate] [datetime] NULL,
	[Active] [bit] NULL,
	[LoaiTaiKhoanId] [dbo].[GUID] NULL,
PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HTUserRole]    Script Date: 1/11/2021 12:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HTUserRole](
	[UserId] [dbo].[GUID] NOT NULL,
	[RoleId] [dbo].[GUID] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
INSERT [dbo].[DMBaoCao] ([Id], [TieuDe], [NoiDung], [TEN], [ThuTuc], [Active]) VALUES (N'00000000-0000-0000-0000-000000000000', NULL, N'null', NULL, NULL, NULL)
GO
INSERT [dbo].[DMCauHinh] ([Id], [ManHinh], [CPU], [PIN], [RAM], [NGAYSX], [ThoiGianBaoHanh], [DUNGLUONG], [MOTA], [LoaiCauHinhId]) VALUES (N'31f0e5e9-2c62-418c-88d6-09809c5ddfc6', N'', N'', N'', N'', CAST(N'2020-12-18T04:49:46.797' AS DateTime), 0, N'', N'', NULL)
GO
INSERT [dbo].[DMCauHinh] ([Id], [ManHinh], [CPU], [PIN], [RAM], [NGAYSX], [ThoiGianBaoHanh], [DUNGLUONG], [MOTA], [LoaiCauHinhId]) VALUES (N'87e9643a-ab90-4d75-92d1-18fa4b6adc76', N'sadfsd', N'fdsf', N'sdf', N'sdf', CAST(N'2020-12-19T10:12:59.893' AS DateTime), 233, N'3', N'Cpu: fdsfRam: sdfPin: sdfMàn hình: sadfsd.....', N'6106b96d-9229-49ca-a01d-24795b7f4274')
GO
INSERT [dbo].[DMCauHinh] ([Id], [ManHinh], [CPU], [PIN], [RAM], [NGAYSX], [ThoiGianBaoHanh], [DUNGLUONG], [MOTA], [LoaiCauHinhId]) VALUES (N'20ed7bb2-6e4e-43aa-a8a7-6ec5c3aa74e1', N'PC GAMING 1', N'I7 10000K', N'', N'16GB', CAST(N'2020-12-01T17:00:00.000' AS DateTime), NULL, N'1000GB', N'', N'6106b96d-9229-49ca-a01d-24795b7f4274')
GO
INSERT [dbo].[DMCauHinh] ([Id], [ManHinh], [CPU], [PIN], [RAM], [NGAYSX], [ThoiGianBaoHanh], [DUNGLUONG], [MOTA], [LoaiCauHinhId]) VALUES (N'd076f160-4bdc-4d47-86cd-ba1e8e3dd92a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL)
GO
INSERT [dbo].[DMKho] ([Id], [Ten], [ChiNhanhId], [Active]) VALUES (N'a2410eda-f62e-4bad-a5e8-0e8b488725e3', N'2fgsddsdfsdfs', NULL, 1)
GO
INSERT [dbo].[DMSanPham] ([Id], [Ten], [TenNgan], [MoTa], [Rate], [ViewCount], [ThoiGianTao], [ThoiGianDong], [SeriesNumber], [Color], [Gia], [TrangThaiId], [NhaCungCapId], [NguoiNhapId], [KhoId], [LoaiSPId], [KhuyenMai], [CauHinhId], [Active]) VALUES (N'982de781-a2ac-4405-9ddc-d0b7e7c955dd', N'PC GAME 2', N'', N'ADGSADGSADGSADG2SDGDSBGDSGBDGSDSG', 0, 0, CAST(N'2020-12-19T10:14:11.210' AS DateTime), CAST(N'2020-12-19T10:14:11.210' AS DateTime), N'BGSDGDFSGDSGSGSG', N'ĐEN XANH ĐỎ', CAST(20000002.00 AS Decimal(18, 2)), NULL, NULL, NULL, N'a2410eda-f62e-4bad-a5e8-0e8b488725e3', N'6106b96d-9229-49ca-a01d-24795b7f4274', 102, N'87e9643a-ab90-4d75-92d1-18fa4b6adc76', NULL)
GO
INSERT [dbo].[DMTinhThanh] ([Id], [Ten], [Active], [UuTien], [MoTa], [ParentId], [IdLoaiTinhThanh]) VALUES (N'43c02908-1ac0-43e6-bce7-45f6c31b7fa8', N'Hà nội', 1, 1, N'Hà Nội', NULL, N'e6f2d412-4247-40c7-b2d2-49e51658ca0d')
GO
INSERT [dbo].[DMTinhThanh] ([Id], [Ten], [Active], [UuTien], [MoTa], [ParentId], [IdLoaiTinhThanh]) VALUES (N'91529ad7-c16b-470d-8cae-e24c13892cce', N'Đan phượng', 1, 3, N'Đan phượng', N'43c02908-1ac0-43e6-bce7-45f6c31b7fa8', N'5d47cc16-bb8d-458c-998d-61513d9f9833')
GO
INSERT [dbo].[HTMenu] ([Id], [Icon], [Ten], [Controller], [Link], [Mota], [ParentId]) VALUES (N'2d8840a9-7c82-43d7-b4af-2274da1b5bf4', N'backpack', N'Loại từ điển', N'danhmuc', N'loaitudien', N'', NULL)
GO
INSERT [dbo].[HTMenu] ([Id], [Icon], [Ten], [Controller], [Link], [Mota], [ParentId]) VALUES (N'016b7518-56d5-47c4-81ce-2b097ae9d967', N'business', N'Nhà cung cấp', N'danhmuc', N'nhacungcap', N'', NULL)
GO
INSERT [dbo].[HTMenu] ([Id], [Icon], [Ten], [Controller], [Link], [Mota], [ParentId]) VALUES (N'fe30b7f9-a17f-4801-bfed-30def4b38b99', N'contacts', N'Tỉnh thành', N'danhmuc', N'tinhthanh', N'', NULL)
GO
INSERT [dbo].[HTMenu] ([Id], [Icon], [Ten], [Controller], [Link], [Mota], [ParentId]) VALUES (N'2ef931bb-cb85-4fd4-923e-3f3ee78e1b5b', N'brightness_high', N'Quản lý quyền', N'danhmuc', N'rolemenu', N'', NULL)
GO
INSERT [dbo].[HTMenu] ([Id], [Icon], [Ten], [Controller], [Link], [Mota], [ParentId]) VALUES (N'fd5192d8-444c-4be8-9001-44d1fe4a7ff7', N'stay_current_portrait', N'Sản phẩm', N'danhmuc', N'sanpham', N'', NULL)
GO
INSERT [dbo].[HTMenu] ([Id], [Icon], [Ten], [Controller], [Link], [Mota], [ParentId]) VALUES (N'52b07c56-5769-4544-a460-73c1d5e62fde', N'phonelink_setup', N'Cấu hình', N'danhmuc', N'cauhinh', N'', NULL)
GO
INSERT [dbo].[HTMenu] ([Id], [Icon], [Ten], [Controller], [Link], [Mota], [ParentId]) VALUES (N'05abfd90-12a6-4bfc-b9b4-b04f701fe73b', N'stairs', N'Từ điển', N'danhmuc', N'tudien', N'', NULL)
GO
INSERT [dbo].[HTMenu] ([Id], [Icon], [Ten], [Controller], [Link], [Mota], [ParentId]) VALUES (N'7408ddf2-301b-49df-8b1c-b517c9af022b', N'list', N'Danh mục menu', N'danhmuc', N'menu', N'', NULL)
GO
INSERT [dbo].[HTRole] ([Id], [Code], [Ten], [MoTa]) VALUES (N'9b76ed13-ce77-4d41-0908-08d5423497a3', N'admin', N'Admin', N'admin')
GO
INSERT [dbo].[HTRole] ([Id], [Code], [Ten], [MoTa]) VALUES (N'9b76ed13-ce77-4d41-0908-08d8123497a3', N'nhanvien', N'Nhân viên', N'nhanvien')
GO
INSERT [dbo].[HTRole] ([Id], [Code], [Ten], [MoTa]) VALUES (N'9b76ed13-ce77-4d41-0908-08d8223497a3', N'giamdoc', N'Giám Đốc', N'GIAMDOC')
GO
INSERT [dbo].[HTRole] ([Id], [Code], [Ten], [MoTa]) VALUES (N'9b76ed13-ce77-4d41-0908-08d8223497a8', N'khachhang', N'Khách Hàng', N'Khách hàng')
GO
INSERT [dbo].[HTUser] ([Id], [HoTen], [TenKhongDau], [DiaChi], [NgaySinh], [SoDienThoai], [GioiThieu], [Email], [Username], [PasswordHash], [CreateDate], [Active], [LoaiTaiKhoanId]) VALUES (N'9b76ed13-ce77-4d41-0908-08d0223497a3', N'Cường NB', N'nbc', N'sd', CAST(N'1998-10-10T00:00:00.000' AS DateTime), N'111111111111', N'I LIKE R15', N'NBC@GMAIL.COM', N'admin', N'8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', NULL, NULL, NULL)
GO
INSERT [dbo].[HTUser] ([Id], [HoTen], [TenKhongDau], [DiaChi], [NgaySinh], [SoDienThoai], [GioiThieu], [Email], [Username], [PasswordHash], [CreateDate], [Active], [LoaiTaiKhoanId]) VALUES (N'9b76ed13-ce77-4d41-0908-08d0223497b2', N'Cường NB  KHÁCH HÀNG', N'nbc', N'sd', CAST(N'1998-10-10T00:00:00.000' AS DateTime), N'111111111111', N'I LIKE R15', N'NBC@GMAIL.COM', N'cuong', N'8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', NULL, NULL, NULL)
GO
INSERT [dbo].[HTUserRole] ([UserId], [RoleId]) VALUES (N'9b76ed13-ce77-4d41-0908-08d0223497a3', N'9b76ed13-ce77-4d41-0908-08d5423497a3')
GO
INSERT [dbo].[HTUserRole] ([UserId], [RoleId]) VALUES (N'9b76ed13-ce77-4d41-0908-08d0223497b2', N'9b76ed13-ce77-4d41-0908-08d8223497a8')
GO
ALTER TABLE [dbo].[CMTuDien]  WITH CHECK ADD  CONSTRAINT [FK_CMTuDien_LoaiTuDienId] FOREIGN KEY([LoaiTuDienId])
REFERENCES [dbo].[CMLoaiTuDien] ([Id])
GO
ALTER TABLE [dbo].[CMTuDien] CHECK CONSTRAINT [FK_CMTuDien_LoaiTuDienId]
GO
ALTER TABLE [dbo].[DMCart]  WITH CHECK ADD  CONSTRAINT [FK_DMCart_IdLoaiGD] FOREIGN KEY([LoaiGiaoDichId])
REFERENCES [dbo].[CMTuDien] ([Id])
GO
ALTER TABLE [dbo].[DMCart] CHECK CONSTRAINT [FK_DMCart_IdLoaiGD]
GO
ALTER TABLE [dbo].[DMCart]  WITH CHECK ADD  CONSTRAINT [FK_DMCart_IdTrangThai] FOREIGN KEY([TrangThaiId])
REFERENCES [dbo].[CMTuDien] ([Id])
GO
ALTER TABLE [dbo].[DMCart] CHECK CONSTRAINT [FK_DMCart_IdTrangThai]
GO
ALTER TABLE [dbo].[DMCart]  WITH CHECK ADD  CONSTRAINT [FK_DMCart_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[HTUser] ([Id])
GO
ALTER TABLE [dbo].[DMCart] CHECK CONSTRAINT [FK_DMCart_UserId]
GO
ALTER TABLE [dbo].[DMCartDetail]  WITH CHECK ADD  CONSTRAINT [FK_DMCartDetail_CartId] FOREIGN KEY([CartId])
REFERENCES [dbo].[DMCart] ([Id])
GO
ALTER TABLE [dbo].[DMCartDetail] CHECK CONSTRAINT [FK_DMCartDetail_CartId]
GO
ALTER TABLE [dbo].[DMCartDetail]  WITH CHECK ADD  CONSTRAINT [FK_DMCartDetail_IdSanPham] FOREIGN KEY([SanPhamId])
REFERENCES [dbo].[DMSanPham] ([Id])
GO
ALTER TABLE [dbo].[DMCartDetail] CHECK CONSTRAINT [FK_DMCartDetail_IdSanPham]
GO
ALTER TABLE [dbo].[DMCauHinh]  WITH CHECK ADD  CONSTRAINT [FK_DMCauHinh_TuDienId] FOREIGN KEY([LoaiCauHinhId])
REFERENCES [dbo].[CMTuDien] ([Id])
GO
ALTER TABLE [dbo].[DMCauHinh] CHECK CONSTRAINT [FK_DMCauHinh_TuDienId]
GO
ALTER TABLE [dbo].[DMDiaChi]  WITH CHECK ADD  CONSTRAINT [FK_DMDiaChi_LoaiDiaChiId] FOREIGN KEY([LoaiDiaChiId])
REFERENCES [dbo].[CMTuDien] ([Id])
GO
ALTER TABLE [dbo].[DMDiaChi] CHECK CONSTRAINT [FK_DMDiaChi_LoaiDiaChiId]
GO
ALTER TABLE [dbo].[DMDiaChi]  WITH CHECK ADD  CONSTRAINT [FK_DMDiaChi_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[HTUser] ([Id])
GO
ALTER TABLE [dbo].[DMDiaChi] CHECK CONSTRAINT [FK_DMDiaChi_UserId]
GO
ALTER TABLE [dbo].[DMKho]  WITH CHECK ADD  CONSTRAINT [FK_DMKho_ChiNhanhId] FOREIGN KEY([ChiNhanhId])
REFERENCES [dbo].[DMChiNhanh] ([Id])
GO
ALTER TABLE [dbo].[DMKho] CHECK CONSTRAINT [FK_DMKho_ChiNhanhId]
GO
ALTER TABLE [dbo].[DMPhongBan]  WITH CHECK ADD  CONSTRAINT [FK_DMPhongBan_IdChiNhanh] FOREIGN KEY([ChiNhanhId])
REFERENCES [dbo].[DMChiNhanh] ([Id])
GO
ALTER TABLE [dbo].[DMPhongBan] CHECK CONSTRAINT [FK_DMPhongBan_IdChiNhanh]
GO
ALTER TABLE [dbo].[DMPhongBan]  WITH CHECK ADD  CONSTRAINT [FK_DMPhongBan_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[HTUser] ([Id])
GO
ALTER TABLE [dbo].[DMPhongBan] CHECK CONSTRAINT [FK_DMPhongBan_UserId]
GO
ALTER TABLE [dbo].[DMSanPham]  WITH CHECK ADD  CONSTRAINT [FK_DMCauHinh_CauHinhId] FOREIGN KEY([CauHinhId])
REFERENCES [dbo].[DMCauHinh] ([Id])
GO
ALTER TABLE [dbo].[DMSanPham] CHECK CONSTRAINT [FK_DMCauHinh_CauHinhId]
GO
ALTER TABLE [dbo].[DMSanPham]  WITH CHECK ADD  CONSTRAINT [FK_DMSanPham_IdKho] FOREIGN KEY([KhoId])
REFERENCES [dbo].[DMKho] ([Id])
GO
ALTER TABLE [dbo].[DMSanPham] CHECK CONSTRAINT [FK_DMSanPham_IdKho]
GO
ALTER TABLE [dbo].[DMSanPham]  WITH CHECK ADD  CONSTRAINT [FK_DMSanPham_IdLoaiSP] FOREIGN KEY([LoaiSPId])
REFERENCES [dbo].[CMTuDien] ([Id])
GO
ALTER TABLE [dbo].[DMSanPham] CHECK CONSTRAINT [FK_DMSanPham_IdLoaiSP]
GO
ALTER TABLE [dbo].[DMSanPham]  WITH CHECK ADD  CONSTRAINT [FK_DMSanPham_IdNguoiNhap] FOREIGN KEY([NguoiNhapId])
REFERENCES [dbo].[HTUser] ([Id])
GO
ALTER TABLE [dbo].[DMSanPham] CHECK CONSTRAINT [FK_DMSanPham_IdNguoiNhap]
GO
ALTER TABLE [dbo].[DMSanPham]  WITH CHECK ADD  CONSTRAINT [FK_DMSanPham_IdNhaCungCap] FOREIGN KEY([NhaCungCapId])
REFERENCES [dbo].[DMNhaCungCap] ([Id])
GO
ALTER TABLE [dbo].[DMSanPham] CHECK CONSTRAINT [FK_DMSanPham_IdNhaCungCap]
GO
ALTER TABLE [dbo].[DMSanPham]  WITH CHECK ADD  CONSTRAINT [FK_DMSanPham_IdTrangThai] FOREIGN KEY([TrangThaiId])
REFERENCES [dbo].[CMTuDien] ([Id])
GO
ALTER TABLE [dbo].[DMSanPham] CHECK CONSTRAINT [FK_DMSanPham_IdTrangThai]
GO
ALTER TABLE [dbo].[DMTinhThanh]  WITH CHECK ADD  CONSTRAINT [FK_DMTinhThanh_IdLoaiTinhThanh] FOREIGN KEY([IdLoaiTinhThanh])
REFERENCES [dbo].[CMTuDien] ([Id])
GO
ALTER TABLE [dbo].[DMTinhThanh] CHECK CONSTRAINT [FK_DMTinhThanh_IdLoaiTinhThanh]
GO
ALTER TABLE [dbo].[DMTinhThanh]  WITH CHECK ADD  CONSTRAINT [FK_DMTinhThanh_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[DMTinhThanh] ([Id])
GO
ALTER TABLE [dbo].[DMTinhThanh] CHECK CONSTRAINT [FK_DMTinhThanh_ParentId]
GO
ALTER TABLE [dbo].[HSCmt]  WITH CHECK ADD  CONSTRAINT [FK_HSCmt_IdSanPham] FOREIGN KEY([IdSanPham])
REFERENCES [dbo].[DMSanPham] ([Id])
GO
ALTER TABLE [dbo].[HSCmt] CHECK CONSTRAINT [FK_HSCmt_IdSanPham]
GO
ALTER TABLE [dbo].[HSCmt]  WITH CHECK ADD  CONSTRAINT [FK_HSCmt_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[HTUser] ([Id])
GO
ALTER TABLE [dbo].[HSCmt] CHECK CONSTRAINT [FK_HSCmt_UserId]
GO
ALTER TABLE [dbo].[HSTinNhan]  WITH CHECK ADD  CONSTRAINT [FK_HSTinNhan_IdTrangThai] FOREIGN KEY([IdTrangThai])
REFERENCES [dbo].[CMTuDien] ([Id])
GO
ALTER TABLE [dbo].[HSTinNhan] CHECK CONSTRAINT [FK_HSTinNhan_IdTrangThai]
GO
ALTER TABLE [dbo].[HSTinNhan]  WITH CHECK ADD  CONSTRAINT [FK_HSTinNhan_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[HTUser] ([Id])
GO
ALTER TABLE [dbo].[HSTinNhan] CHECK CONSTRAINT [FK_HSTinNhan_UserId]
GO
ALTER TABLE [dbo].[HSTraLoiCmt]  WITH CHECK ADD  CONSTRAINT [FK_HSTraLoiCmt_IdCmt] FOREIGN KEY([IdCmt])
REFERENCES [dbo].[HSCmt] ([Id])
GO
ALTER TABLE [dbo].[HSTraLoiCmt] CHECK CONSTRAINT [FK_HSTraLoiCmt_IdCmt]
GO
ALTER TABLE [dbo].[HSTraLoiTinNhan]  WITH CHECK ADD  CONSTRAINT [FK_HSTraLoiTinNhan_IdTinNhan] FOREIGN KEY([IdTinNhan])
REFERENCES [dbo].[HSTinNhan] ([Id])
GO
ALTER TABLE [dbo].[HSTraLoiTinNhan] CHECK CONSTRAINT [FK_HSTraLoiTinNhan_IdTinNhan]
GO
ALTER TABLE [dbo].[HTMenu]  WITH CHECK ADD  CONSTRAINT [FK_HTMenu_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[HTMenu] ([Id])
GO
ALTER TABLE [dbo].[HTMenu] CHECK CONSTRAINT [FK_HTMenu_ParentId]
GO
ALTER TABLE [dbo].[HTRoleMenu]  WITH CHECK ADD  CONSTRAINT [FK_HTRoleMenu_MenuId] FOREIGN KEY([MenuId])
REFERENCES [dbo].[HTMenu] ([Id])
GO
ALTER TABLE [dbo].[HTRoleMenu] CHECK CONSTRAINT [FK_HTRoleMenu_MenuId]
GO
ALTER TABLE [dbo].[HTRoleMenu]  WITH CHECK ADD  CONSTRAINT [FK_HTRoleMenu_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[HTRole] ([Id])
GO
ALTER TABLE [dbo].[HTRoleMenu] CHECK CONSTRAINT [FK_HTRoleMenu_RoleId]
GO
ALTER TABLE [dbo].[HTUser]  WITH CHECK ADD  CONSTRAINT [FK_HTUser_LoaiTaiKhoanId] FOREIGN KEY([LoaiTaiKhoanId])
REFERENCES [dbo].[CMTuDien] ([Id])
GO
ALTER TABLE [dbo].[HTUser] CHECK CONSTRAINT [FK_HTUser_LoaiTaiKhoanId]
GO
ALTER TABLE [dbo].[HTUserRole]  WITH CHECK ADD  CONSTRAINT [FK_HTRole_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[HTRole] ([Id])
GO
ALTER TABLE [dbo].[HTUserRole] CHECK CONSTRAINT [FK_HTRole_RoleId]
GO
ALTER TABLE [dbo].[HTUserRole]  WITH CHECK ADD  CONSTRAINT [FK_HTRole_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[HTUser] ([Id])
GO
ALTER TABLE [dbo].[HTUserRole] CHECK CONSTRAINT [FK_HTRole_UserId]
GO
