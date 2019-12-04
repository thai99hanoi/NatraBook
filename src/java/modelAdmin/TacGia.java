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
public class TacGia {
    private int MaTacGia;
    private String TenTacGia;
    private String NgheNghiep;
    private String GhiChuTacGia;
    private String AnhTacGia;

    public TacGia() {
    }

    public TacGia(int MaTacGia, String TenTacGia, String NgheNghiep, String GhiChuTacGia, String AnhTacGia) {
        this.MaTacGia = MaTacGia;
        this.TenTacGia = TenTacGia;
        this.NgheNghiep = NgheNghiep;
        this.GhiChuTacGia = GhiChuTacGia;
        this.AnhTacGia = AnhTacGia;
    }

    public int getMaTacGia() {
        return MaTacGia;
    }

    public void setMaTacGia(int MaTacGia) {
        this.MaTacGia = MaTacGia;
    }

    public String getTenTacGia() {
        return TenTacGia;
    }

    public void setTenTacGia(String TenTacGia) {
        this.TenTacGia = TenTacGia;
    }

    public String getNgheNghiep() {
        return NgheNghiep;
    }

    public void setNgheNghiep(String NgheNghiep) {
        this.NgheNghiep = NgheNghiep;
    }

    public String getGhiChuTacGia() {
        return GhiChuTacGia;
    }

    public void setGhiChuTacGia(String GhiChuTacGia) {
        this.GhiChuTacGia = GhiChuTacGia;
    }

    public String getAnhTacGia() {
        return AnhTacGia;
    }

    public void setAnhTacGia(String AnhTacGia) {
        this.AnhTacGia = AnhTacGia;
    }
    
    
}
