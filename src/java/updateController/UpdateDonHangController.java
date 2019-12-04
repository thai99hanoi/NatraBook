/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package updateController;

import daoAdmin.DonHangDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelAdmin.DonHang;

/**
 *
 * @author dell
 */
public class UpdateDonHangController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            int maDonHang = Integer.valueOf(request.getParameter("maDonHang"));
            DonHangDAO update = new DonHangDAO();
            request.setAttribute("update", update.selectByMaDonHang(maDonHang));
            if (request.getParameter("update") != null) {

                int maKhachHang = Integer.valueOf(request.getParameter("maKhachHang"));
                Date thoiGianDat = Date.valueOf(request.getParameter("thoiGianDat"));
                Date thoiGianGiao = Date.valueOf(request.getParameter("thoiGianGiao"));
                String diaChi = request.getParameter("diaChi");
                String nguoiNhan = request.getParameter("nguoiNhan");
                String tinhTrang = request.getParameter("tinhTrang");
                String ghiChu = request.getParameter("ghiChu");
                DonHang donhang = new DonHang(maDonHang, maKhachHang, thoiGianDat, thoiGianGiao, diaChi, nguoiNhan, tinhTrang, ghiChu);

                update.update(donhang);
                response.sendRedirect("DonHang");
            }
            RequestDispatcher rd = request.getRequestDispatcher("/update/updateDonHang.jsp");
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
