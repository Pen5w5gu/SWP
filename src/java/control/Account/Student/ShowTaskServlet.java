/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control.Account.Student;

import Dao.MilestoneDAO;
import Dao.TaskDAO;
import Dao.TaskTypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Milestone;
import model.Project;
import model.Task;
import model.TaskType;
import model.User;

/**
 *
 * @author acer
 */
public class ShowTaskServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
        HttpSession session = request.getSession();
        if (session != null && session.getAttribute("session") != null  ) {
        User user =  (User) session.getAttribute("session");
        Project project = (Project) session.getAttribute("project");
        int project_id = project.getId_Project();
        TaskDAO tdao = new TaskDAO();
        MilestoneDAO mdao = new MilestoneDAO();
        TaskTypeDAO ttdao = new TaskTypeDAO();
        List<Task> tasks = tdao.getTaskByProject(project_id);
        List<Milestone> milestones = mdao.getMilestoneByProjectId(project_id);
        List<TaskType> tasktypes = ttdao.getTaskType();
        request.setAttribute("milestones", milestones);
        request.setAttribute("tasks", tasks);
        request.setAttribute("tasktypes",tasktypes);
        request.getRequestDispatcher("Task.jsp").forward(request, response);
        } else {
        // User is not logged in or session doesn't exist, redirect to the login page
        response.sendRedirect("login.jsp");
        }
        
         } catch (Exception e) {
        e.printStackTrace();
        System.out.println("An error occurred in ShowTaskServlet: " + e.getMessage());
        throw new ServletException("An error occurred in ShowTaskServlet.", e);
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

}