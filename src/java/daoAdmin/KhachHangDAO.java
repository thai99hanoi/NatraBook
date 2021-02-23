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
public class KhachHangDAO {

    public List<KhachHang> select() throws Exception {
        List<KhachHang> khachhang = new ArrayList<>();
        String sql = "select * from KhachHang";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int maKhachHang = rs.getInt("MaKhachHang");
            String hoTen = rs.getString("HoTen");
            String gioiTinh = rs.getString("GioiTinh");
            String email = rs.getString("Email");
            String diaChi = rs.getString("DiaChi");
            String sDT = rs.getString("SDT");
            String taiKhoan = rs.getString("TaiKhoan");
            String mK = rs.getString("MK");
            Date ngayDK = rs.getDate("NgayDK");
            khachhang.add(new KhachHang(maKhachHang, hoTen, gioiTinh, email, diaChi, sDT, taiKhoan, mK, ngayDK));
        }
        rs.close();
        conn.close();
        return khachhang;
    }

    public boolean update(KhachHang kh) {
        int check = 0;
        String sql = "UPDATE dbo.KhachHang Set HoTen=?,GioiTinh=?,Email=?, DiaChi=?,SDT=?,TaiKhoan=?, MK=?,NgayDK=? WHERE MaKhachHang =?";

        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setObject(1, kh.getHoTen());
            ps.setObject(2, kh.getGioiTinh());
            ps.setObject(3, kh.getEmail());
            ps.setObject(4, kh.getDiaChi());
            ps.setObject(5, kh.getsDT());
            ps.setObject(6, kh.getTaiKhoan());
            ps.setObject(7, kh.getmK());
            ps.setObject(8, kh.getNgayDK());
            ps.setObject(9, kh.getMaKhachHang());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception ex) {
            Logger.getLogger(KhachHangDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    public List<KhachHang> selectByMaKhachHang(int maKhachHang1) throws Exception {
        List<KhachHang> khachhang = new ArrayList<>();
        String sql = "select * from KHACHHANG where makhachhang=" + maKhachHang1;
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int maKhachHang = rs.getInt("MaKhachHang");
            String hoTen = rs.getString("HoTen");
            String gioiTinh = rs.getString("GioiTinh");
            String email = rs.getString("Email");
            String diaChi = rs.getString("DiaChi");
            String sDT = rs.getString("SDT");
            String taiKhoan = rs.getString("TaiKhoan");
            String mK = rs.getString("MK");
            Date ngayDK = rs.getDate("NgayDK");
            khachhang.add(new KhachHang(maKhachHang, hoTen, gioiTinh, email, diaChi, sDT, taiKhoan, mK, ngayDK));
        }
        rs.close();
        conn.close();
        return khachhang;
    }

    public void insert(KhachHang kh) throws Exception {
        String sql = "insert into KHACHHANG values (?,?,?,?,?,?,?,?,?,?) ";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, kh.getMaKhachHang());
        ps.setString(2, kh.getHoTen());
        ps.setString(3, kh.getGioiTinh());
        ps.setString(4, kh.getEmail());
        ps.setString(5, kh.getDiaChi());
        ps.setString(6, kh.getsDT());
        ps.setString(7, kh.getTaiKhoan());
        ps.setString(8, kh.getmK());
        ps.setDate(9, (java.sql.Date) kh.getNgayDK());
        ps.setString(10, kh.getImg());
        ps.execute();

        ps.close();
        conn.close();
    }
    
     public List<KhachHang> selectByUser(String user) throws Exception {
        List<KhachHang> khachhang = new ArrayList<>();
        String sql = "select * from KHACHHANG where TaiKhoan = N'"+user+"'" ;
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int maKhachHang = rs.getInt("MaKhachHang");
            String hoTen = rs.getString("HoTen");
            String gioiTinh = rs.getString("GioiTinh");
            String email = rs.getString("Email");
            String diaChi = rs.getString("DiaChi");
            String sDT = rs.getString("SDT");
            String taiKhoan = rs.getString("TaiKhoan");
            String mK = rs.getString("MK");
            Date ngayDK = rs.getDate("NgayDK");
            khachhang.add(new KhachHang(maKhachHang, hoTen, gioiTinh, email, diaChi, sDT, taiKhoan, mK, ngayDK));
        }
        rs.close();
        conn.close();
        return khachhang;
    }
     
     
     
     public boolean update1(KhachHang kh) {
        int check = 0;
        String sql = "UPDATE dbo.KhachHang Set MaKhachHang= ?HoTen=?,GioiTinh=?,Email=?, DiaChi=?,SDT=? WHERE TaiKhoan =?";

        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setObject(1, kh.getMaKhachHang());
            ps.setObject(2, kh.getHoTen());
            ps.setObject(3, kh.getGioiTinh());
            ps.setObject(4, kh.getEmail());
            ps.setObject(5, kh.getDiaChi());
            ps.setObject(6, kh.getsDT());
            ps.setObject(7, kh.getTaiKhoan());
           
            check = ps.executeUpdate();
             System.out.println(kh.getTaiKhoan());
            System.out.println(kh.getHoTen());
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception ex) {
            Logger.getLogger(KhachHangDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }
     
    public boolean Delete(int maKH) throws Exception {

        String query = "DELETE From DONHANG where MaKhachHang=?\n"
                +"DELETE From KHACHHANG where MaKhachHang=?\n";
        int check = 0;
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = (conn != null) ? conn.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setInt(1, maKH);
                ps.setInt(2, maKH);
                check = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(KhachHangDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }
}
