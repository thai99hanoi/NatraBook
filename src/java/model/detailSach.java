/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author DATPT
 */
public class detailSach {

    private String tenSach;
    private String tenTacGia;
    private String giaBia;
    private String tenNXB;
    private int maSach;
    private Date namXB;
    private String maChiTiet;
    private int tongSoTrang;
    private double trongLuong;
    private String ngonNgu;
    private String ghiChu;
    private String anhSach;

    public detailSach() {
    }

    public detailSach(String tenSach, String tenTacGia, String giaBia, String tenNXB, int maSach, Date namXB, String maChiTiet, int tongSoTrang, double trongLuong, String ngonNgu, String ghiChu, String anhSach) {
        this.tenSach = tenSach;
        this.tenTacGia = tenTacGia;
        this.giaBia = giaBia;
        this.tenNXB = tenNXB;
        this.maSach = maSach;
        this.namXB = namXB;
        this.maChiTiet = maChiTiet;
        this.tongSoTrang = tongSoTrang;
        this.trongLuong = trongLuong;
        this.ngonNgu = ngonNgu;
        this.ghiChu = ghiChu;
        this.anhSach = anhSach;
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

    public String getTenNXB() {
        return tenNXB;
    }

    public void setTenNXB(String tenNXB) {
        this.tenNXB = tenNXB;
    }

    public int getMaSach() {
        return maSach;
    }

    public void setMaSach(int maSach) {
        this.maSach = maSach;
    }

    public Date getNamXB() {
        return namXB;
    }

    public void setNamXB(Date namXB) {
        this.namXB = namXB;
    }

    public String getMaChiTiet() {
        return maChiTiet;
    }

    public void setMaChiTiet(String maChiTiet) {
        this.maChiTiet = maChiTiet;
    }

    public int getTongSoTrang() {
        return tongSoTrang;
    }

    public void setTongSoTrang(int tongSoTrang) {
        this.tongSoTrang = tongSoTrang;
    }

    public double getTrongLuong() {
        return trongLuong;
    }

    public void setTrongLuong(double trongLuong) {
        this.trongLuong = trongLuong;
    }

    public String getNgonNgu() {
        return ngonNgu;
    }

    public void setNgonNgu(String ngonNgu) {
        this.ngonNgu = ngonNgu;
    }

}
