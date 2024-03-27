/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.Account.Lecture;

import Dao.AccountDAO;
import Dao.ClassDAO;
import Dao.GradeDAO;
import Dao.ProjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Project;

/**
 *
 * @author acer
 */
public class GradeStudent extends HttpServlet {

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
        ProjectDAO pdao = new ProjectDAO();
        ClassDAO cdao = new ClassDAO();
        HttpSession session = request.getSession();
        int Grade_Dailyreport = Integer.parseInt(request.getParameter("Grade_Dailyreport"));
        int Grade_Code = Integer.parseInt(request.getParameter("Grade_Code"));
        int Grade_Document = Integer.parseInt(request.getParameter("Grade_Document"));
        int Grade_Presentation = Integer.parseInt(request.getParameter("Grade_Presentation"));
        int account_id = Integer.parseInt(request.getParameter("account_id"));
        AccountDAO adao = new AccountDAO();
        int project_id = Integer.parseInt(adao.getProjectID(account_id));

        GradeDAO gdao = new GradeDAO();
        if (gdao.GradeStudent(Grade_Dailyreport, Grade_Code, Grade_Document, Grade_Presentation, project_id)) {

            
            request.getRequestDispatcher("Homepagelecture.jsp").forward(request, response);
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
