package dao;

import entity.PhieuMuon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PhieuMuonDAO {

    // Lấy toàn bộ danh sách
    public List<PhieuMuon> getAllPhieuMuon(){
        List<PhieuMuon> phieuMuons = new ArrayList<>();

        //
        String sql = "SELECT p.*, s.ten_sach, d.ho_ten FROM phieu_muon p JOIN sach s ON p.ma_sach = s.ma_sach JOIN doc_gia d ON p.ma_dg = d.ma_dg";

        // Sử dụng try để tự động kết nối (tránh treo server)
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                System.out.println("Đã tìm thấy phiếu: " + rs.getInt("ma_phieu"));
                PhieuMuon pm = new PhieuMuon();

                // Lấy dữ liệu từ bảng phieu_muon
                pm.setMaPhieuMuon(rs.getInt("ma_phieu"));
                pm.setMaSach(rs.getInt("ma_sach"));
                pm.setMaDocGia(rs.getInt("ma_dg"));
                pm.setNgayMuon(rs.getDate("ngay_muon"));
                pm.setTrangThai(rs.getString("trang_thai"));
                pm.setGhiChu(rs.getString("ghi_chu"));

                // Lấy dữ liệu JOIN từ bảng sach và bảng doc_gia
                pm.setTenDocGia(rs.getString("ho_ten"));
                pm.setTenSach(rs.getString("ten_sach"));

                phieuMuons.add(pm);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  phieuMuons;
    }

    // Thêm mới phiếu mượn
    public void insertPhieuMuon(PhieuMuon pm) {

        String sql = "INSERT INTO phieu_muon(ma_sach, ma_dg, ngay_muon, trang_thai, ghi_chu) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {

            // Truyền dữ liệu vào các dấu (?) theo đúng thứ tự
            ps.setInt(1, pm.getMaSach());
            ps.setInt(2, pm.getMaDocGia());
            ps.setDate(3, new java.sql.Date(pm.getNgayMuon().getTime()));
            ps.setString(4, pm.getTrangThai());
            ps.setString(5, pm.getGhiChu());

            // INSERT/UPDATE/DELETE dùng executeUpdate
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
