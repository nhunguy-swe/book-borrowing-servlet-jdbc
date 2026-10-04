<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký Độc Giả - Thư viện Quy Nhơn</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', -apple-system, sans-serif;
        }

        body {
            background-color: #f8fafc;
            color: #334155;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 20px;
        }

        .form-container {
            width: 100%;
            max-width: 450px;
            background-color: #ffffff;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
        }

        h2 {
            color: #1e293b;
            font-size: 24px;
            font-weight: 600;
            text-align: center;
            margin-bottom: 8px;
        }

        .form-desc {
            color: #64748b;
            font-size: 14px;
            text-align: center;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 500;
            font-size: 14px;
            color: #475569;
        }

        input[type="text"],
        input[type="tel"] {
            width: 100%;
            padding: 11px 14px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 15px;
            color: #334155;
            outline: none;
            transition: all 0.2s;
        }

        input[type="text"]:focus,
        input[type="tel"]:focus {
            border-color: #ec4899;
            box-shadow: 0 0 0 3px rgba(236, 72, 147, 0.15);
        }

        .btn-submit {
            background-color: #ec4899;
            color: white;
            border: none;
            padding: 12px 15px;
            cursor: pointer;
            width: 100%;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            margin-top: 10px;
            transition: all 0.2s;
            box-shadow: 0 4px 6px rgba(236, 72, 153, 0.15);
        }

        .btn-submit:hover {
            background-color: #db2777;
            transform: translateY(-1px);
        }

        .btn-back {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 16px;
            color: #64748b;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
        }

        .btn-back:hover {
            color: #ec4899;
        }

        .btn-back svg {
            margin-right: 4px;
            transition: transform 0.2s;
        }

        .btn-back:hover svg {
            transform: translateX(-3px);
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Thêm Độc Giả Mới</h2>
    <p class="form-desc">Đăng ký thông tin thẻ thành viên thư viện mới</p>

    <form action="them-doc-gia" method="post">
        <div class="form-group">
            <label>Họ và Tên độc giả:</label>
            <input type="text" name="txtTenDocGia" placeholder="Ví dụ: Nguyễn Thị B" required>
        </div>

        <div class="form-group">
            <label>Số điện thoại:</label>
            <input type="tel" name="txtSdtDocGia" placeholder="Ví dụ: 0912345678" pattern="[0-9]{10,11}" title="Vui lòng nhập số điện thoại hợp lệ tự 10 đến 11 số" required>
        </div>

        <button type="submit" class="btn-submit">Đăng Ký Thẻ</button>

        <a href="doc-gia" class="btn-back">
            <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>
            Quay lại danh sách độc giả
        </a>
    </form>
</div>

</body>
</html>