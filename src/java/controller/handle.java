package controller;


import daoAdmin.DonHangDAO;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelAdmin.DonHang;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author dell
 */
public class handle {

    public int maDonHangKhongBiTrung() {
        int madonhangRandom = new Random().nextInt(1000);
        try {

            DonHangDAO donHangDAO = new DonHangDAO();
            List<DonHang> allDonHang = donHangDAO.select();
            for (int i = 0; i < allDonHang.size(); i++) {
                if (madonhangRandom == allDonHang.get(i).getMaDonHang()) {
                    return maDonHangKhongBiTrung();
                }
            }

        } catch (Exception ex) {
            Logger.getLogger(handle.class.getName()).log(Level.SEVERE, null, ex);
        }
        return madonhangRandom;
    }
}
