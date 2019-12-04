/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AccountController;

import dao.AccountDAO;
import daoAdmin.KhachHangDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelAdmin.KhachHang;

/**
 *
 * @author D
 */
public class RegistrationController extends HttpServlet {

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
            KhachHangDAO daoKH = new KhachHangDAO();
              HttpSession session = request.getSession(true);
            List<KhachHang> kh1 = daoKH.select();
         AccountDAO dao = new AccountDAO();
         int maKhachHang = new Random().nextInt(10000); ;
        String hoten = request.getParameter("hoten");
        String gioitinh = request.getParameter("gender");
        String email = request.getParameter("email");
        String diachi = request.getParameter("diachi");
        String sdt = String.valueOf(request.getParameter("sdt"));
        String taikhoan = request.getParameter("taikhoan");
        String mk = request.getParameter("mk");
//        String avatar= request.getParameter("avatar");
            for (int i = 0; i < kh1.size(); i++) {
                KhachHang get = kh1.get(i);
                if(maKhachHang== get.getMaKhachHang()){
                    session.setAttribute("error", "Trùng rồi");
                    response.sendRedirect("registration");
                }
                 if(taikhoan.equalsIgnoreCase(get.getTaiKhoan())){
                      session.setAttribute("error", "Trùng rồi");
                    response.sendRedirect("registration");
                }
            }
            if (request.getParameter("insert") != null) {
                KhachHang kh = new KhachHang(maKhachHang, hoten, gioitinh, email, diachi, sdt, taikhoan, mk);

                dao.insert(kh);
                response.sendRedirect("login");
            }
            RequestDispatcher rd = request.getRequestDispatcher("../jspAccount/registration.jsp");
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

    private Object Random() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
