/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control.Account.Student;

import Dao.CommentDAO;
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
import model.Comment;
import model.Project;
import model.Task;
import model.TaskType;
import model.User;

/**
 *
 * @author acer
 */
public class ShowCommentServlet extends HttpServlet {
   
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
            if ( session.getAttribute("session") != null) {
                User user = (User) session.getAttribute("session");
                int user_id = user.getId_account();
                Project project = (Project) session.getAttribute("project");
                int project_id = project.getId_Project();
                int idTask = Integer.parseInt(request.getParameter("task_id"));
                TaskDAO tdao = new TaskDAO();
                Task task = tdao.getTaskByID(idTask);
                TaskTypeDAO ttdao = new TaskTypeDAO();
                CommentDAO cdao = new CommentDAO();
                List<TaskType> tasktypes = ttdao.getTaskType();
                
                List<Comment> comments = cdao.getCommentByTaskAndProject(idTask, project_id);
                request.setAttribute("comments", comments);
                request.setAttribute("idTask", idTask);
                request.setAttribute("task", task);
                request.setAttribute("tasktypes",tasktypes);
                
                request.getRequestDispatcher("Task_Comment.jsp").forward(request, response);
      
            } else {
                // User is not logged in or session doesn't exist, redirect to the login page
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

}
