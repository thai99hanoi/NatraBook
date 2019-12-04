/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllerAdmin;


import daoAdmin.ChiTietSachDAO;
import daoAdmin.SachAdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelAdmin.ChiTietSach;
import modelAdmin.SachAdmin;


/**
 *
 * @author Auriat
 */
public class InsertChiTietSachController extends HttpServlet {

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
            ChiTietSachDAO update= new ChiTietSachDAO();
            String maChiTietSach = request.getParameter("maChiTietSach");
            int maSach= Integer.valueOf(request.getParameter("maSach"));
           String maNgonNgu= request.getParameter("maNgonNgu");
           
           int tongSoTrang= Integer.valueOf(request.getParameter("tongSoTrang"));
           double trongLuong=Double.valueOf(request.getParameter("trongLuong"));
           String kichThuoc=request.getParameter("kichThuoc");
           Date namXuatBan = Date.valueOf(request.getParameter("namXuatBan"));
             
           if(request.getParameter("insert")!=null){
          
              ChiTietSach chitietsach= new ChiTietSach(maChiTietSach, maSach, maNgonNgu, tongSoTrang, trongLuong, kichThuoc, namXuatBan);
               System.out.println(chitietsach);
               update.insert(chitietsach);
               response.sendRedirect("chiTietSach");
           }
//           if(request.getParameter("reset")!=null){
//               
//           }
           RequestDispatcher rd = request.getRequestDispatcher("/insert/InsertChiTietSach.jsp");
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
