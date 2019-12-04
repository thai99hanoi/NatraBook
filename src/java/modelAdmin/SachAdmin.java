/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelAdmin;

/**
 *
 * @author DATPT
 */
public class SachAdmin {
    private int maSach;
    private String tenSach;
    private int maLoaiSach;
    private int maNxb;
    private double giaNhap;
    private double giaBia;
    private int soLuong;
    private String ghiChuSach;
    private String anhSach;
    private String tomTat;

    public SachAdmin() {
    }

    public SachAdmin(int maSach, String tenSach, int maLoaiSach, int maNxb, double giaNhap, double giaBia, int soLuong, String ghiChuSach, String anhSach, String tomTat) {
        this.maSach = maSach;
        this.tenSach = tenSach;
        this.maLoaiSach = maLoaiSach;
        this.maNxb = maNxb;
        this.giaNhap = giaNhap;
        this.giaBia = giaBia;
        this.soLuong = soLuong;
        this.ghiChuSach = ghiChuSach;
        this.anhSach = anhSach;
        this.tomTat = tomTat;
    }

   public SachAdmin(int maSach, String tenSach, int maLoaiSach, int maNxb, double giaNhap, double giaBia, int soLuong, String ghiChuSach, String anhSach) {
        this.maSach = maSach;
        this.tenSach = tenSach;
        this.maLoaiSach = maLoaiSach;
        this.maNxb = maNxb;
        this.giaNhap = giaNhap;
        this.giaBia = giaBia;
        this.soLuong = soLuong;
        this.ghiChuSach = ghiChuSach;
        this.anhSach = anhSach;
        
    }

    public int getMaSach() {
        return maSach;
    }

    public void setMaSach(int maSach) {
        this.maSach = maSach;
    }

    public String getTenSach() {
        return tenSach;
    }

    public void setTenSach(String tenSach) {
        this.tenSach = tenSach;
    }

    public int getMaLoaiSach() {
        return maLoaiSach;
    }

    public void setMaLoaiSach(int maLoaiSach) {
        this.maLoaiSach = maLoaiSach;
    }

    public int getMaNxb() {
        return maNxb;
    }

    public void setMaNxb(int maNxb) {
        this.maNxb = maNxb;
    }

    public double getGiaNhap() {
        return giaNhap;
    }

    public void setGiaNhap(double giaNhap) {
        this.giaNhap = giaNhap;
    }

    public double getGiaBia() {
        return giaBia;
    }

    public void setGiaBia(double giaBia) {
        this.giaBia = giaBia;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getGhiChuSach() {
        return ghiChuSach;
    }

    public void setGhiChuSach(String ghiChuSach) {
        this.ghiChuSach = ghiChuSach;
    }

    public String getAnhSach() {
        return anhSach;
    }

    public void setAnhSach(String anhSach) {
        this.anhSach = anhSach;
    }

    public String getTomTat() {
        return tomTat;
    }

    public void setTomTat(String tomTat) {
        this.tomTat = tomTat;
    }
    
}
