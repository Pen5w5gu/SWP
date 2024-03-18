/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.Account.Student;

import Dao.MilestoneDAO;
import Dao.NotificationDAO;
import Dao.TaskDAO;
import Dao.TaskTypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Milestone;
import model.Notification;
import model.Project;
import model.Task;
import model.TaskType;

/**
 *
 * @author acer
 */
public class ShowMilestoneServlet extends HttpServlet {

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
        try {
            HttpSession session = request.getSession();
            Project project = (Project) session.getAttribute("project");
            int project_id = project.getId_Project();
            
            MilestoneDAO mdao = new MilestoneDAO();
            TaskTypeDAO ttdao = new TaskTypeDAO();
            TaskDAO tdao = new TaskDAO();
            NotificationDAO notidao = new NotificationDAO();
            
            List<TaskType> tasktypes = ttdao.getTaskType();
            List<Milestone> milestones = mdao.getMilestoneByProjectId(project_id);
            List<Task> tasks = tdao.getTaskByProject(project_id);
            List<Notification> notifications = notidao.getAllNotiInProject(project_id);
            
            List<Map<Integer, Integer>> milestoneTaskTypePercentageList = new ArrayList<>();

            // Iterate through milestones
            for (Milestone milestone : milestones) {
                Map<Integer, Integer> taskTypePercentageMap = new HashMap<>();
                // Iterate through task types
                for (TaskType taskType : tasktypes) {
                    int typeCount = 0;

                    // Count tasks of this type in this milestone
                    List<Task> taskOfMilestones = tdao.getTaskByProjectAndMileStone(project_id,milestone.getId_milestone());
                    for (Task task : taskOfMilestones) {
                        if (task.getTaskTypeId() == taskType.getTaskType_Id() && task.getIdMilestone() == milestone.getId_milestone()) {
                            typeCount++;
                        }
                    }
                    request.setAttribute("taskOfMilestonessize"+milestone.getId_milestone(), taskOfMilestones.size());
                    // Calculate percentage for this task type in this milestone
                    int percentage = (!taskOfMilestones.isEmpty()) ? (typeCount * 100) / taskOfMilestones.size() : 0;

                    taskTypePercentageMap.put(taskType.getTaskType_Id(), percentage);
                }

                // Add task type percentage map for this milestone to the list
                milestoneTaskTypePercentageList.add(taskTypePercentageMap);
            }
            if (milestoneTaskTypePercentageList.isEmpty()) {
                System.out.println("Some stuff was done");

                PrintWriter out = response.getWriter();
                out.println("Error");
            }
            
            request.setAttribute("numberoftask", tasks.size());
            request.setAttribute("milestones", milestones);
            request.setAttribute("tasktypes", tasktypes);
            request.setAttribute("tasks", tasks);
            request.setAttribute("notifications", notifications);
            request.setAttribute("milestoneTaskTypePercentageList", milestoneTaskTypePercentageList);
            request.getRequestDispatcher("Milestone.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("An error occurred in ShowTaskServlet: " + e.getMessage());
            throw new ServletException("An error occurred in ShowTaskServlet.", e);
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