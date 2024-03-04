/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control.Account.Student;

import Dao.MilestoneDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import model.Milestone;
import model.Project;

/**
 *
 * @author acer
 */
public class AddMilesToneServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        String milestoneName = request.getParameter("milestoneName");
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        Project project = (Project) session.getAttribute("project");
        int project_id = project.getId_Project();

        // Tạo đối tượng Milestone
        Milestone milestone = new Milestone();
        milestone.setName_milestone(milestoneName);
        milestone.setStart_date(startDate);
        milestone.setEnd_date(endDate);
        milestone.setId_Project(project_id);

        // Gọi DAO để thêm Milestone vào cơ sở dữ liệu
        MilestoneDAO milestoneDAO = new MilestoneDAO();
        boolean success = milestoneDAO.addMilestone(milestone);

        if (success) {
            // Nếu thêm thành công, chuyển hướng về trang thành công
<<<<<<< HEAD
            response.sendRedirect("milestone");
=======
            response.sendRedirect("ShowMilestoneServlet");
>>>>>>> a932d4479392a1e5c91c4c321407a7dda252f9a8
        } else {
            // Nếu thêm không thành công, chuyển hướng về trang lỗi
            response.sendRedirect("login.jsp");
        }
    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

<<<<<<< HEAD
}
=======
}
>>>>>>> a932d4479392a1e5c91c4c321407a7dda252f9a8
