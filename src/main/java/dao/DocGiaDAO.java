package dao;

import entity.DocGia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DocGiaDAO {

    // Lấy tất cả các danh sách độc giả
    // Mục đích: đổ vào dropdown <select> ở trang thêm phiếu mượn
    public List<DocGia> getAllDocGia() {
        List<DocGia> docGias = new ArrayList<>();

        String sql = "SELECT * FROM doc_gia";

        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                DocGia dg = new DocGia();

                dg.setMaDocGia(rs.getInt("ma_dg"));
                dg.setTenDocGia((rs.getString("ho_ten")));
                dg.setSdtDocGia(rs.getString("sdt"));

                docGias.add(dg);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return docGias;
    }

    // Hàm thêm độc giả mới vào cơ sở dữ liệu
    public boolean insertDocGia(DocGia docGia) {
        // Khớp chính xác với tên cột ho_ten và sdt trong DB của bạn
        String sql = "INSERT INTO doc_gia (ho_ten, sdt) VALUES (?, ?)";

        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // Gán dữ liệu từ đối tượng DocGia vào các dấu hỏi chấm (?)
            ps.setString(1, docGia.getTenDocGia());
            ps.setString(2, docGia.getSdtDocGia());

            // Thực thi câu lệnh chèn dữ liệu
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu thêm thành công

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
