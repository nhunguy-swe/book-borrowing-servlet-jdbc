package servlet;

import dao.DocGiaDAO;
import entity.DocGia;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/them-doc-gia")
public class ThemDocGiaServlet extends HttpServlet {

    private DocGiaDAO docGiaDAO = new DocGiaDAO();

    // Hiển thị form thêm độc giả khi click
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/them-doc-gia.jsp").forward(request, response);
    }

    // Xử lý lưu trữ khi bấm submit
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String tenDocGia = request.getParameter("txtTenDocGia");
        String sdtDocGia = request.getParameter("txtSdtDocGia");

        DocGia docGiaMoi = new DocGia(0, tenDocGia, sdtDocGia);

        // Gọi DAO để thực thi câu lệnh SQL INSERT INTO độc giả
        // Lưu ý: Bạn cần chắc chắn trong DocGiaDAO đã viết hàm insertDocGia(docGiaMoi) hoặc tương đương nhé
        docGiaDAO.insertDocGia(docGiaMoi);

        // Quay về danh sách độc giả thông qua servlet
        response.sendRedirect("doc-gia");
    }
}