/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author dell
 */
public class Cart {
    private String tenSach;
    private String anhSach;
    private double giaBia;
    private int maSach;
    private int maDonhang;

    public Cart() {
    }

    public Cart(String tenSach, String anhSach, double giaBia, int maSach) {
        this.tenSach = tenSach;
        this.anhSach = anhSach;
        this.giaBia = giaBia;
        this.maSach = maSach;
        
    }
    
    public Cart(String tenSach, String anhSach, double giaBia, int maSach,int maDonHang) {
        this.tenSach = tenSach;
        this.anhSach = anhSach;
        this.giaBia = giaBia;
        this.maSach = maSach;
        this.maDonhang = maDonHang;
        
    }

    public String getTenSach() {
        return tenSach;
    }

    public void setTenSach(String tenSach) {
        this.tenSach = tenSach;
    }

    public String getAnhSach() {
        return anhSach;
    }

    public void setAnhSach(String anhSach) {
        this.anhSach = anhSach;
    }

    public double getGiaBia() {
        return giaBia;
    }

    public void setGiaBia(double giaBia) {
        this.giaBia = giaBia;
    }
    
}
