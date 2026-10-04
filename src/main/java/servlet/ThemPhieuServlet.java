package servlet;

import dao.DocGiaDAO;
import dao.PhieuMuonDAO;
import dao.SachDAO;
import entity.PhieuMuon;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/them-phieu")
public class ThemPhieuServlet extends HttpServlet {

    private SachDAO sachDAO = new SachDAO();
    private PhieuMuonDAO phieuMuonDAO = new PhieuMuonDAO();
    private DocGiaDAO docGiaDAO = new DocGiaDAO();

    // Hiện FORM: đổ dữ liệu vào Dropdown
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Lấy danh sách Sách và độc giả để người dùng chọn
        request.setAttribute("listSach", sachDAO.getAllSach());
        request.setAttribute("listPhieuMuon", phieuMuonDAO.getAllPhieuMuon());
        request.setAttribute("listDocGia", docGiaDAO.getAllDocGia());

        request.getRequestDispatcher("them-phieu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Để không lỗi tiếng Việt
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Nhận dữ liệu từ các ô input (theo thuộc tính 'name' trong JSP)
        int maSach = Integer.parseInt(request.getParameter("maSach"));
        int maDocGia = Integer.parseInt(request.getParameter("maDocGia"));
        Date ngayMuon = Date.valueOf(request.getParameter("ngayMuon"));
        String trangThai = "Đang mượn"; // mặc định khi mới mượn
        String ghiChu = request.getParameter("ghiChu");

        // Đóng gói vào entity
        PhieuMuon pm =  new PhieuMuon();
        pm.setMaSach(maSach);
        pm.setMaDocGia(maDocGia);
        pm.setNgayMuon(ngayMuon);
        pm.setTrangThai(trangThai);
        pm.setGhiChu(ghiChu);

        // Gọi DAO để INSERT vào Database
        phieuMuonDAO.insertPhieuMuon(pm);

        // QUAN TRỌNG: Dùng Redirect để quay lại trang danh sách
        response.sendRedirect("phieu-muon");
    }
}