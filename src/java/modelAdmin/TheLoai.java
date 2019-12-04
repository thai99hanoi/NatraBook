/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelAdmin;

/**
 *
 * @author Auriat
 */
public class TheLoai {
    private int MaLoaiSach;
    private String TenLoaiSach;

    public TheLoai(int MaLoaiSach, String TenLoaiSach) {
        this.MaLoaiSach = MaLoaiSach;
        this.TenLoaiSach = TenLoaiSach;
    }

    public TheLoai() {
    }

    public int getMaLoaiSach() {
        return MaLoaiSach;
    }

    public void setMaLoaiSach(int MaLoaiSach) {
        this.MaLoaiSach = MaLoaiSach;
    }

    public String getTenLoaiSach() {
        return TenLoaiSach;
    }

    public void setTenLoaiSach(String TenLoaiSach) {
        this.TenLoaiSach = TenLoaiSach;
    }
    
    
}
