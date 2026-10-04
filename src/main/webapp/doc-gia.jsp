<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Độc Giả - Thư viện Quy Nhơn</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, sans-serif;
        }

        body {
            background-color: #f8fafc;
            color: #334155;
            padding: 30px;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
        }

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
            background-color: #ec4899;
            border-radius: 2px;
        }

        .btn-add {
            display: inline-flex;
            align-items: center;
            padding: 10px 18px;
            background-color: #ec4899;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 500;
            font-size: 14px;
            transition: all 0.2s;
            box-shadow: 0 2px 4px rgba(236, 72, 153, 0.2);
        }

        .btn-add:hover {
            background-color: #db2777;
            transform: translateY(-1px);
        }

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

        tr:hover {
            background-color: #f8fafc;
        }

        .txt-code {
            font-family: monospace;
            font-weight: 600;
            color: #0f172a;
            background-color: #f1f5f9;
            padding: 4px 8px;
            border-radius: 4px;
        }

        .user-name {
            font-weight: 600;
            color: #0f172a;
        }

        .phone-style {
            font-family: monospace;
            color: #475569;
        }

        .action-edit {
            color: #ec4899;
            text-decoration: none;
            font-weight: 500;
            font-size: 14px;
        }

        .action-edit:hover {
            text-decoration: underline;
        }

        .empty-row {
            text-align: center;
            padding: 40px !important;
            color: #94a3b8;
            font-style: italic;
        }

        .btn-home {
            color: #64748b;
            text-decoration: none;
            font-size: 14px;
            display: inline-flex;
            align-items: center;
            margin-top: 20px;
        }

        .btn-home:hover {
            color: #ec4899;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header-section">
        <h2>Danh sách Độc Giả</h2>
        <a href="them-doc-gia" class="btn-add">
            <svg style="margin-right: 6px;" width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path></svg>
            Thêm độc giả mới
        </a>
    </div>

    <div class="table-responsive">
        <table>
            <thead>
            <tr>
                <th style="width: 120px;">Mã số</th>
                <th>Họ và Tên</th>
                <th>Số điện thoại</th>
                <th style="width: 120px; text-align: center;">Hành động</th>
            </tr>
            </thead>
            <tbody>
            <%-- Đọc list từ thuộc tính "listDocGia" của DocGiaServlet --%>
            <c:forEach items="${listDocGia}" var="dg">
                <tr>
                    <td><span class="txt-code">DG-${dg.maDocGia}</span></td>
                    <td><span class="user-name">${dg.tenDocGia}</span></td>
                    <td><span class="phone-style">${dg.sdtDocGia}</span></td>
                    <td style="text-align: center;">
                        <a href="sua-doc-gia?id=${dg.maDocGia}" class="action-edit">Sửa</a>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty listDocGia}">
                <tr>
                    <td colspan="4" class="empty-row">
                        Hệ thống chưa ghi nhận thành viên độc giả nào.
                    </td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>

    <a href="index.jsp" class="btn-home">← Quay lại Trang chủ</a>
</div>

</body>
</html>