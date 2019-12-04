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
public class ChiTietDonHang {

    private int maSach;
    private int maDonHang;
    private int soLuong;
    private double donGia;

    public ChiTietDonHang() {
    }

    public ChiTietDonHang(int maSach, int maDonHang, int soLuong, double donGia) {
        this.maSach = maSach;
        this.maDonHang = maDonHang;
        this.soLuong = soLuong;
        this.donGia = donGia;
    }

    public int getMaSach() {
        return maSach;
    }

    public void setMaSach(int maSach) {
        this.maSach = maSach;
    }

    public int getMaDonHang() {
        return maDonHang;
    }

    public void setMaDonHang(int maDonHang) {
        this.maDonHang = maDonHang;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public double getDonGia() {
        return donGia;
    }

    public void setDonGia(double donGia) {
        this.donGia = donGia;
    }

}
