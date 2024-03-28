/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.Account.Lecture;

import Dao.AccountDAO;
import Dao.ClassDAO;
import Dao.IssueDAO;
import Dao.NotificationDAO;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Project;
import model.User;

/**
 *
 * @author quann
 */
public class BanAccountServlet extends HttpServlet {

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
        doGet(request, response);
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
        String Classname = request.getParameter("classname");
        AccountDAO dao = new AccountDAO();
        int id_account = Integer.parseInt(request.getParameter("id_account"));
        int status = Integer.parseInt(request.getParameter("status"));
        dao.ChangeStatus(id_account, status);
        List<User> list = dao.getAllowStudentinclass(Classname);
        request.setAttribute("student", list);
        request.setAttribute("Classname", Classname);
        HttpSession session = request.getSession();
        if (session != null && session.getAttribute("session") != null) {
            User user = (User) session.getAttribute("session");
            User account = dao.getUser(user.getEmail());
            ClassDAO cdao = new ClassDAO();
            List<model.Class> classes = cdao.getClassByUser(account.getId_account());
            request.setAttribute("classes", classes);
            request.setAttribute("classname", Classname);
            request.getRequestDispatcher("Showstudentinclass.jsp").forward(request, response);
        }
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
