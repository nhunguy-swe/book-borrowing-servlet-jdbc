package entity;

public class DocGia {
    private int maDocGia;
    private String tenDocGia;
    private String sdtDocGia;

    public DocGia() {}

    public DocGia(int maDocGia, String tenDocGia,  String sdtDocGia) {
        this.maDocGia = maDocGia;
        this.tenDocGia = tenDocGia;
        this.sdtDocGia = sdtDocGia;
    }

    public int getMaDocGia() {
        return maDocGia;
    }

    public void setMaDocGia(int maDocGia) {
        this.maDocGia = maDocGia;
    }

    public String getTenDocGia() {
        return tenDocGia;
    }

    public void setTenDocGia(String tenDocGia) {
        this.tenDocGia = tenDocGia;
    }

    public String getSdtDocGia() {
        return sdtDocGia;
    }

    public void setSdtDocGia(String sdtDocGia) {
        this.sdtDocGia = sdtDocGia;
    }

    @Override
    public String toString() {
        return "DocGia{" +
                "maDocGia=" + maDocGia +
                ", tenDocGia='" + tenDocGia + '\'' +
                ", sdtDocGia='" + sdtDocGia + '\'' +
                '}';
    }
}
