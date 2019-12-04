/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daoAdmin.ChiTietDonHangDAO;
import daoAdmin.DonHangDAO;
import daoAdmin.KhachHangDAO;
import daoAdmin.SachAdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import modelAdmin.ChiTietDonHang;
import modelAdmin.DonHang;
import modelAdmin.KhachHang;
import modelAdmin.SachAdmin;

/**
 *
 * @author dell
 */
public class DatHang2Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String username = request.getParameter("user");
            HttpSession session = request.getSession(true);
            SachAdmin sach1 = (SachAdmin) session.getAttribute("sachAd");
            String tenSach = sach1.getTenSach();
            SachAdminDAO dao = new SachAdminDAO();
            KhachHangDAO dao1 = new KhachHangDAO();

            try {
                System.out.println("1");
                request.setAttribute("khachhangs", dao1.selectByUser(username));
                List<SachAdmin> s = dao.selectDonHang(tenSach);
                for (int i = 0; i < s.size(); i++) {
                    SachAdmin get = s.get(i);
                    int maSach = get.getMaSach();
                    String tenSach1 = get.getTenSach();
                    int maLoaiSach = get.getMaLoaiSach();
                    int maNxb = get.getMaNxb();
                    double giaNhap = get.getGiaNhap();
                    double giaBia = get.getGiaBia();
                    int soLuong = get.getSoLuong();
                    
                    String ghichuSach = get.getGhiChuSach();
                    String anhSach = get.getAnhSach();
                    String tomTat = get.getTomTat();
                    SachAdmin sach2 = new SachAdmin(maSach, tenSach1, maLoaiSach, maNxb, giaNhap, giaBia, soLuong, ghichuSach, anhSach, tomTat);
                    dao.update1(sach2);
                }
            } catch (Exception e) {
                System.out.println(e);
            }

            try {
                //tao don hang moi
                System.out.println("2");
                KhachHang khachHang1 = (KhachHang) session.getAttribute("kh1");
                int maKhachHang = khachHang1.getMaKhachHang(); 
                DonHangDAO donHangDAO = new DonHangDAO();
                List<DonHang> lsDonHang = donHangDAO.selectByMaKhachHang(maKhachHang);
                handle h = new handle();
                int maDonHang = h.maDonHangKhongBiTrung();
                for (int i = 0; i < lsDonHang.size(); i++) {
                    
                    int maKhachHang1 = khachHang1.getMaKhachHang();
                    Date tgGiao = null;
                    String diaChi = khachHang1.getDiaChi();
                    String nguoiNhan = khachHang1.getHoTen();
                    String tinhTrang = "";
                    String ghiChu = "";
                    DonHang donhang = new DonHang(maDonHang, maKhachHang1, tgGiao, diaChi, nguoiNhan, tinhTrang, ghiChu);
                    donHangDAO.insert1(donhang);
                    session.setAttribute("donhang", donhang);
                }
//                response.getWriter().print(maDonHang);
//                return;
            } catch (Exception e) {
                System.out.println(e);
            }

            try {
                System.out.println("3");
                DonHang donHang1 = (DonHang) session.getAttribute("donhang");
                int maDonHangCT = donHang1.getMaDonHang();
                System.out.println(maDonHangCT);
                ChiTietDonHangDAO ctDonHang = new ChiTietDonHangDAO();
                    int maSach1 = sach1.getMaSach();
                    int maDonHangCT1 = donHang1.getMaDonHang();
                    int soLuong = 1;
                    double donGia = sach1.getGiaBia();
                    ChiTietDonHang ctdh = new ChiTietDonHang(maSach1, maDonHangCT1, soLuong, donGia);
                    ctDonHang.insert(ctdh);

                
            } catch (Exception e) {
                System.out.println(e);
            }

            System.out.println("4");
            response.sendRedirect("Sach");

        } catch (Exception e) {
            response.getWriter().print(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
