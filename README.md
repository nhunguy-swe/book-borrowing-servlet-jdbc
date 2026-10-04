# HỆ THỐNG QUẢN LÝ MƯỢN SÁCH (Book Borrowing Management)

<p>
  <img src="https://img.shields.io/badge/Java-Servlet%20%2B%20JDBC-orange" alt="Java Servlet + JDBC">
  <img src="https://img.shields.io/badge/MySQL-Database-4479A1" alt="MySQL">
  <img src="https://img.shields.io/badge/Build-Maven-blue" alt="Maven">
</p>

Ứng dụng web quản lý mượn sách, xây dựng bằng **Java Servlet thuần kết hợp JDBC** (không dùng Spring/Hibernate), theo mô hình **DAO (Data Access Object)**.

---

## Giới thiệu (About)

Hệ thống cho phép quản lý 3 nghiệp vụ chính: **Độc giả**, **Sách**, và **Phiếu mượn** — trong đó mỗi phiếu mượn ghi nhận độc giả nào mượn sách nào, ngày mượn, trạng thái và ghi chú. Dự án thực hành trực tiếp JDBC (không qua ORM) để hiểu rõ cách thao tác SQL, JOIN dữ liệu và xử lý kết nối cơ sở dữ liệu trong Java web application cổ điển (Servlet).

---

## Công nghệ sử dụng

| Thành phần | Công nghệ |
|---|---|
| Backend | Java Servlet |
| Data Access | JDBC thuần (PreparedStatement, DAO pattern) |
| Database | MySQL |
| Build tool | Maven |

---

## Thiết kế cơ sở dữ liệu

### Bảng `doc_gia`

| Cột      | Mô tả         |
|----------|---------------|
| ma_dg    | Mã độc giả (PK) |
| ho_ten   | Họ tên          |
| sdt      | Số điện thoại    |

### Bảng `sach`

| Cột      | Mô tả      |
|----------|------------|
| ma_sach  | Mã sách (PK) |
| ten_sach | Tên sách      |
| tac_gia  | Tác giả        |

### Bảng `phieu_muon`

| Cột        | Mô tả                      |
|------------|-----------------------------|
| ma_phieu   | Mã phiếu mượn (PK)          |
| ma_sach    | FK → `sach.ma_sach`          |
| ma_dg      | FK → `doc_gia.ma_dg`          |
| ngay_muon  | Ngày mượn                      |
| trang_thai | Trạng thái phiếu mượn            |
| ghi_chu    | Ghi chú                           |

### Truy vấn JOIN (lấy danh sách phiếu mượn kèm tên sách & độc giả)

```sql
SELECT p.*, s.ten_sach, d.ho_ten
FROM phieu_muon p
JOIN sach s ON p.ma_sach = s.ma_sach
JOIN doc_gia d ON p.ma_dg = d.ma_dg;
```

---

## Cấu trúc dự án

```
book-borrowing-servlet-jdbc/
├── .github/                 # Cấu hình GitHub (workflow/CI nếu có)
├── .idea/                     # Cấu hình IntelliJ IDEA
├── .mvn/
├── src/main/
│   ├── java/
│   │   ├── dao/                # Tầng truy xuất dữ liệu (JDBC)
│   │   │   ├── DBUtils.java       # Quản lý kết nối database
│   │   │   ├── DocGiaDAO.java      # CRUD độc giả
│   │   │   ├── PhieuMuonDAO.java    # CRUD phiếu mượn (có JOIN)
│   │   │   └── SachDAO.java          # CRUD sách
│   │   ├── entity/              # Các lớp POJO
│   │   │   ├── DocGia.java
│   │   │   ├── PhieuMuon.java
│   │   │   └── Sach.java
│   │   └── servlet/             # Các Servlet xử lý request
│   │       ├── DocGiaServlet.java
│   │       ├── PhieuMuonServlet.java
│   │       ├── SachServlet.java
│   │       ├── ThemDocGiaServlet.java   # Servlet thêm độc giả mới
│   │       ├── ThemPhieuServlet.java     # Servlet thêm phiếu mượn mới
│   │       └── ThemSachServlet.java       # Servlet thêm sách mới
│   ├── resources/
│   └── webapp/                    # Giao diện JSP/HTML
├── target/
├── .gitignore
└── pom.xml
```

---

## Chức năng chính

- Hiển thị danh sách Độc giả, Sách, Phiếu mượn
- Thêm mới Độc giả (`ThemDocGiaServlet`)
- Thêm mới Sách (`ThemSachServlet`)
- Lập Phiếu mượn mới, tự JOIN hiển thị tên sách + tên độc giả (`ThemPhieuServlet`)

> Ghi chú: danh sách trên dựa theo các DAO/Servlet hiện có. Nếu có thêm chức năng sửa/xóa/tìm kiếm, bạn bổ sung vào đây.

---

## Bắt đầu (Getting Started)

### Yêu cầu

- JDK 17+
- MySQL
- Apache Tomcat (để chạy Servlet/JSP)
- IDE: IntelliJ IDEA / Eclipse

### Cài đặt

```bash
git clone https://github.com/nhunguy-swe/book-borrowing-servlet-jdbc.git
cd book-borrowing-servlet-jdbc
```

### Cấu hình Database

1. Tạo database MySQL với 3 bảng `doc_gia`, `sach`, `phieu_muon` theo thiết kế ở trên.
2. Cập nhật thông tin kết nối trong `src/main/java/dao/DBUtils.java`.

> ⚠️ **Lưu ý bảo mật:** không hard-code mật khẩu database thật trực tiếp trong `DBUtils.java` nếu repo là public — dùng file cấu hình riêng (`.properties`) đã thêm vào `.gitignore`.

### Chạy ứng dụng

```bash
mvn clean package
```

Deploy file `.war` sinh ra trong `target/` lên **Apache Tomcat**, truy cập qua trình duyệt theo context path của ứng dụng.

---

## Tác giả

- GitHub: [@nhunguy-swe](https://github.com/nhunguy-swe)

---

## Giấy phép

Dự án này được thực hiện cho mục đích học tập cá nhân.
