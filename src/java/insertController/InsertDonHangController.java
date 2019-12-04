/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllerAdmin;

import daoAdmin.DonHangDAO;
import daoAdmin.SachAdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelAdmin.DonHang;
import modelAdmin.SachAdmin;

/**
 *
 * @author Auriat
 */
public class InsertDonHangController extends HttpServlet {

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
        try  {
            /* TODO output your page here. You may use following sample code. */
             int maDonHang= Integer.valueOf(request.getParameter("maDonHang"));
             System.out.println(maDonHang);
               int maKhachHang = Integer.valueOf(request.getParameter("tenKhachHang"));
            System.out.println(maKhachHang);
            Date thoiGianDat = Date.valueOf(request.getParameter("thoiGianDat"));
            System.out.println(thoiGianDat);
            Date thoiGianGiao = Date.valueOf(request.getParameter("thoiGianGiao"));
            System.out.println(thoiGianGiao);
           String diaChi= request.getParameter("diaChi");
            System.out.println(diaChi);
           String nguoiNhan = request.getParameter("nguoiNhan");
            System.out.println(nguoiNhan);
           String tinhTrang=request.getParameter("tinhTrang");
            System.out.println(tinhTrang);
           String ghiChu=request.getParameter("ghiChu");
            System.out.println(ghiChu);
            DonHangDAO update= new DonHangDAO();
          
             
           if(request.getParameter("insert")!=null){
          
              DonHang donHang = new DonHang(maDonHang, maKhachHang, thoiGianDat, thoiGianGiao, diaChi, nguoiNhan, tinhTrang, ghiChu);
               System.out.println(donHang);
               update.insert(donHang);
               response.sendRedirect("DonHang");
           }
//           if(request.getParameter("reset")!=null){
//               
//           }
           RequestDispatcher rd = request.getRequestDispatcher("/insert/InsertDonHang.jsp");
            rd.forward(request, response);
        }catch (Exception e) {
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
