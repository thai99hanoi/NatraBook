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
 * @author Auriat
 */
public class ChiTietSachDAO {

    public List<ChiTietSach> select() throws Exception {
        List<ChiTietSach> chitietsach = new ArrayList<>();
        String sql = "select * from ChiTietSach";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            String MaChiTietSach = rs.getString("MaChiTietSach");
            int MaSach = rs.getInt("MaSach");
            String MaNgonNgu = rs.getString("MaNgonNgu");
            int TongSoTrang = rs.getInt("TongSoTrang");
            double TrongLuong = rs.getDouble("TrongLuong");
            String KichThuoc = rs.getString("KichThuoc");
            Date NamXuatBan = rs.getDate("NamXuatBan");
            chitietsach.add(new ChiTietSach(MaChiTietSach, MaSach, MaNgonNgu, TongSoTrang, TrongLuong, KichThuoc, NamXuatBan));
        }
        rs.close();
        conn.close();
        return chitietsach;
    }

    public boolean update(ChiTietSach cts) {
        int check = 0;
        String sql = "UPDATE dbo.CHITIETSACH Set MaSach=?,MaNgonNgu=?,TongSoTrang=?, TrongLuong=?,KichThuoc=?,NamXuatBan=? WHERE MaChiTietSach =?";

        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setObject(1, cts.getMaSach());
            ps.setObject(2, cts.getMaNgonNgu());
            ps.setObject(3, cts.getTongSoTrang());
            ps.setObject(4, cts.getTrongLuong());
            ps.setObject(5, cts.getKichThuoc());
            ps.setObject(6, cts.getNamXuatBan());
            ps.setObject(7, cts.getMaChiTietSach());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception ex) {
            Logger.getLogger(ChiTietSachDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    public List<ChiTietSach> selectByMaChiTietSach(String maChiTietSach1) throws Exception {
        List<ChiTietSach> ctsach = new ArrayList<>();
        String sql = "select * from CHITIETSACH where maChiTietSach= N'" + maChiTietSach1 + "'";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            String MaChiTietSach = rs.getString("MaChiTietSach");
            int MaSach = rs.getInt("MaSach");
            String MaNgonNgu = rs.getString("MaNgonNgu");
            int TongSoTrang = rs.getInt("TongSoTrang");
            double TrongLuong = rs.getDouble("TrongLuong");
            String KichThuoc = rs.getString("KichThuoc");
            Date NamXuatBan = rs.getDate("NamXuatBan");
            ctsach.add(new ChiTietSach(MaChiTietSach, MaSach, MaNgonNgu, TongSoTrang, TrongLuong, KichThuoc, NamXuatBan));
        }
        rs.close();
        conn.close();
        return ctsach;
    }

    public void insert(ChiTietSach cts) throws Exception {
        String sql = "insert into CHITIETSACH values (?,?,?,?,?,?,?) ";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, cts.getMaChiTietSach());
        ps.setInt(2, cts.getMaSach());
        ps.setString(3, cts.getMaNgonNgu());
        ps.setInt(4, cts.getTongSoTrang());
        ps.setDouble(5, cts.getTrongLuong());
        ps.setString(6, cts.getKichThuoc());
        ps.setDate(7, (java.sql.Date) cts.getNamXuatBan());

        ps.execute();

        ps.close();
        conn.close();
    }
}
