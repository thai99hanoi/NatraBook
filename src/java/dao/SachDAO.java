/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import model.Sach;

/**
 *
 * @author DATPT
 */
public class SachDAO {
  public List<Sach> select(int i) throws Exception {
        List<Sach> s = new ArrayList<>();
        Connection conn = new DBContext().getConnection();
        CallableStatement cs = conn.prepareCall("{call GetDetailSach2(?)}");
        cs.setInt(1, i);
        ResultSet rs = cs.executeQuery();
        while (rs.next()) {
            String tenSach = rs.getString("TenSach");
            String tenTacGia = rs.getString("TenTacGia");
            double giaBia = rs.getDouble("GiaBia");
            Locale loc = new Locale("vn", "VN");
            NumberFormat nf = NumberFormat.getInstance(loc);
            String fm = nf.format(giaBia).toString() + " VNĐ";
            String ghiChu = rs.getString("GhiChuSach");
            String anhSach = rs.getString("AnhSach");
            s.add(new Sach(tenSach, tenTacGia, fm, ghiChu, anhSach));
        }
        rs.close();
        conn.close();
        return s;
    }

    public List<Sach> search(String searchName) throws Exception {
        List<Sach> s = new ArrayList<>();
        String sql = "select SACH.TenSach,TACGIA.TenTacGia,SACH.GiaBia,SACH.GhiChuSach,SACH.AnhSach "
                + "FROM dbo.SACH "
                + "INNER JOIN dbo.SACHvaTACGIA ON SACHvaTACGIA.MaSach = SACH.MaSach "
                + "INNER JOIN dbo.TACGIA ON SACHvaTACGIA.MaTacGia = TACGIA.MaTacGia "
                + "where SACH.TenSach like N'%" + searchName + "%' or TACGIA.TenTacGia like N'%" + searchName + "%'";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.createStatement().executeQuery(sql);
        while (rs.next()) {
            String tenSach = rs.getString("TenSach");
            String tenTacGia = rs.getString("TenTacGia");
            double giaBia = rs.getDouble("GiaBia");
            Locale loc = new Locale("vn", "VN");
            NumberFormat nf = NumberFormat.getInstance(loc);
            String fm = nf.format(giaBia).toString() + " VNĐ";
            String ghiChu = rs.getString("GhiChuSach");
            String anhSach = rs.getString("AnhSach");
            s.add(new Sach(tenSach, tenTacGia, fm, ghiChu, anhSach));
        }
        rs.close();
        conn.close();
        return s;
    }
    
    
    
    
    
    public List<Sach> selectByTenTheLoai(String tenLoaiSach) throws Exception {
        List<Sach> s = new ArrayList<>();
        String sql = "select SACH.TenSach,TACGIA.TenTacGia,SACH.GiaBia,SACH.GhiChuSach,SACH.AnhSach\n" +
"                FROM dbo.SACH\n" +
"                INNER JOIN dbo.SACHvaTACGIA ON SACHvaTACGIA.MaSach = SACH.MaSach \n" +
"                INNER JOIN dbo.TACGIA ON SACHvaTACGIA.MaTacGia = TACGIA.MaTacGia\n" +
"				inner join dbo.THELOAI on SACH.MaLoaiSach=THELOAI.MaLoaiSach	\n" +
"				where THELOAI.TenLoaiSach=N'"+tenLoaiSach+"'";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.createStatement().executeQuery(sql);
        while (rs.next()) {
            String tenSach = rs.getString("TenSach");
            String tenTacGia = rs.getString("TenTacGia");
            double giaBia = rs.getDouble("GiaBia");
            Locale loc = new Locale("vn", "VN");
            NumberFormat nf = NumberFormat.getInstance(loc);
            String fm = nf.format(giaBia).toString() + " VNĐ";
            String ghiChu = rs.getString("GhiChuSach");
            String anhSach = rs.getString("AnhSach");
            s.add(new Sach(tenSach, tenTacGia, fm, ghiChu, anhSach));
        }
        rs.close();
        conn.close();
        return s;
    }
  
}
