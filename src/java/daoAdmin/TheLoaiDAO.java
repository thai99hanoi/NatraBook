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
import modelAdmin.TheLoai;

/**
 *
 * @author Auriat
 */
public class TheLoaiDAO {

    public List<TheLoai> select() throws Exception {
        List<TheLoai> theloai = new ArrayList<>();
        String sql = "select * from TheLoai";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int MaLoaiSach = rs.getInt("MaLoaiSach");
            String TenLoaiSach = rs.getString("TenLoaiSach");
            theloai.add(new TheLoai(MaLoaiSach, TenLoaiSach));
        }
        rs.close();
        conn.close();
        return theloai;
    }

    public boolean update(TheLoai tl) {
        int check = 0;
        String sql = "UPDATE dbo.THELOAI Set TenLoaiSach=? WHERE MaLoaiSach =?";

        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setObject(1, tl.getTenLoaiSach());
            ps.setObject(2, tl.getMaLoaiSach());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception ex) {
            Logger.getLogger(TheLoaiDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    public List<TheLoai> selectByMaLoaiSach(int maLoaiSach1) throws Exception {
        List<TheLoai> tl = new ArrayList<>();
        String sql = "select * from THELOAI where maLoaiSach=" + maLoaiSach1;
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int MaLoaiSach = rs.getInt("MaLoaiSach");
            String TenLoaiSach = rs.getString("TenLoaiSach");
            tl.add(new TheLoai(MaLoaiSach, TenLoaiSach));

        }
        rs.close();
        conn.close();
        return tl;
    }

    public void insert(TheLoai tl) throws Exception {
        String sql = "insert into THELOAI values (?,?) ";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, tl.getMaLoaiSach());
        ps.setString(2, tl.getTenLoaiSach());

        ps.execute();

        ps.close();
        conn.close();
    }
}
