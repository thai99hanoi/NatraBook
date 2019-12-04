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
public class TacGiaDAO {
    public List<TacGia> select() throws Exception {
        List<TacGia> tacgia = new ArrayList<>();
        String sql = "select * from TacGia";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int MaTacGia = rs.getInt("MaTacGia");
            String TenTacGia = rs.getString("TenTacGia");
            String NgheNghiep = rs.getString("NgheNghiep");
            String GhiChuTacGia = rs.getString("GhiChuTG");
            String AnhTacGia = rs.getString("AnhTacGia");
            tacgia.add(new TacGia(MaTacGia, TenTacGia, NgheNghiep, GhiChuTacGia, AnhTacGia));
        }
        rs.close();
        conn.close();
        return tacgia;
    }
    public boolean update(TacGia tg) {
        int check = 0;
        String sql = "UPDATE dbo.TACGIA Set TenTacGia=?,NgheNghiep=?,GhiChuTG=?, AnhTacGia=? WHERE MaTacGia =?";

        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setObject(1, tg.getTenTacGia());
            ps.setObject(2, tg.getNgheNghiep());
            ps.setObject(3, tg.getGhiChuTacGia());
            ps.setObject(4, tg.getAnhTacGia());
            ps.setObject(5, tg.getMaTacGia());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception ex) {
            Logger.getLogger(TacGiaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check > 0;
    }

    public List<TacGia> selectByMaTacGia(int maTacGia1) throws Exception {
        List<TacGia> tg = new ArrayList<>();
        String sql = "select * from TACGIA where maTacGia=" + maTacGia1;
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int maTacGia = rs.getInt("maTacGia");
            String tenTacGia = rs.getString("tenTacGia");
            String ngheNghiep = rs.getString("ngheNghiep");
            String ghiChuTG = rs.getString("ghiChuTG");
            String anhTacGia = rs.getString("anhTacGia");
            tg.add(new TacGia(maTacGia, tenTacGia, ngheNghiep, ghiChuTG, anhTacGia));
        }
        rs.close();
        conn.close();
        return tg;
    }
    
    public void insert(TacGia tg)throws Exception{
        String sql = "insert into TACGIA values (?,?,?,?,?) ";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, tg.getMaTacGia());
        ps.setString(2, tg.getTenTacGia());
        ps.setString(3, tg.getNgheNghiep());
        ps.setString(4, tg.getGhiChuTacGia());
        ps.setString(5, tg.getAnhTacGia());
       
        ps.execute();
        
        ps.close();
        conn.close();
    }
}
