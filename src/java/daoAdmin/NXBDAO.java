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
public class NXBDAO {

    public List<NXB> select() throws Exception {
        List<NXB> nxb = new ArrayList<>();
        String sql = "select * from NXB";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int maNXB = rs.getInt("MaNXB");
            String tenNXB = rs.getString("TenNXB");
            String diaChi = rs.getString("DiaChi");
            String email = rs.getString("Email");
            String sDT = rs.getString("SDT");
            nxb.add(new NXB(maNXB, tenNXB, diaChi, email, sDT));
        }
        rs.close();
        conn.close();
        return nxb;
    }

    public boolean update(NXB n) {
        int check = 0;
        String sql = "UPDATE dbo.NXB Set TenNXB=?,DiaChi=?,Email=?, SDT=? WHERE MaNXB =?";

        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setObject(1, n.getTenNXB());
            ps.setObject(2, n.getDiaChi());
            ps.setObject(3, n.getEmail());
            ps.setObject(4, n.getsDT());
            ps.setObject(5, n.getMaNXB());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception ex) {
            Logger.getLogger(NXBDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    public List<NXB> selectByMaNXB(int maNXB1) throws Exception {
        List<NXB> nxb = new ArrayList<>();
        String sql = "select * from NXB where maNXB=" + maNXB1;
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int maNXB = rs.getInt("MaNXB");
            String tenNXB = rs.getString("TenNXB");
            String diaChi = rs.getString("DiaChi");
            String email = rs.getString("Email");
            String sDT = rs.getString("SDT");
            nxb.add(new NXB(maNXB, tenNXB, diaChi, email, sDT));
        }
        rs.close();
        conn.close();
        return nxb;
    }

    public void insert(NXB nxb) throws Exception {
        String sql = "insert into NXB values (?,?,?,?,?) ";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, nxb.getMaNXB());
        ps.setString(2, nxb.getTenNXB());
        ps.setString(3, nxb.getDiaChi());
        ps.setString(4, nxb.getEmail());
        ps.setString(5, nxb.getsDT());
        ps.execute();

        ps.close();
        conn.close();
    }
}
