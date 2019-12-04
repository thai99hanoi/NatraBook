/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllerAdmin;

import daoAdmin.DonHangDAO;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelAdmin.DonHang;

/**
 *
 * @author DATPT
 */
public class DonHangController extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            DonHangDAO insert = new DonHangDAO();
            request.setAttribute("donHang", insert.select());
            List<DonHang> dh = insert.selectByMaKhachHang(0);
            for (int i = 0; i < dh.size(); i++) {
                DonHang get = dh.get(i);
                int maDonHang = new Random().nextInt(1000000);
                int maKhachHang = get.getMaKhachHang();
                Date thoiGianDat = (Date) get.getThoiGianDat();
                Date ThoiGianGiao = null;
                String diaChi1 = get.getDiaChi();
                String nguoiNhan = get.getNguoiNhan();
                String tinhTrang = "";
                String ghiChu = "";
                DonHang donhang = new DonHang(maDonHang, maKhachHang, thoiGianDat, ThoiGianGiao, diaChi1, nguoiNhan, tinhTrang, ghiChu);
                insert.insert(donhang);
            }
            RequestDispatcher rd = request.getRequestDispatcher("/jspAdmin/donHang.jsp");
            rd.forward(request, response);
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
