/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelAdmin;

/**
 *
 * @author dell
 */
public class NXB {

    private int maNXB;
    private String tenNXB;
    private String diaChi;
    private String email;
    private String sDT;

    public NXB() {
    }

    public NXB(int maNXB, String tenNXB, String diaChi, String email, String sDT) {
        this.maNXB = maNXB;
        this.tenNXB = tenNXB;
        this.diaChi = diaChi;
        this.email = email;
        this.sDT = sDT;
    }

    public int getMaNXB() {
        return maNXB;
    }

    public void setMaNXB(int maNXB) {
        this.maNXB = maNXB;
    }

    public String getTenNXB() {
        return tenNXB;
    }

    public void setTenNXB(String tenNXB) {
        this.tenNXB = tenNXB;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getsDT() {
        return sDT;
    }

    public void setsDT(String sDT) {
        this.sDT = sDT;
    }

}
