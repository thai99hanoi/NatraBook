/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllerAdmin;

import daoAdmin.NXBDAO;
import daoAdmin.SachVaTacGiaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelAdmin.NXB;
import modelAdmin.SachVaTacGia;

/**
 *
 * @author Auriat
 */
public class InsertSachVaTacGiaController extends HttpServlet {

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
            SachVaTacGiaDAO update= new SachVaTacGiaDAO();
            
            int maSach= Integer.valueOf(request.getParameter("maSach"));
           int maTacGia = Integer.valueOf(request.getParameter("maTacGia"));
           
           if(request.getParameter("insert")!=null){
          
              SachVaTacGia svtg = new SachVaTacGia(maSach, maTacGia);
               System.out.println(svtg);
               update.insert(svtg);
               response.sendRedirect("sachVaTacGia");
           }
//           if(request.getParameter("reset")!=null){
//               
//           }
           RequestDispatcher rd = request.getRequestDispatcher("/insert/InsertSachVaTacGia.jsp");
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
