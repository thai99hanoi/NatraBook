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
import modelAdmin.*;

/**
 *
 * @author dell
 */
public class ChiTietDonHangDAO {

    public List<ChiTietDonHang> select() throws Exception {
        List<ChiTietDonHang> chitietdonhang = new ArrayList<>();
        String sql = "select * from chitietdonhang";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int maSach = rs.getInt("MaSach");
            int maDonHang = rs.getInt("MaDonHang");
            int soLuong = rs.getInt("SoLuong");
            double donGia = rs.getDouble("DonGia");
            chitietdonhang.add(new ChiTietDonHang(maSach, maDonHang, soLuong, donGia));
        }
        rs.close();
        conn.close();
        return chitietdonhang;
    }

    public boolean update(ChiTietDonHang ctdh) {
        int check = 0;
        String sql = "UPDATE dbo.CHITIETDONHANG Set  MaDonHang=?,SoLuong=?,DonGia=?  WHERE MaSach =?";

        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setObject(1, ctdh.getMaDonHang());
            ps.setObject(2, ctdh.getSoLuong());
            ps.setObject(3, ctdh.getDonGia());
            ps.setObject(4, ctdh.getMaSach());
            
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception ex) {
            Logger.getLogger(ChiTietDonHangDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    public List<ChiTietDonHang> selectByMaSach(int maSach1) throws Exception {
        List<ChiTietDonHang> chitietdonhang = new ArrayList<>();
        String sql = "select * from CHITIETDONHANG where maSach=" + maSach1;
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int maSach = rs.getInt("MaSach");
            int maDonHang = rs.getInt("MaDonHang");
            int soLuong = rs.getInt("SoLuong");
            double donGia = rs.getDouble("DonGia");
            chitietdonhang.add(new ChiTietDonHang(maSach, maDonHang, soLuong, donGia));
        }
        rs.close();
        conn.close();
        return chitietdonhang;
    }

    public List<ChiTietDonHang> selectByMaDonHang(int maDonHang1) throws Exception {
        List<ChiTietDonHang> chitietdonhang = new ArrayList<>();
        String sql = "select * from CHITIETDONHANG where maDonHang= " + maDonHang1;
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int maSach = rs.getInt("MaSach");
            int maDonHang = rs.getInt("MaDonHang");
            int soLuong = rs.getInt("SoLuong");
            double donGia = rs.getDouble("DonGia");
            chitietdonhang.add(new ChiTietDonHang(maSach, maDonHang, soLuong, donGia));
        }
        rs.close();
        conn.close();
        return chitietdonhang;
    }

    public void insert(ChiTietDonHang ctdh) throws Exception {
        String sql = "insert into CHITIETDONHANG values (?,?,?,?) ";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, ctdh.getMaSach());
        ps.setInt(2, ctdh.getMaDonHang());
        ps.setInt(3, ctdh.getSoLuong());
        ps.setDouble(4, ctdh.getDonGia());
        ps.execute();

        ps.close();
        conn.close();
    }
}
