package servlet;

import dao.PhieuMuonDAO;
import entity.PhieuMuon;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/phieu-muon")
public class PhieuMuonServlet extends HttpServlet {

    private PhieuMuonDAO phieuMuonDAO = new PhieuMuonDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Gọi DAO lấy danh sách
        List<PhieuMuon> list = phieuMuonDAO.getAllPhieuMuon();

        // Đóng gói dữ liệu vào request
        request.setAttribute("listPhieuMuon", list);

        // Chuyển hướng sang trang hiển thị (JSP)
        request.getRequestDispatcher("danh-sach-phieu-muon.jsp").forward(request, response);
    }
}
