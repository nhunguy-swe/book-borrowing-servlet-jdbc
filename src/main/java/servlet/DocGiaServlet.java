package servlet;

import dao.DocGiaDAO;
import entity.DocGia;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/doc-gia")
public class DocGiaServlet extends HttpServlet {

    private DocGiaDAO docGiaDAO = new DocGiaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Lấy danh sách độc giả từ DAO
        List<DocGia> list = docGiaDAO.getAllDocGia();

        // Đóng gói gửi đi
        request.setAttribute("listDocGia", list);

        // Forward sang trang JSP
        request.getRequestDispatcher("doc-gia.jsp").forward(request, response);
    }
}
