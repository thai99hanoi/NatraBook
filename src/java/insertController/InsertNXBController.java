/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllerAdmin;

import daoAdmin.ChiTietSachDAO;
import daoAdmin.NXBDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelAdmin.ChiTietSach;
import modelAdmin.NXB;

/**
 *
 * @author Auriat
 */
public class InsertNXBController extends HttpServlet {

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
            NXBDAO update= new NXBDAO();
            
            int maNXB= Integer.valueOf(request.getParameter("maNXB"));
           String tenNXB= request.getParameter("tenNXB");
           String diaChi=request.getParameter("diaChi");
           String email= request.getParameter("email");
           String sDT=request.getParameter("sDT");
             
           if(request.getParameter("insert")!=null){
          
              NXB nxb = new NXB(maNXB, tenNXB, diaChi, email, sDT);
               System.out.println(nxb);
               update.insert(nxb);
               response.sendRedirect("nXB");
           }
//           if(request.getParameter("reset")!=null){
//               
//           }
           RequestDispatcher rd = request.getRequestDispatcher("/insert/InsertNXB.jsp");
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
