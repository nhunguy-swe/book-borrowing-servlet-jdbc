package servlet;

import dao.SachDAO;
import entity.Sach;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/them-sach")
public class ThemSachServlet extends HttpServlet {

    private SachDAO sachDAO = new SachDAO();

    // Khi người dùng bấm nút chuyển trang, hiển thị giao diện nhập liệu
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/them-sach.jsp").forward(request, response);
    }

    // Khi người dùng nhấn nút "Lưu Vào Kho" gửi dữ liệu lên
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // Đảm bảo không bị lỗi font Tiếng Việt

        // Đọc dữ liệu gửi từ thẻ input dựa theo thuộc tính name="..."
        String tenSach = request.getParameter("txtTenSach");
        String tacGia = request.getParameter("txtTacGia");

        // Tạo đối tượng sách mới (maSach để là 0 vì DB tự sinh tăng dần)
        Sach sachMoi = new Sach(0, tenSach, tacGia);

        // Gọi DAO để thực thi câu lệnh SQL INSERT INTO
        // Lưu ý: Bạn cần chắc chắn trong SachDAO đã viết hàm insertSach(sachMoi) hoặc tương đương nhé
        sachDAO.insertSach(sachMoi);

        // Thêm thành công thì điều hướng trình duyệt quay lại trang danh sách sách thông qua Servlet
        response.sendRedirect("danh-sach");
    }
}