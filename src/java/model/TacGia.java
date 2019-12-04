/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author DATPT
 */
public class TacGia {
    private String tenTacGia;
    private String anhTacGia;
    private String ghiChuTG;
    private String NgheNghiep;
    private String tomTat;
    

    public TacGia() {
    }

    public TacGia(String tenTacGia, String anhTacGia, String ghiChuTG, String NgheNghiep, String tomTat) {
        this.tenTacGia = tenTacGia;
        this.anhTacGia = anhTacGia;
        this.ghiChuTG = ghiChuTG;
        this.NgheNghiep = NgheNghiep;
        this.tomTat = tomTat;
    }


    
    public String getTenTacGia() {
        return tenTacGia;
    }

    public void setTenTacGia(String tenTacGia) {
        this.tenTacGia = tenTacGia;
    }

    public String getAnhTacGia() {
        return anhTacGia;
    }

    public void setAnhTacGia(String anhTacGia) {
        this.anhTacGia = anhTacGia;
    }

    public String getGhiChuTG() {
        return ghiChuTG;
    }

    public void setGhiChuTG(String ghiChuTG) {
        this.ghiChuTG = ghiChuTG;
    }

    public String getNgheNghiep() {
        return NgheNghiep;
    }

    public void setNgheNghiep(String NgheNghiep) {
        this.NgheNghiep = NgheNghiep;
    }

    public String getTomTat() {
        return tomTat;
    }

    public void setTomTat(String tomTat) {
        this.tomTat = tomTat;
    }

     
    
}