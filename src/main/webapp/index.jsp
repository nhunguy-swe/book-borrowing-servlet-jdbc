<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ Thống Quản Lý Thư Viện Quy Nhơn</title>
    <style>
        /* Thiết lập nền tảng */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', -apple-system, sans-serif;
        }

        body {
            background-color: #f1f5f9;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 20px;
        }

        /* Container chính */
        .main-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.04);
            text-align: center;
            max-width: 550px;
            width: 100%;
        }

        h1 {
            color: #1e293b;
            font-size: 26px;
            margin-bottom: 8px;
            font-weight: 700;
        }

        .subtitle {
            color: #64748b;
            font-size: 15px;
            margin-bottom: 35px;
        }

        /* Menu Container xếp dạng danh sách */
        .menu-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        /* Khối tính năng gom nhóm hành động */
        .menu-group {
            display: flex;
            gap: 10px;
            width: 100%;
        }

        /* Thẻ liên kết chính xem danh sách */
        .menu-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            text-decoration: none;
            padding: 16px 20px;
            border-radius: 10px;
            font-weight: 600;
            font-size: 16px;
            color: white;
            flex-grow: 1; /* Chiếm phần lớn không gian */
            transition: all 0.2s ease;
        }

        .menu-item:hover {
            transform: translateX(4px);
        }

        /* Nút hành động nhanh (Dấu cộng nhỏ bên cạnh) */
        .btn-quick-add {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 54px;
            height: 54px;
            text-decoration: none;
            color: white;
            font-size: 22px;
            font-weight: bold;
            border-radius: 10px;
            transition: all 0.2s ease;
        }

        .btn-quick-add:hover {
            transform: scale(1.05);
            filter: brightness(0.9);
        }

        /* Bảng màu đồng bộ theo danh mục */
        .bg-phieu { background-color: #2563eb; }
        .bg-phieu:hover { background-color: #1d4ed8; }

        .bg-sach { background-color: #0284c7; }
        .bg-sach:hover { background-color: #0369a1; }

        .bg-docgia { background-color: #ec4899; }
        .bg-docgia:hover { background-color: #db2777; }

        /* Chân trang */
        hr {
            border: 0;
            border-top: 1px solid #e2e8f0;
            margin: 35px auto 15px;
            width: 80%;
        }

        .footer-text {
            color: #94a3b8;
            font-size: 13px;
        }
    </style>
</head>
<body>

<div class="main-container">
    <h1>Quản Lý Thư Viện Quy Nhơn</h1>
    <p class="subtitle">Hệ thống trung tâm điều hành dữ liệu</p>

    <div class="menu-container">

        <div class="menu-group">
            <a href="phieu-muon" class="menu-item bg-phieu" title="Xem danh sách phiếu mượn">
                <span>📋 Quản lý Phiếu Mượn</span> ➔
            </a>
            <a href="them-phieu" class="btn-quick-add bg-phieu" title="Tạo phiếu mượn mới">+</a >
        </div>

        <div class="menu-group">
            <a href="danh-sach" class="menu-item bg-sach" title="Xem danh sách kho sách">
                <span>📚 Danh mục Sách kho</span> ➔
            </a>
            <a href="them-sach" class="btn-quick-add bg-sach" title="Thêm cuốn sách mới">+</a >
        </div>

        <div class="menu-group">
            <a href="doc-gia" class="menu-item bg-docgia" title="Xem danh sách độc giả">
                <span>👥 Danh sách Độc Giả</span> ➔
            </a>
            <a href="them-doc-gia" class="btn-quick-add bg-docgia" title="Đăng ký độc giả mới">+</a >
        </div>

    </div>

    <hr>
    <p class="footer-text">Hệ thống phát triển bởi Sinh viên IT - 2026</p>
</div>

</body>
</html>