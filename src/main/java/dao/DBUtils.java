package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtils {
    public static Connection getConnection() throws Exception {
        // Khai báo driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Đường dẫn DB
        String url = "jdbc:mysql://localhost:3306/quan_ly_muon_sach";
        String user = "root";
        String password = "";

        return DriverManager.getConnection(url, user, password);
    }
}