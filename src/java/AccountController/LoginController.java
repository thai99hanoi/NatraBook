/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AccountController;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author D
 */
public class LoginController extends HttpServlet {

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

        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            HttpSession session = request.getSession(true);
            AccountDAO dao = new AccountDAO();
            session.setAttribute("error", "");
            List<Account> a = dao.login();
            if (username != null || password != null) {
             

                if (username.equalsIgnoreCase("admin") && password.equals("admin")) {
                    Account x = new Account(username, password);
                    session.setAttribute("login", x);
                    request.getRequestDispatcher("/sachAdmin").forward(request, response);

                } else if (username.equals("") || password.equals("")) {
                    session.setAttribute("error", "Nothing to input!!!");
                    response.sendRedirect("./jspAccount/login.jsp");
                } else {
                    for (Account x : a) {
                        if (username.equals(x.getUsername()) && password.equals(x.getPassword())) {
                            session.setAttribute("login", x);
//                            request.getRequestDispatcher("sach.jsp").forward(request, response);
                            response.sendRedirect("Sach");


                        } 
                        else if (!username.equals(x.getUsername()) || !password.equals(x.getPassword())) {
                            session.setAttribute("error", "Username or password is incorrect");
                            
//                            request.getRequestDispatcher("./jspAccount/login.jsp").forward(request, response);
                        }
                    }
                }
            } else {
                session.setAttribute("error", "Nothing to input!!!");
                response.sendRedirect("./jspAccount/login.jsp");
            }
            response.sendRedirect("./jspAccount/login.jsp");
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
