-- =========================================
-- TẠO DATABASE MỚI
-- =========================================
CREATE DATABASE DoAn1_12524062_LeThanhLam
GO

USE DoAn1_12524062_LeThanhLam
GO

-- =========================================
-- 1. TÀI KHOẢN
-- =========================================
CREATE TABLE TaiKhoan (
    Username NVARCHAR(50) PRIMARY KEY,
    Password NVARCHAR(100) NOT NULL,
    Role NVARCHAR(20) NOT NULL,
    HoTen NVARCHAR(100) NOT NULL DEFAULT N'Chưa cập nhật',

    CONSTRAINT CK_TaiKhoan_Role 
    CHECK (Role IN (N'Admin', N'NhanVien', N'DocGia'))
)

-- =========================================
-- 2. THẺ THƯ VIỆN (THAY ĐỘC GIẢ)
-- =========================================
CREATE TABLE TheThuVien (
    MaThe INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) UNIQUE,
    NgayDangKy DATE NOT NULL DEFAULT GETDATE(),
    NgayHetHan DATE NOT NULL,
    LoaiThe NVARCHAR(20) NOT NULL, -- Tháng / Năm
    PhiDangKy DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_The_TaiKhoan 
    FOREIGN KEY (Username) REFERENCES TaiKhoan(Username),

    CONSTRAINT CK_LoaiThe 
    CHECK (LoaiThe IN (N'Tháng', N'Năm')),

    CONSTRAINT CK_PhiDangKy 
    CHECK (PhiDangKy >= 0)
)

-- =========================================
-- 3. THỂ LOẠI
-- =========================================
CREATE TABLE TheLoai (
    MaTheLoai INT IDENTITY(1,1) PRIMARY KEY,
    TenTheLoai NVARCHAR(100) NOT NULL
)

-- =========================================
-- 4. SÁCH
-- =========================================
CREATE TABLE Sach (
    MaSach INT IDENTITY(1,1) PRIMARY KEY,
    TenSach NVARCHAR(200) NOT NULL,
    TacGia NVARCHAR(150),
    NhaXuatBan NVARCHAR(150),
    NamXuatBan INT,
    MaTheLoai INT,
    Gia DECIMAL(10,2) NOT NULL, -- QUAN TRỌNG
    SoLuong INT NOT NULL,
    ViTriKe NVARCHAR(20),

    CONSTRAINT FK_Sach_TheLoai 
    FOREIGN KEY (MaTheLoai) REFERENCES TheLoai(MaTheLoai),

    CONSTRAINT CK_SoLuong CHECK (SoLuong >= 0),
    CONSTRAINT CK_Gia CHECK (Gia >= 0)
)

-- INDEX tìm kiếm nhanh
CREATE INDEX IX_Sach_TenSach ON Sach(TenSach)
CREATE INDEX IX_Sach_TacGia ON Sach(TacGia)

-- =========================================
-- 5. PHIẾU MƯỢN
-- =========================================
CREATE TABLE PhieuMuon (
    MaPhieuMuon INT IDENTITY(1,1) PRIMARY KEY,
    MaThe INT NOT NULL,
    NgayMuon DATE NOT NULL DEFAULT GETDATE(),
    HanTra DATE NOT NULL, -- xử lý ở C#
    TrangThai NVARCHAR(50) NOT NULL DEFAULT N'Đang mượn',
    DatCoc DECIMAL(10,2) DEFAULT 0,
    Username NVARCHAR(50), -- nhân viên lập

    CONSTRAINT FK_PM_The 
    FOREIGN KEY (MaThe) REFERENCES TheThuVien(MaThe),

    CONSTRAINT FK_PM_TaiKhoan 
    FOREIGN KEY (Username) REFERENCES TaiKhoan(Username),

    CONSTRAINT CK_PM_TrangThai 
    CHECK (TrangThai IN (N'Đang mượn', N'Đã trả', N'Trả một phần')),

    CONSTRAINT CK_DatCoc CHECK (DatCoc >= 0)
)

-- =========================================
-- 6. CHI TIẾT PHIẾU MƯỢN
-- =========================================
CREATE TABLE ChiTietPhieuMuon (
    MaPhieuMuon INT,
    MaSach INT,
    SoLuongMuon INT NOT NULL,
    GiaTaiThoiDiemMuon DECIMAL(10,2) NOT NULL, -- tránh thay đổi giá

    PRIMARY KEY (MaPhieuMuon, MaSach),

    CONSTRAINT FK_CTPM_PM 
    FOREIGN KEY (MaPhieuMuon) REFERENCES PhieuMuon(MaPhieuMuon),

    CONSTRAINT FK_CTPM_Sach 
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach),

    CONSTRAINT CK_SLMuon 
    CHECK (SoLuongMuon > 0 AND SoLuongMuon <= 3),

    CONSTRAINT CK_GiaMuon CHECK (GiaTaiThoiDiemMuon >= 0)
)

-- =========================================
-- 7. PHIẾU TRẢ
-- =========================================
CREATE TABLE PhieuTra (
    MaPhieuTra INT IDENTITY(1,1) PRIMARY KEY,
    MaPhieuMuon INT NOT NULL,
    NgayTra DATE NOT NULL DEFAULT GETDATE(),
    Username NVARCHAR(50), -- nhân viên nhận

    CONSTRAINT FK_PT_PM 
    FOREIGN KEY (MaPhieuMuon) REFERENCES PhieuMuon(MaPhieuMuon),

    CONSTRAINT FK_PT_TaiKhoan 
    FOREIGN KEY (Username) REFERENCES TaiKhoan(Username)
)

-- =========================================
-- 8. CHI TIẾT PHIẾU TRẢ
-- =========================================
CREATE TABLE ChiTietPhieuTra (
    MaPhieuTra INT,
    MaSach INT,
    SoLuongTra INT NOT NULL,
    TinhTrang NVARCHAR(50) NOT NULL, -- Tốt / Hỏng / Mất
    PhiPhat DECIMAL(10,2) DEFAULT 0,
    TienDen DECIMAL(10,2) DEFAULT 0, -- nếu mất
    TienHoan DECIMAL(10,2), -- tiền trả lại khách

    PRIMARY KEY (MaPhieuTra, MaSach),

    CONSTRAINT FK_CTPT_PT 
    FOREIGN KEY (MaPhieuTra) REFERENCES PhieuTra(MaPhieuTra),

    CONSTRAINT FK_CTPT_Sach 
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach),

    CONSTRAINT CK_TinhTrang 
    CHECK (TinhTrang IN (N'Tốt', N'Hỏng', N'Mất')),

    CONSTRAINT CK_SoLuongTra CHECK (SoLuongTra > 0),
    CONSTRAINT CK_PhiPhat CHECK (PhiPhat >= 0),
    CONSTRAINT CK_TienDen CHECK (TienDen >= 0)
)

-- =========================================
-- 9. THANH TOÁN (OPTIONAL NHƯNG NÊN CÓ)
-- =========================================
CREATE TABLE ThanhToan (
    MaThanhToan INT IDENTITY(1,1) PRIMARY KEY,
    MaPhieuTra INT,
    SoTien DECIMAL(10,2) NOT NULL,
    NgayThanhToan DATE DEFAULT GETDATE(),

    CONSTRAINT FK_TT_PT 
    FOREIGN KEY (MaPhieuTra) REFERENCES PhieuTra(MaPhieuTra)
)

-- =========================================
-- 1. ĐẢM BẢO USERNAME KHÔNG NULL (QUAN TRỌNG)
-- =========================================
ALTER TABLE TheThuVien
ALTER COLUMN Username NVARCHAR(50) NOT NULL

ALTER TABLE PhieuMuon
ALTER COLUMN Username NVARCHAR(50) NOT NULL

ALTER TABLE PhieuTra
ALTER COLUMN Username NVARCHAR(50) NOT NULL


-- =========================================
-- 2. CHECK CHO TIỀN HOÀN (CHO PHÉP ÂM)
-- =========================================
ALTER TABLE ChiTietPhieuTra
ADD CONSTRAINT CK_TienHoan 
CHECK (TienHoan IS NULL OR TienHoan >= -100000000)


-- =========================================
-- 3. UNIQUE THỂ LOẠI (TRÁNH TRÙNG)
-- =========================================
ALTER TABLE TheLoai
ADD CONSTRAINT UQ_TenTheLoai UNIQUE (TenTheLoai)


-- =========================================
-- 4. (OPTIONAL NHƯNG NÊN CÓ) INDEX CHO MƯỢN/TRẢ
-- =========================================
CREATE INDEX IX_PhieuMuon_MaThe ON PhieuMuon(MaThe)
CREATE INDEX IX_PhieuTra_MaPhieuMuon ON PhieuTra(MaPhieuMuon)


-- =========================================
-- 5. (OPTIONAL) THÊM NGÀY TRẢ THỰC TẾ (DỄ TÍNH TOÁN)
-- =========================================
-- Nếu bạn chưa có thì thêm
IF COL_LENGTH('PhieuMuon', 'NgayTraThucTe') IS NULL
BEGIN
    ALTER TABLE PhieuMuon
    ADD NgayTraThucTe DATE NULL
END


-- =========================================
-- 6. (OPTIONAL NHƯNG RẤT NÊN) DEFAULT GIÁ SÁCH
-- =========================================
ALTER TABLE Sach
ADD CONSTRAINT DF_Gia DEFAULT 0 FOR Gia


-- =========================================
-- 7. (OPTIONAL) CHUẨN HÓA SỐ LƯỢNG
-- =========================================
ALTER TABLE Sach
ADD CONSTRAINT DF_SoLuong DEFAULT 0 FOR SoLuong

ALTER TABLE PhieuTra
ADD TrangThai NVARCHAR(50) DEFAULT N'Chưa thanh toán'


ALTER TABLE TheThuVien
ALTER COLUMN NgayDangKy DATETIME NULL;

ALTER TABLE TheThuVien
ALTER COLUMN NgayHetHan DATETIME NULL;

ALTER TABLE TheThuVien
ALTER COLUMN PhiDangKy DECIMAL(10,2) NULL;

ALTER TABLE TheThuVien
DROP CONSTRAINT DF__TheThuVie__NgayD__3C69FB99;

ALTER TABLE TheThuVien
ALTER COLUMN LoaiThe NVARCHAR(50) NULL

ALTER TABLE ChiTietPhieuMuon
ADD SoLuongMuonBanDau INT DEFAULT 0

UPDATE ChiTietPhieuMuon
SET SoLuongMuonBanDau = SoLuongMuon
ALTER TABLE ChiTietPhieuMuon
DROP CONSTRAINT CK_SLMuon
ALTER TABLE ChiTietPhieuMuon
ADD CONSTRAINT CK_SLMuon
CHECK (SoLuongMuon >= 0)
select * from ChiTietPhieuTra
ALTER TABLE ChiTietPhieuTra
DROP CONSTRAINT CK_TinhTrang
ALTER TABLE ChiTietPhieuTra
ADD CONSTRAINT CK_TinhTrang
CHECK
(
    TinhTrang IN
    (
        N'Tốt',
        N'Bình thường',
        N'Hỏng',
        N'Mất'
    )
)

ALTER TABLE TheThuVien
DROP CONSTRAINT CK_LoaiThe

SELECT *
FROM TheThuVien
ALTER TABLE TheThuVien
ADD CONSTRAINT CK_LoaiThe
CHECK (LoaiThe IN (N'Tháng', N'Năm'))
sp_help TheThuVien

INSERT INTO TheThuVien
(
    Username,
    LoaiThe
)
VALUES
(
    'khongbiet',
    N'Tháng'
)