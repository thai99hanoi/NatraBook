/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import modelAdmin.KhachHang;

/**
 *
 * @author D
 */
public class AccountDAO {
    public List<Account> login() throws Exception{
        List<Account> ac = new ArrayList<>();
        String sql = "select TaiKhoan,MK,HoTen from KHACHHANG";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {            
            String username = rs.getString("taikhoan");
            String password = rs.getString("mk");
            String hoten = rs.getString("HoTen");
            ac.add(new Account(username, password,hoten));
        }
        rs.close();
        conn.close();
        return ac;
    }
    
    public List<KhachHang> search() throws Exception {
        List<KhachHang> kh = new ArrayList<>();
        String sql = "select * from KHACHHANG";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(sql).executeQuery();
        while (rs.next()) {

            int id = Integer.valueOf(rs.getString("makhachhang"));
            String hoten = rs.getNString("hoten");
            String gioitinh = rs.getString("gioitinh");
            String email = rs.getString("email");
            String diachi = rs.getNString("diachi");
            String sdt = String.valueOf(rs.getInt("sdt"));
            String taikhoan = rs.getString("taikhoan");
            String mk = rs.getString("mk");
            Date date = Date.valueOf(rs.getString("ngaykd"));
            kh.add(new KhachHang(id, hoten, gioitinh, email, diachi, sdt, taikhoan, mk, date));
        }
        rs.close();
        conn.close();
        return kh;
    }
    

    public void insert(KhachHang kh) throws Exception {
        String sql = "insert into KHACHHANG values (?,?,?,?,?,?,?,?,getDate(),?) ";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, kh.getMaKhachHang());
        ps.setString(2, kh.getHoTen());
        ps.setString(3, kh.getGioiTinh());
        ps.setString(4, kh.getEmail());
        ps.setString(5, kh.getDiaChi());
        ps.setString(6, kh.getsDT());
        ps.setString(7, kh.getTaiKhoan());
        ps.setString(8, kh.getmK());
        ps.setString(9, kh.getImg());
        ps.execute();

        ps.close();
        conn.close();
    }
}
