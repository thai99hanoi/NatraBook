/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelAdmin;

import java.util.Date;

/**
 *
 * @author dell
 */
public class KhachHang {

    private int maKhachHang;
    private String hoTen;
    private String gioiTinh;
    private String email;
    private String diaChi;
    private String sDT;
    private String taiKhoan;
    private String mK;
    private Date ngayDK;
    private String img;

    public KhachHang() {
    }

    public KhachHang(int maKhachHang, String hoTen, String gioiTinh, String email, String diaChi, String sDT, String taiKhoan, String mK, Date ngayDK) {
        this.maKhachHang = maKhachHang;
        this.hoTen = hoTen;
        this.gioiTinh = gioiTinh;
        this.email = email;
        this.diaChi = diaChi;
        this.sDT = sDT;
        this.taiKhoan = taiKhoan;
        this.mK = mK;
        this.ngayDK = ngayDK;
    }

    public KhachHang(int maKhachHang, String hoTen, String gioiTinh, String email, String diaChi, String sDT, String taiKhoan, String mK, Date ngayDK, String img) {
        this.maKhachHang = maKhachHang;
        this.hoTen = hoTen;
        this.gioiTinh = gioiTinh;
        this.email = email;
        this.diaChi = diaChi;
        this.sDT = sDT;
        this.taiKhoan = taiKhoan;
        this.mK = mK;
        this.ngayDK = ngayDK;
        this.img = img;
    }

     public KhachHang(int maKhachHang, String hoTen, String gioiTinh, String email, String diaChi, String sDT, String taiKhoan, String mK) {
        this.maKhachHang = maKhachHang;
        this.hoTen = hoTen;
        this.gioiTinh = gioiTinh;
        this.email = email;
        this.diaChi = diaChi;
        this.sDT = sDT;
        this.taiKhoan = taiKhoan;
        this.mK = mK;
       
    }
    public KhachHang( String hoTen, String gioiTinh, String email, String diaChi, String sDT, String taiKhoan, String mK, String img) {
        
        this.hoTen = hoTen;
        this.gioiTinh = gioiTinh;
        this.email = email;
        this.diaChi = diaChi;
        this.sDT = sDT;
        this.taiKhoan = taiKhoan;
        this.mK = mK;
        this.img = img;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public KhachHang(int maKhachHang,String hoTen, String gioiTinh, String email, String diaChi, String sDT, String taiKhoan) {
        
        this.maKhachHang = maKhachHang;
        this.hoTen = hoTen;
        this.gioiTinh = gioiTinh;
        this.email = email;
        this.diaChi = diaChi;
        this.sDT = sDT;
        this.taiKhoan = taiKhoan;
    }


    public int getMaKhachHang() {
        return maKhachHang;
    }

    public void setMaKhachHang(int maKhachHang) {
        this.maKhachHang = maKhachHang;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getsDT() {
        return sDT;
    }

    public void setsDT(String sDT) {
        this.sDT = sDT;
    }

    public String getTaiKhoan() {
        return taiKhoan;
    }

    public void setTaiKhoan(String taiKhoan) {
        this.taiKhoan = taiKhoan;
    }

    public String getmK() {
        return mK;
    }

    public void setmK(String mK) {
        this.mK = mK;
    }

    public Date getNgayDK() {
        return ngayDK;
    }

    public void setNgayDK(Date ngayDK) {
        this.ngayDK = ngayDK;
    }

}
