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
 * @author Auriat
 */
public class SachVaTacGiaDAO {

    public List<SachVaTacGia> select() throws Exception {
        List<SachVaTacGia> sachvatacgia = new ArrayList<>();
        String sql = "select * from SachVaTacGia";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int MaSach = rs.getInt("MaSach");
            int MaTacGia = rs.getInt("MaTacGia");
            sachvatacgia.add(new SachVaTacGia(MaSach, MaTacGia));
        }
        rs.close();
        conn.close();
        return sachvatacgia;
    }

    public boolean update(SachVaTacGia svtg) {
        int check = 0;
        String sql = "UPDATE dbo.SACHvaTACGIA Set MaTacGia=? WHERE MaSach =?";

        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setObject(1, svtg.getMaTacGia());
            ps.setObject(2, svtg.getMaSach());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception ex) {
            Logger.getLogger(SachVaTacGiaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    public List<SachVaTacGia> selectByMaSach(int maSach1) throws Exception {
        List<SachVaTacGia> svtg = new ArrayList<>();
        String sql = "select * from SACHvaTACGIA where maSach=" + maSach1;
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int MaSach = rs.getInt("MaSach");
            int MaTacGia = rs.getInt("MaTacGia");
            svtg.add(new SachVaTacGia(MaSach, MaTacGia));
        }
        rs.close();
        conn.close();
        return svtg;
    }

    public void insert(SachVaTacGia svtg) throws Exception {
        String sql = "insert into SACHvaTACGIA values (?,?) ";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, svtg.getMaSach());
        ps.setInt(2, svtg.getMaTacGia());

        ps.execute();

        ps.close();
        conn.close();
    }
}
