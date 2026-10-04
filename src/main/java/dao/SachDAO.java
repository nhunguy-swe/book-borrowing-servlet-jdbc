package dao;

import entity.Sach;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SachDAO {

    // Hàm lấy tất cả sách
    public List<Sach> getAllSach(){

        List<Sach> sachs = new ArrayList<Sach>();

        String sql = "SELECT * FROM sach";

        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Sach s = new Sach();

                s.setMaSach(rs.getInt("ma_sach"));
                s.setTenSach(rs.getString("ten_sach"));
                s.setTacGia(rs.getString("tac_gia"));

                sachs.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sachs;
    }

    // Hàm thêm sách mới vào cơ sở dữ liệu
    public boolean insertSach(Sach sach) {
        // Vì ma_sach tự tăng nên không cần chèn ma_sach vào câu lệnh INSERT
        String sql = "INSERT INTO sach (ten_sach, tac_gia) VALUES (?, ?)";

        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // Gán dữ liệu từ đối tượng Sach vào các dấu hỏi chấm (?)
            ps.setString(1, sach.getTenSach());
            ps.setString(2, sach.getTacGia());

            // Thực thi câu lệnh chèn dữ liệu
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu thêm thành công

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
