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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelAdmin.SachAdmin;

/**
 *
 * @author DATPT
 */
public class SachAdminDAO {

    public List<SachAdmin> select() throws Exception {
        List<SachAdmin> s = new ArrayList<>();
        String sql = "select * from Sach";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int maSach = rs.getInt("MaSach");
            String tenSach = rs.getString("TenSach");
            int maLoaiSach = rs.getInt("MaLoaiSach");
            int maNxb = rs.getInt("MaNXB");
            double giaNhap = rs.getDouble("GiaNhap");
            double giaBia = rs.getDouble("GiaBia");
            int soLuong = rs.getInt("SoLuong");
            String ghiChu = rs.getString("GhiChuSach");
            String anhSach = rs.getString("AnhSach");
            String tomTat = rs.getString("TomTat");
            s.add(new SachAdmin(maSach, tenSach, maLoaiSach, maNxb, giaNhap, giaBia, soLuong, ghiChu, anhSach, tomTat));
        }
        rs.close();
        conn.close();
        return s;

    }

    public boolean update(SachAdmin s) {
        int check = 0;
        String sql = "UPDATE dbo.SACH Set TenSach=?,MaLoaiSach=?,MaNXB=?, GiaNhap=?,GiaBia=?,SoLuong=?, GhiChuSach=?,AnhSach=?, TomTat=? WHERE MaSach =?";

        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setObject(1, s.getTenSach());
            ps.setObject(2, s.getMaLoaiSach());
            ps.setObject(3, s.getMaNxb());
            ps.setObject(4, s.getGiaNhap());
            ps.setObject(5, s.getGiaBia());
            ps.setObject(6, s.getSoLuong());
            ps.setObject(7, s.getGhiChuSach());
            ps.setObject(8, s.getAnhSach());
            ps.setObject(9, s.getTomTat());
            ps.setObject(10, s.getMaSach());

            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception ex) {
            Logger.getLogger(SachAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    public boolean update1(SachAdmin s) {
        int check = 0;
        String sql = "UPDATE dbo.SACH Set MaSach=?,MaLoaiSach=?,MaNXB=?, GiaNhap=?,GiaBia=?,SoLuong=?, GhiChuSach=?,AnhSach=?,TomTat=? WHERE TenSach =?";

        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setObject(1, s.getMaSach());
            ps.setObject(2, s.getMaLoaiSach());
            ps.setObject(3, s.getMaNxb());
            ps.setObject(4, s.getGiaNhap());
            ps.setObject(5, s.getGiaBia());
            ps.setObject(6, s.getSoLuong() - 1);
            ps.setObject(7, s.getGhiChuSach());
            ps.setObject(8, s.getAnhSach());
            ps.setObject(9, s.getTomTat());
            ps.setObject(10, s.getTenSach());

            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception ex) {
            Logger.getLogger(SachAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    public List<SachAdmin> selectByMaSach(int maSach1) throws Exception {
        List<SachAdmin> sa = new ArrayList<>();
        String sql = "select * from SACH where maSach=" + maSach1;
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int maSach = rs.getInt("MaSach");
            String tenSach = rs.getString("TenSach");
            int maLoaiSach = rs.getInt("MaLoaiSach");
            int maNxb = rs.getInt("MaNXB");
            double giaNhap = rs.getDouble("GiaNhap");
            double giaBia = rs.getDouble("GiaBia");
            int soLuong = rs.getInt("SoLuong");
            String ghiChu = rs.getString("GhiChuSach");
            String anhSach = rs.getString("AnhSach");
            String tomTat = rs.getString("TomTat");
            sa.add(new SachAdmin(maSach, tenSach, maLoaiSach, maNxb, giaNhap, giaBia, soLuong, ghiChu, anhSach, tomTat));
        }
        rs.close();
        conn.close();
        return sa;
    }

    public void insert(SachAdmin sa) throws Exception {
        String sql = "insert into SACH values (?,?,?,?,?,?,?,?,?,?) ";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, sa.getMaSach());
        ps.setString(2, sa.getTenSach());
        ps.setInt(3, sa.getMaLoaiSach());
        ps.setInt(4, sa.getMaNxb());
        ps.setDouble(5, sa.getGiaNhap());
        ps.setDouble(6, sa.getGiaBia());
        ps.setInt(7, sa.getSoLuong());
        ps.setString(8, sa.getGhiChuSach());
        ps.setString(9, sa.getAnhSach());
        ps.setString(10, sa.getTomTat());
        ps.execute();

        ps.close();
        conn.close();
    }

    public boolean Delete(int maSach) throws Exception {

        String query = "DELETE From CHITIETSACH where MaSach=?\n"
                + "DELETE From CHITIETDONHANG where MaSach=?\n"
                + "DELETE From SACHvaTACGIA where MaSach=?\n"
                + "DELETE From Sach where MaSach=? ";

        int check = 0;
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = (conn != null) ? conn.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setInt(1, maSach);
                ps.setInt(2, maSach);
                ps.setInt(3, maSach);
                ps.setInt(4, maSach);
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SachAdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    public List<SachAdmin> selectDonHang(String tenSach1) throws Exception {
        List<SachAdmin> s = new ArrayList<>();
        String sql = "select * from Sach where tenSach = N'" + tenSach1 + "'";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int maSach = rs.getInt("MaSach");
            String tenSach = rs.getString("TenSach");
            int maLoaiSach = rs.getInt("MaLoaiSach");
            int maNxb = rs.getInt("MaNXB");
            double giaNhap = rs.getDouble("GiaNhap");
            double giaBia = rs.getDouble("GiaBia");
            int soLuong = rs.getInt("SoLuong");
            String ghiChu = rs.getString("GhiChuSach");
            String anhSach = rs.getString("AnhSach");
            String tomTat = rs.getString("TomTat");
            s.add(new SachAdmin(maSach, tenSach, maLoaiSach, maNxb, giaNhap, giaBia, soLuong, ghiChu, anhSach, tomTat));
        }
        rs.close();
        conn.close();
        return s;
    }
}
