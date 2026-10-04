<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh mục Sách - Thư viện Quy Nhơn</title>
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
            background-color: #0284c7;
            border-radius: 2px;
        }

        .btn-add {
            display: inline-flex;
            align-items: center;
            padding: 10px 18px;
            background-color: #0284c7;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 500;
            font-size: 14px;
            transition: all 0.2s;
        }

        .btn-add:hover {
            background-color: #0369a1;
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

        .book-title {
            font-weight: 600;
            color: #0f172a;
        }

        .action-edit {
            color: #0284c7;
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
            color: #0284c7;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header-section">
        <h2>Danh mục Sách kho</h2>
        <a href="them-sach" class="btn-add">
            <svg style="margin-right: 6px;" width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path></svg>
            Thêm cuốn sách mới
        </a>
    </div>

    <div class="table-responsive">
        <table>
            <thead>
            <tr>
                <th style="width: 120px;">Mã sách</th>
                <th>Tên đầu sách</th>
                <th>Tác giả</th>
                <th style="width: 120px; text-align: center;">Hành động</th>
            </tr>
            </thead>
            <tbody>
            <%-- Đọc list từ thuộc tính "listSach" của SachServlet --%>
            <c:forEach items="${listSach}" var="s">
                <tr>
                    <td><span class="txt-code">BK-${s.maSach}</span></td>
                    <td><span class="book-title">${s.tenSach}</span></td>
                    <td>${s.tacGia}</td>
                    <td style="text-align: center;">
                        <a href="sua-sach?id=${s.maSach}" class="action-edit">Sửa</a>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty listSach}">
                <tr>
                    <td colspan="4" class="empty-row">
                        Hiện chưa có cuốn sách nào trong kho dữ liệu.
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