/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.SachDAO;
import daoAdmin.TheLoaiDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Sach;

/**
 *
 * @author DATPT
 */
public class SachController extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            TheLoaiDAO dao1 = new TheLoaiDAO();
            request.setAttribute("TheLoai", dao1.select());
            int value = 1;
            if (request.getParameter("page") != null) {
                value = Integer.valueOf(request.getParameter("page"));
            }

            SachDAO dao = new SachDAO();
            if (request.getParameter("tenSach") != null) {
                String tenSach = request.getParameter("tenSach");
                List<Sach> s = dao.select(value);
                request.setAttribute("sach", dao.select(value));
                for (Sach x : s) {
                    if (x.getTenSach().equalsIgnoreCase(tenSach)) {
                        request.setAttribute("sachs", x);
                        break;
                    }
                }
            } else if (request.getParameter("submit") != null) {
                request.setAttribute("sach", dao.search(request.getParameter("search")));
            } else {
                request.setAttribute("sach", dao.select(value));
            }
            RequestDispatcher rd = request.getRequestDispatcher("sach.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            response.getWriter().println(e);
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
