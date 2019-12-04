/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import model.*;

/**
 *
 * @author DATPT
 */
public class TacGiaDAO {
    public List<TacGia> selectTacGia(String tenTG) throws Exception {
        List<TacGia> tg = new ArrayList<>();
        String sql = "select * from TACGIA \n" +
"where TACGIA.TenTacGia=N'"+tenTG+"'";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            String tenTacGia = rs.getString("TenTacGia");
            String ghiChuTG= rs.getString("GhiChuTG");
            String anhTG= rs.getString("AnhTacGia");
            String ngheNghiep = rs.getString("NgheNghiep");
            String tomtat = rs.getString("TomTat");
            tg.add(new TacGia(tenTacGia, anhTG, ghiChuTG,ngheNghiep,tomtat));
        }
        rs.close();
        conn.close();
        return tg;
    }
    public List<Sach> selectByTenTG(String tenTG) throws Exception {
        List<Sach> tg = new ArrayList<>();
        String sql = "select TACGIA.TenTacGia,SACH.TenSach,SACH.GiaBia,Sach.AnhSach,SACH.GhiChuSach\n" +
"FROM dbo.SACH INNER JOIN dbo.SACHvaTACGIA ON SACHvaTACGIA.MaSach = SACH.MaSach \n" +
"INNER JOIN dbo.TACGIA ON SACHvaTACGIA.MaTacGia = TACGIA.MaTacGia \n" +
"where TACGIA.TenTacGia=N'"+tenTG+"'";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            String tenTacGia = rs.getString("TenTacGia");
            String tenSach = rs.getString("TenSach");
            double giaBia= rs.getDouble("GiaBia");
            Locale loc = new Locale("vn", "VN");
            NumberFormat nf = NumberFormat.getInstance(loc);
            String fm = nf.format(giaBia).toString()+" VNĐ";
            String anhSach = rs.getString("AnhSach");
             String ghiChuSach= rs.getString("GhiChuSach");
            tg.add(new Sach(tenSach, tenTacGia, fm, ghiChuSach, anhSach));
        }
        rs.close();
        conn.close();
        return tg;
    }
}
