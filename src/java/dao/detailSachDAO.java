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
import model.detailSach;

/**
 *
 * @author DATPT
 */
public class detailSachDAO {

    public List<detailSach> selectByTenSach(String Sach) throws Exception {
        List<detailSach> ds = new ArrayList<>();
        String sql = "select SACH.TenSach,TACGIA.TenTacGia,SACH.GiaBia, NXB.TenNXB, CHITIETSACH.MaSach,NamXuatBan, MaChiTietSach, TongSoTrang, TrongLuong , NGONNGU.TenNgonNgu,SACH.GhiChuSach,SACH.AnhSach\n"
                + "FROM dbo.SACH\n"
                + "INNER JOIN dbo.SACHvaTACGIA ON SACHvaTACGIA.MaSach = SACH.MaSach\n"
                + "INNER JOIN dbo.TACGIA ON SACHvaTACGIA.MaTacGia = TACGIA.MaTacGia\n"
                + "inner join dbo.CHITIETSACH on SACH.MaSach = CHITIETSACH.MaSach\n"
                + "inner join dbo.NGONNGU on CHITIETSACH.MaNgonNgu = NGONNGU.MaNgonNgu\n"
                + "inner join dbo.NXB on SACH.MaNXB = NXB.MaNXB\n"
                + "where SACH.TenSach =N'" + Sach + "'";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {
            String tenSach = rs.getString("TenSach");
            String tenTacGia = rs.getString("TenTacGia");
            double giaBia = rs.getDouble("GiaBia");
            Locale loc = new Locale("vn", "VN");
            NumberFormat nf = NumberFormat.getInstance(loc);
            String fm = nf.format(giaBia).toString() + " VNĐ";
            String tenNXB = rs.getString("TenNXB");
            int maSach = rs.getInt("MaSach");
            Date namXB = rs.getDate("NamXuatBan");
            String chiTietSach = rs.getString("MaChiTietSach");
            int soTrang = rs.getInt("TongSoTrang");
            double trongLuong = rs.getDouble("TrongLuong");
            String ngonNgu = rs.getString("TenNgonNgu");
            String ghiChu = rs.getString("GhiChuSach");
            String anhSach = rs.getString("AnhSach");
            ds.add(new detailSach(tenSach, tenTacGia, fm, tenNXB, maSach, namXB, chiTietSach, soTrang, trongLuong, ngonNgu, ghiChu, anhSach));
        }
        rs.close();
        conn.close();
        return ds;
    }
//     public static void main(String[] args) throws Exception {
//         detailSachDAO dt = new detailSachDAO();
//         List<detailSach> ds = dt.selectByTenSach("The Fault in Our Stars");
//         for (int i = 0; i < ds.size(); i++) {
//             System.out.println(ds.get(i).getTenNXB());
//         }
//         
//     }
}
