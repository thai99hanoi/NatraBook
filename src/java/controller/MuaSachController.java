/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daoAdmin.SachAdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Cart;
import model.Sach;
import modelAdmin.SachAdmin;

/**
 *
 * @author thai9
 */
public class MuaSachController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            SachAdminDAO dao = new SachAdminDAO();
            HttpSession session = request.getSession(true);
//            Account acc = (Account) session.getAttribute("login");
            String tenSach = request.getParameter("tenSach");
            request.setAttribute("muahang", dao.selectDonHang(tenSach));
            if (request.getParameter("deomuanua") != null) {
                response.sendRedirect("Sach");
            }

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
                
                    if (get.getSoLuong() <= 0) {
                        session.setAttribute("error", "Hết hàng, chúng tôi sẽ liên hệ bạn khi nhập thêm hàng");
                        response.sendRedirect("hetmesachroi.jsp");
                        out.print("Hết hàng, chúng tôi sẽ liên hệ bạn khi nhập thêm hàng");
                    }
                
                String ghichuSach = get.getGhiChuSach();
                String anhSach = get.getAnhSach();
                String tomTat = get.getTomTat();
                SachAdmin s1 = new SachAdmin(maSach, tenSach1, maLoaiSach, maNxb, giaNhap, giaBia, soLuong, ghichuSach, anhSach, tomTat);
                session.setAttribute("sachAd", s1);

            }
            RequestDispatcher rd = request.getRequestDispatcher("muasach.jsp");
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
