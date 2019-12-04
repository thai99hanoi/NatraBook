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
public class Sach {
   private String tenSach;
   private String tenTacGia;
   private String giaBia;
   private String ghiChu;
   private String anhSach;
   private  String tomtat;

    public Sach() {
    }

    
    
    public Sach(String tenSach, String tenTacGia, String giaBia, String ghiChu, String anhSach) {
        this.tenSach = tenSach;
        this.tenTacGia = tenTacGia;
        this.giaBia = giaBia;
        this.ghiChu = ghiChu;
        this.anhSach = anhSach;
    }

    public Sach(String tenSach, String tenTacGia, String giaBia, String ghiChu, String anhSach, String tomTat) {
        this.tenSach = tenSach;
        this.tenTacGia = tenTacGia;
        this.giaBia = giaBia;
        this.ghiChu = ghiChu;
        this.anhSach = anhSach;
        this.tomtat = tomTat;
    }

   

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public String getAnhSach() {
        return anhSach;
    }

    public void setAnhSach(String anhSach) {
        this.anhSach = anhSach;
    }


    public String getTenSach() {
        return tenSach;
    }

    public void setTenSach(String tenSach) {
        this.tenSach = tenSach;
    }

    public String getTenTacGia() {
        return tenTacGia;
    }

    public void setTenTacGia(String tenTacGia) {
        this.tenTacGia = tenTacGia;
    }

    public String getGiaBia() {
        return giaBia;
    }

    public void setGiaBia(String giaBia) {
        this.giaBia = giaBia;
    }

}
