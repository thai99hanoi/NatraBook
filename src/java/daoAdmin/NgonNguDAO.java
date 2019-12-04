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
public class NgonNguDAO {

    public List<NgonNgu> select() throws Exception {
        List<NgonNgu> ngonngu = new ArrayList<>();
        String sql = "select * from NgonNgu";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            String MaNgonNgu = rs.getString("MaNgonNgu");
            String TenNgonNgu = rs.getString("TenNgonNgu");

            ngonngu.add(new NgonNgu(MaNgonNgu, TenNgonNgu));
        }
        rs.close();
        conn.close();
        return ngonngu;
    }

    public boolean update(NgonNgu nn) {
        int check = 0;
        String sql = "UPDATE dbo.NGONNGU Set TenNgonNgu=? WHERE MaNgonNgu =?";

        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setObject(1, nn.getTenNgonNgu());
            ps.setObject(2, nn.getMaNgonNgu());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception ex) {
            Logger.getLogger(NgonNguDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    public List<NgonNgu> selectByMaNgonNgu(String maNgonNgu1) throws Exception {
        List<NgonNgu> nn = new ArrayList<>();
        String sql = "select * from NGONNGU where maNgonNgu=N'" + maNgonNgu1 + "'";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            String MaNgonNgu = rs.getString("MaNgonNgu");
            String TenNgonNgu = rs.getString("TenNgonNgu");

            nn.add(new NgonNgu(MaNgonNgu, TenNgonNgu));
        }
        rs.close();
        conn.close();
        return nn;
    }

    public void insert(NgonNgu nn) throws Exception {
        String sql = "insert into NGONNGU values (?,?) ";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, nn.getMaNgonNgu());
        ps.setString(2, nn.getTenNgonNgu());
        ps.execute();

        ps.close();
        conn.close();
    }
}
