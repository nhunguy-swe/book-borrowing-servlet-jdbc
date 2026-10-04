<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách Phiếu Mượn - Thư viện Quy Nhơn</title>
    <style>
        /* Reset & Base Styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            background-color: #f8fafc;
            color: #334155;
            padding: 30px;
        }

        /* Container chính */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -1px rgba(0, 0, 0, 0.03);
        }

        /* Header Layout */
        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            border-bottom: 2px solid #f1f5f9;
            padding-bottom: 20px;
        }

        h2 {
            color: #1e293b;
            font-size: 24px;
            font-weight: 600;
            position: relative;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: -22px;
            left: 0;
            width: 50px;
            height: 4px;
            background-color: #2563eb; /* Đồng bộ tông màu xanh của index */
            border-radius: 2px;
        }

        /* Nút thêm mới */
        .btn-add {
            display: inline-flex;
            align-items: center;
            padding: 10px 18px;
            background-color: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 500;
            font-size: 14px;
            transition: all 0.2s ease;
            box-shadow: 0 2px 4px rgba(37, 99, 235, 0.2);
        }

        .btn-add:hover {
            background-color: #1d4ed8;
            transform: translateY(-1px);
            box-shadow: 0 4px 6px rgba(37, 99, 235, 0.3);
        }

        /* Thiết kế Bảng */
        .table-responsive {
            width: 100%;
            overflow-x: auto;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            background-color: white;
            text-align: left;
            font-size: 15px;
        }

        th {
            background-color: #f8fafc;
            color: #64748b;
            font-weight: 600;
            padding: 16px;
            text-transform: uppercase;
            font-size: 12px;
            letter-spacing: 0.5px;
            border-bottom: 2px solid #e2e8f0;
        }

        td {
            padding: 16px;
            border-bottom: 1px solid #e2e8f0;
            color: #334155;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:hover {
            background-color: #f8fafc;
        }

        /* Cột Mã phiếu nổi bật nhẹ */
        .txt-code {
            font-family: monospace;
            font-weight: 600;
            color: #0f172a;
            background-color: #f1f5f9;
            padding: 4px 8px;
            border-radius: 4px;
        }

        /* Định dạng Badge Trạng thái */
        .badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 50px;
            font-size: 13px;
            font-weight: 500;
            text-align: center;
        }

        /* Trạng thái mặc định / Đang mượn */
        .badge-warning {
            background-color: #fef3c7;
            color: #d97706;
        }

        /* Trạng thái Đã trả */
        .badge-success {
            background-color: #dcfce7;
            color: #15803d;
        }

        /* Cột hành động sửa/xóa */
        .action-links a {
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            margin-right: 10px;
        }
        .action-edit { color: #2563eb; }
        .action-edit:hover { text-decoration: underline; }

        /* Trạng thái trống */
        .empty-row {
            text-align: center;
            padding: 40px !important;
            color: #94a3b8;
            font-style: italic;
        }

        /* Nút quay lại hệ thống */
        .btn-home {
            color: #64748b;
            text-decoration: none;
            font-size: 14px;
            display: inline-flex;
            align-items: center;
            margin-top: 20px;
            transition: color 0.2s;
        }
        .btn-home:hover {
            color: #2563eb;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header-section">
        <h2>Quản lý mượn sách - Thư viện Quy Nhơn</h2>
        <a href="them-phieu" class="btn-add">
            <svg style="margin-right: 6px;" width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path></svg>
            Thêm phiếu mượn mới
        </a>
    </div>

    <div class="table-responsive">
        <table>
            <thead>
            <tr>
                <th style="width: 120px;">Mã phiếu</th>
                <th>Tên Sách</th>
                <th>Người mượn</th>
                <th style="width: 140px;">Ngày mượn</th>
                <th style="width: 150px;">Trạng thái</th>
                <th>Ghi chú</th>
                <th style="width: 100px; text-align: center;">Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listPhieuMuon}" var="pm">
                <tr>
                    <td><span class="txt-code">PM-${pm.maPhieuMuon}</span></td>
                    <td style="font-weight: 500; color: #0f172a;">${pm.tenSach}</td>
                    <td>${pm.tenDocGia}</td>
                    <td>${pm.ngayMuon}</td>
                    <td>
                            <%-- Logic tự động đổi màu Badge đồng bộ --%>
                        <c:choose>
                            <c:when test="${pm.trangThai eq 'Đã trả' || pm.trangThai eq 'Đã trả sách'}">
                                <span class="badge badge-success">${pm.trangThai}</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge badge-warning">${pm.trangThai}</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td style="color: #64748b; font-size: 14px;">${pm.ghiChu}</td>
                    <td style="text-align: center;" class="action-links">
                        <a href="sua-phieu?id=${pm.maPhieuMuon}" class="action-edit">Sửa</a>
                    </td>
                </tr>
            </c:forEach>

            <%-- Hiển thị thông báo nếu danh sách trống --%>
            <c:if test="${empty listPhieuMuon}">
                <tr>
                    <td colspan="7" class="empty-row">
                        <img src="data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='48' height='48' fill='none' stroke='%2394a3b8' stroke-width='1.5' viewBox='0 0 24 24'><path stroke-linecap='round' stroke-linejoin='round' d='M12 6.042A8.967 8.967 0 006 3.75c-1.052 0-2.062.18-3 .512v14.25A8.987 8.987 0 016 18c2.305 0 4.408.867 6 2.292m0-14.25a8.966 8.966 0 016-2.292c1.052 0 2.062.18 3 .512v14.25A8.987 8.987 0 0018 18a8.967 8.967 0 00-6 2.292m0-14.25v14.25'/></svg>" style="display:block; margin: 0 auto 10px auto; opacity: 0.6;" alt="Empty">
                        Hiện chưa có phiếu mượn nào trong hệ thống.
                    </td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>

    <%-- Nút điều hướng đồng bộ với cấu trúc trang Sách và Độc Giả --%>
    <a href="index.jsp" class="btn-home">← Quay lại Trang chủ</a>
</div>

</body>
</html>