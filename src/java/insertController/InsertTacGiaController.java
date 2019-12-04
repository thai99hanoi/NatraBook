/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllerAdmin;


import daoAdmin.ChiTietSachDAO;
import daoAdmin.TacGiaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelAdmin.TacGia;
import modelAdmin.ChiTietSach;

/**
 *
 * @author Auriat
 */
public class InsertTacGiaController extends HttpServlet {

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
            TacGiaDAO update= new TacGiaDAO();
            
            int maTacGia= Integer.valueOf(request.getParameter("maTacGia"));
            String tenTacGia = request.getParameter("tenTacGia");
           String ngheNghiep= request.getParameter("ngheNghiep");          
           String ghiChuTacGia = request.getParameter("ghiChuTacGia");           
           String anhTacGia=request.getParameter("anhTacGia");
           
             
           if(request.getParameter("insert")!=null){
          
              TacGia tacgia = new TacGia(maTacGia, tenTacGia, ngheNghiep, ghiChuTacGia, anhTacGia);
               System.out.println(tacgia);
               update.insert(tacgia);
               response.sendRedirect("tacGia");
           }
//           if(request.getParameter("reset")!=null){
//               
//           }
           RequestDispatcher rd = request.getRequestDispatcher("/insert/InsertTacGia.jsp");
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
