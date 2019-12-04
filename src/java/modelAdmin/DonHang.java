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
public class DonHang {

    private int maDonHang;
    private int maKhachHang;
    private Date thoiGianDat;
    private Date thoiGianGiao;
    private String diaChi;
    private String nguoiNhan;
    private String tinhTrang;
    private String ghiChu;

    public DonHang() {
    }

    public DonHang(int maDonHang, int maKhachHang, Date thoiGianDat, Date thoiGianGiao, String diaChi, String nguoiNhan, String tinhTrang, String ghiChu) {
        this.maDonHang = maDonHang;
        this.maKhachHang = maKhachHang;
        this.thoiGianDat = thoiGianDat;
        this.thoiGianGiao = thoiGianGiao;
        this.diaChi = diaChi;
        this.nguoiNhan = nguoiNhan;
        this.tinhTrang = tinhTrang;
        this.ghiChu = ghiChu;
    }
 public DonHang(int maDonHang, int maKhachHang, Date thoiGianGiao, String diaChi, String nguoiNhan, String tinhTrang, String ghiChu) {
        this.maDonHang = maDonHang;
        this.maKhachHang = maKhachHang;
        this.thoiGianGiao = thoiGianGiao;
        this.diaChi = diaChi;
        this.nguoiNhan = nguoiNhan;
        this.tinhTrang = tinhTrang;
        this.ghiChu = ghiChu;
    }
    public int getMaDonHang() {
        return maDonHang;
    }

    public void setMaDonHang(int maDonHang) {
        this.maDonHang = maDonHang;
    }

    public int getMaKhachHang() {
        return maKhachHang;
    }

    public void setMaKhachHang(int maKhachHang) {
        this.maKhachHang = maKhachHang;
    }

    public Date getThoiGianDat() {
        return thoiGianDat;
    }

    public void setThoiGianDat(Date thoiGianDat) {
        this.thoiGianDat = thoiGianDat;
    }

    public Date getThoiGianGiao() {
        return thoiGianGiao;
    }

    public void setThoiGianGiao(Date thoiGianGiao) {
        this.thoiGianGiao = thoiGianGiao;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getNguoiNhan() {
        return nguoiNhan;
    }

    public void setNguoiNhan(String nguoiNhan) {
        this.nguoiNhan = nguoiNhan;
    }

    public String getTinhTrang() {
        return tinhTrang;
    }

    public void setTinhTrang(String tinhTrang) {
        this.tinhTrang = tinhTrang;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

}
