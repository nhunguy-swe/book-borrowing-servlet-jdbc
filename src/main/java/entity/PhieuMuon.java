package entity;

import java.sql.Date;

public class PhieuMuon {
    private int maPhieuMuon;
    private int maSach;
    private int maDocGia;
    private Date ngayMuon;
    private String trangThai;

    private String ghiChu;

    private String tenSach;
    private String tenDocGia;

    public PhieuMuon() {}

    public PhieuMuon(int maPhieuMuon) {
        this.maPhieuMuon = maPhieuMuon;
    }

    public int getMaPhieuMuon() {
        return maPhieuMuon;
    }

    public void setMaPhieuMuon(int maPhieuMuon) {
        this.maPhieuMuon = maPhieuMuon;
    }

    public int getMaSach() {
        return maSach;
    }

    public void setMaSach(int maSach) {
        this.maSach = maSach;
    }

    public int getMaDocGia() {
        return maDocGia;
    }

    public void setMaDocGia(int maDocGia) {
        this.maDocGia = maDocGia;
    }

    public Date getNgayMuon() {
        return ngayMuon;
    }

    public void setNgayMuon(Date ngayMuon) {
        this.ngayMuon = ngayMuon;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public String getTenSach() {
        return tenSach;
    }

    public void setTenSach(String tenSach) {
        this.tenSach = tenSach;
    }

    public String getTenDocGia() {
        return tenDocGia;
    }

    public void setTenDocGia(String tenDocGia) {
        this.tenDocGia = tenDocGia;
    }

    @Override
    public String toString() {
        return "PhieuMuon{" +
                "maPhieuMuon=" + maPhieuMuon +
                ", maSach=" + maSach +
                ", maDocGia=" + maDocGia +
                ", ngayMuon=" + ngayMuon +
                ", trangThai='" + trangThai + '\'' +
                ", ghiChu='" + ghiChu + '\'' +
                ", tenSach='" + tenSach + '\'' +
                ", tenDocGia='" + tenDocGia + '\'' +
                '}';
    }
}
