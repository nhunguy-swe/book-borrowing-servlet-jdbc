<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm phiếu mượn mới - Thư viện Quy Nhơn</title>
    <style>
        /* Toàn bộ thiết lập nền tảng */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            background-color: #f8fafc; /* Màu nền xám nhạt dịu mắt */
            color: #334155;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 20px;
        }

        /* Khung Form trung tâm */
        .form-container {
            width: 100%;
            max-width: 450px;
            background-color: #ffffff;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05), 0 8px 10px -6px rgba(0, 0, 0, 0.05);
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

        /* Group các ô nhập liệu */
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

        /* Định dạng Input và Select đồng bộ */
        select, input[type="date"] {
            width: 100%;
            padding: 11px 14px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 15px;
            color: #334155;
            background-color: #fff;
            outline: none;
            transition: all 0.2s ease-in-out;
            appearance: none; /* Xóa style mặc định của trình duyệt */
            -webkit-appearance: none;
        }

        /* Tạo mũi tên tùy chỉnh cho thẻ select */
        .select-wrapper {
            position: relative;
        }

        .select-wrapper::after {
            content: '▾';
            font-size: 12px;
            color: #64748b;
            position: absolute;
            right: 14px;
            top: 50%;
            transform: translateY(-50%);
            pointer-events: none;
        }

        /* Hiệu ứng khi người dùng click vào ô nhập dữ liệu */
        select:focus, input[type="date"]:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.15);
        }

        /* Nút Xác nhận mượn */
        .btn-submit {
            background-color: #10b981; /* Màu xanh lá hiện đại */
            color: white;
            border: none;
            padding: 12px 15px;
            cursor: pointer;
            width: 100%;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            margin-top: 10px;
            transition: all 0.2s ease;
            box-shadow: 0 4px 6px -1px rgba(16, 185, 129, 0.2);
        }

        .btn-submit:hover {
            background-color: #059669;
            transform: translateY(-1px);
            box-shadow: 0 6px 12px -2px rgba(16, 185, 129, 0.3);
        }

        /* Nút Quay lại */
        .btn-back {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 16px;
            color: #64748b;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: color 0.2s ease;
        }

        .btn-back:hover {
            color: #3b82f6;
        }

        .btn-back svg {
            margin-right: 4px;
            transition: transform 0.2s ease;
        }

        .btn-back:hover svg {
            transform: translateX(-3px); /* Hiệu ứng mũi tên dịch trái nhẹ khi hover */
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Tạo Phiếu Mượn</h2>
    <p class="form-desc">Vui lòng điền đầy đủ thông tin để cấp phiếu mới</p>

    <form action="them-phieu" method="post">

        <div class="form-group">
            <label>Chọn Sách:</label>
            <div class="select-wrapper">
                <select name="maSach" required>
                    <option value="">-- Chọn cuốn sách --</option>
                    <c:forEach items="${listSach}" var="s">
                        <option value="${s.maSach}">${s.tenSach} (${s.tacGia})</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label>Độc Giả:</label>
            <div class="select-wrapper">
                <select name="maDocGia" required>
                    <option value="">-- Chọn người mượn --</option>
                    <c:forEach items="${listDocGia}" var="dg">
                        <option value="${dg.maDocGia}">${dg.tenDocGia}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label>Ngày Mượn:</label>
            <input type="date" name="ngayMuon" required>
        </div>

        <button type="submit" class="btn-submit">Xác Nhận Mượn</button>

        <a href="phieu-muon" class="btn-back">
            <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
            </svg>
            Quay lại danh sách
        </a>
    </form>
</div>

</body>
</html>