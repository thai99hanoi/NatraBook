/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoAdmin;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelAdmin.*;

/**
 *
 * @author dell
 */
 public class DonHangDAO {

    public List<DonHang> select() throws Exception {
        List<DonHang> donhang = new ArrayList<>();
        String sql = "select * from DonHang";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int maDonHang = rs.getInt("MaDonHang");
            int maKhachHang = rs.getInt("MaKhachHang");
            Date thoiGianDat = rs.getDate("ThoiGianDat");
            Date thoiGianGiao = rs.getDate("ThoiGianGiao");
            String diaChi = rs.getString("DiaChi");
            String nguoiNhan = rs.getString("NguoiNhan");
            String tinhTrang = rs.getString("TinhTrang");
            String ghiChu = rs.getString("GhiChu");
            donhang.add(new DonHang(maDonHang, maKhachHang, thoiGianDat, thoiGianGiao, diaChi, nguoiNhan, tinhTrang, ghiChu));
        }
        rs.close();
        conn.close();
        return donhang;
    }

    public boolean update(DonHang dh) {
        int check = 0;
        String sql = "UPDATE dbo.DONHANG Set MaKhachHang=?,ThoiGianDat=?,ThoiGianGiao=?, DiaChi=?,NguoiNhan=?,TinhTrang=?, GhiChu=? WHERE MaDonHang =?";

        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setObject(1, dh.getMaKhachHang());
            ps.setObject(2, dh.getThoiGianDat());
            ps.setObject(3, dh.getThoiGianGiao());
            ps.setObject(4, dh.getDiaChi());
            ps.setObject(5, dh.getNguoiNhan());
            ps.setObject(6, dh.getTinhTrang());
            ps.setObject(7, dh.getGhiChu());
            ps.setObject(8, dh.getMaDonHang());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception ex) {
            Logger.getLogger(DonHangDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    public List<DonHang> selectByMaDonHang(int maDonHang1) throws Exception {
        List<DonHang> dh = new ArrayList<>();
        String sql = "select * from DONHANG where maDonHang=" + maDonHang1;
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int maDonHang = rs.getInt("MaDonHang");
            int maKhachHang = rs.getInt("MaKhachHang");
            Date thoiGianDat = rs.getDate("ThoiGianDat");
            Date thoiGianGiao = rs.getDate("ThoiGianGiao");
            String diaChi = rs.getString("DiaChi");
            String nguoiNhan = rs.getString("NguoiNhan");
            String tinhTrang = rs.getString("TinhTrang");
            String ghiChu = rs.getString("GhiChu");
            dh.add(new DonHang(maDonHang, maKhachHang, thoiGianDat, thoiGianGiao, diaChi, nguoiNhan, tinhTrang, ghiChu));
        }
        rs.close();
        conn.close();
        return dh;
    }
    public List<DonHang> selectByMaKhachHang(int maKhachHang1) throws Exception {
        List<DonHang> dh = new ArrayList<>();
        String sql = "select * from DONHANG where maKhachHang=" + maKhachHang1;
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int maDonHang = rs.getInt("MaDonHang");
            int maKhachHang = rs.getInt("MaKhachHang");
            Date thoiGianDat = rs.getDate("ThoiGianDat");
            Date thoiGianGiao = rs.getDate("ThoiGianGiao");
            String diaChi = rs.getString("DiaChi");
            String nguoiNhan = rs.getString("NguoiNhan");
            String tinhTrang = rs.getString("TinhTrang");
            String ghiChu = rs.getString("GhiChu");
            dh.add(new DonHang(maDonHang, maKhachHang, thoiGianDat, thoiGianGiao, diaChi, nguoiNhan, tinhTrang, ghiChu));
        }
        rs.close();
        conn.close();
        return dh;
    }

    public void insert(DonHang dh) throws Exception {
        String sql = "insert into DONHANG values (?,?,?,?,?,?,?,?) ";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, dh.getMaDonHang());
        ps.setInt(2, dh.getMaKhachHang());
        ps.setDate(3, (java.sql.Date) dh.getThoiGianDat());
        ps.setDate(4, (java.sql.Date) dh.getThoiGianGiao());
        ps.setString(5, dh.getDiaChi());
        ps.setString(6, dh.getNguoiNhan());
        ps.setString(7, dh.getTinhTrang());
        ps.setString(8, dh.getGhiChu());
        ps.execute();

        ps.close();
        conn.close();
    }
//     public static void main(String[] args) throws Exception {
//         int maDH= 29;
//         int maKH = 4001;
//         Date tgDat = null;
//         Date tgGiao =null;
//         String diaChi = "Ha Bang";
//         String nguoiNhan= "Dat";
//         String tinhTrang="Chua Giao";
//         String ghiChu=null;
//         DonHang dh = new DonHang(maDH, maKH, tgDat, tgGiao, diaChi, nguoiNhan, tinhTrang, ghiChu);
//         DonHangDAO dhDAO = new DonHangDAO();
//         dhDAO.insert(dh);
//     }
//    
    public void insert1(DonHang dh) throws Exception {
        String sql = "insert into DONHANG values (?,?,getDate(),?,?,?,?,?) ";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, dh.getMaDonHang());
        ps.setInt(2, dh.getMaKhachHang());
        ps.setDate(3, (java.sql.Date) dh.getThoiGianGiao());
        ps.setString(4, dh.getDiaChi());
        ps.setString(5, dh.getNguoiNhan());
        ps.setString(6, dh.getTinhTrang());
        ps.setString(7, dh.getGhiChu());
        ps.execute();

        ps.close();
        conn.close();
    }
}
