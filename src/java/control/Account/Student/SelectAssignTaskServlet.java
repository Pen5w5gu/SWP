/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.Account.Student;

import Dao.AccountDAO;
import Dao.MilestoneDAO;
import Dao.TaskDAO;
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
import model.Task;
import model.User;

/**
 *
 * @author acer
 */
public class SelectAssignTaskServlet extends HttpServlet {

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
        String taskIDs = request.getParameter("selectedTasks");
        if (taskIDs == null || taskIDs.isEmpty()) {
            // Handle case where selectedTasks is null or empty
            return;
        }

        // Phân tách chuỗi JSON thành mảng các chuỗi
        String[] taskIDsArray = taskIDs.split(",");

        HttpSession session = request.getSession();
        Project project = (Project) session.getAttribute("project");
        int project_ID = project.getId_Project();
        AccountDAO adao = new AccountDAO();
        List<User> list = adao.getUserByProject(project_ID);
        List<Task> tasks = new ArrayList<>();
        TaskDAO tdao = new TaskDAO();
        for (int i = 0; i < taskIDsArray.length; i++) {
            // Check if the string is not empty before parsing to integer
            if (!taskIDsArray[i].trim().isEmpty()) {
                tasks.add(tdao.getTaskByID(Integer.parseInt(taskIDsArray[i].trim())));
            }
        }
        MilestoneDAO mdao = new MilestoneDAO();
        request.setAttribute("milestones", mdao.getMilestoneByProjectId(project_ID));
        request.setAttribute("taskIDs", taskIDs);
        request.setAttribute("students", list);
        request.setAttribute("tasks", tasks);
        request.getRequestDispatcher("AssignTask.jsp").forward(request, response);

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
