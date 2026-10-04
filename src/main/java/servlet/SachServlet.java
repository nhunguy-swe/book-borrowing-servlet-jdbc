package servlet;

import dao.SachDAO;
import entity.Sach;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/danh-sach")
public class SachServlet extends HttpServlet {

    private SachDAO sachDAO = new SachDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Lấy danh sách từ DAO
        List<Sach> list = sachDAO.getAllSach();

        // Gửi danh sách sang JSP
        request.setAttribute("listSach", list);

        // Hiển thị danh sách
        request.getRequestDispatcher("danh-sach.jsp").forward(request, response);
    }
}
