/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.Account.Student;

import Dao.AccountDAO;
import Dao.NotificationDAO;
import Dao.TaskDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Notification;
import model.Project;
import model.Role;
import model.Task;
import model.User;

/**
 *
 * @author quann
 */
public class Change_Info_Student extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangeInfomation</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeInfomation at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        doPost(request, response);
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
        HttpSession session = request.getSession();
        if (session != null && session.getAttribute("session") != null) {
            User user = (User) session.getAttribute("session");
            AccountDAO dao = new AccountDAO();
            Project project = (Project) session.getAttribute("project");
            int project_id = project.getId_Project();
            TaskDAO tdao = new TaskDAO();
            NotificationDAO notidao = new NotificationDAO();

            if (user != null) {
                // Lấy thông tin về tài khoản và vai trò từ cơ sở dữ liệu
                User accountProfile = dao.getAccountProfile(user.getEmail());
                Role userRole = dao.getUserRole(user.getEmail());

                List<Task> tasks = tdao.getTaskByProject(project_id);
                List<Notification> notifications = notidao.getAllNotiInProject(project_id);

                // Set thông tin vai trò vào tài khoản
                accountProfile.setRole(userRole);

                request.setAttribute("user", accountProfile);
                request.setAttribute("tasks", tasks);
                request.setAttribute("notifications", notifications);
                request.getRequestDispatcher("changeInfo_Student.jsp").forward(request, response);
            } else {
                // Xử lý khi không tìm thấy người dùng
                response.getWriter().println("User not found");
            }
        } else {
            // Xử lý khi không có thông tin người dùng trong session
            response.getWriter().println("User not logged in");
        }
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
