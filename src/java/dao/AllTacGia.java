/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelAdmin.TacGia;

/**
 *
 * @author thai9
 */
public class AllTacGia {
    public List<model.TacGia> select() throws Exception {
        List<model.TacGia> tacgia = new ArrayList<>();
        String sql = "select * from TacGia";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            int MaTacGia = rs.getInt("MaTacGia");
            String TenTacGia = rs.getString("TenTacGia");
            String NgheNghiep = rs.getString("NgheNghiep");
            String GhiChuTacGia = rs.getString("GhiChuTG");
            String AnhTacGia = rs.getString("AnhTacGia");
            String tomtat = rs.getString("TomTat");
            tacgia.add(new model.TacGia(TenTacGia, AnhTacGia, GhiChuTacGia, NgheNghiep,tomtat));
        }
        rs.close();
        conn.close();
        return tacgia;
    }
}
