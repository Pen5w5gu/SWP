/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.Account.Student;

import Dao.AccountDAO;
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

/**
 *
 * @author quann
 */
public class ChangeStatusIssuesServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        Project project = (Project) session.getAttribute("project");
        int project_id = project.getId_Project();
        String issueIDs = request.getParameter("issueIDs");
        int status = Integer.parseInt(request.getParameter("status"));
        IssueDAO idao = new IssueDAO();
        //Integer.parseInt(request.getParameter("status"));
        

        // Phân tách chuỗi JSON thành mảng các chuỗi
        String[] issueIDsArray = issueIDs.split(",");
        List<Integer> issueIDsList = new ArrayList<>();
        for (int i = 0; i < issueIDsArray.length; i++) {
            if (!issueIDsArray[i].isEmpty()) {
                idao.ChangeStatus(Integer.parseInt(issueIDsArray[i]), status);
            }
        }
            request.setAttribute("project_id", project_id);
            request.getRequestDispatcher("issues").forward(request, response);
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
