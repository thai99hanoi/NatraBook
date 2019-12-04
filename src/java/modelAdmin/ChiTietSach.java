/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelAdmin;

import java.util.Date;



/**
 *
 * @author Auriat
 */
public class ChiTietSach {
    private String MaChiTietSach;
    private int MaSach;
    private String MaNgonNgu;
    private int TongSoTrang;
    private double TrongLuong;
    private String KichThuoc;
    private Date NamXuatBan;

    public ChiTietSach() {
    }

    public ChiTietSach(String MaChiTietSach, int MaSach, String MaNgonNgu, int TongSoTrang, double TrongLuong, String KichThuoc, Date NamXuatBan) {
        this.MaChiTietSach = MaChiTietSach;
        this.MaSach = MaSach;
        this.MaNgonNgu = MaNgonNgu;
        this.TongSoTrang = TongSoTrang;
        this.TrongLuong = TrongLuong;
        this.KichThuoc = KichThuoc;
        this.NamXuatBan = NamXuatBan;
    }   

    public String getMaChiTietSach() {
        return MaChiTietSach;
    }

    public void setMaChiTietSach(String MaChiTietSach) {
        this.MaChiTietSach = MaChiTietSach;
    }

    public int getMaSach() {
        return MaSach;
    }

    public void setMaSach(int MaSach) {
        this.MaSach = MaSach;
    }

    public String getMaNgonNgu() {
        return MaNgonNgu;
    }

    public void setMaNgonNgu(String MaNgonNgu) {
        this.MaNgonNgu = MaNgonNgu;
    }

    public int getTongSoTrang() {
        return TongSoTrang;
    }

    public void setTongSoTrang(int TongSoTrang) {
        this.TongSoTrang = TongSoTrang;
    }

    public double getTrongLuong() {
        return TrongLuong;
    }

    public void setTrongLuong(double TrongLuong) {
        this.TrongLuong = TrongLuong;
    }

    public String getKichThuoc() {
        return KichThuoc;
    }

    public void setKichThuoc(String KichThuoc) {
        this.KichThuoc = KichThuoc;
    }

    public Date getNamXuatBan() {
        return NamXuatBan;
    }

    public void setNamXuatBan(Date NamXuatBan) {
        this.NamXuatBan = NamXuatBan;
    }
    
    
}
