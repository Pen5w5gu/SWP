package control.Account.Student;

import Dao.MilestoneDAO;
import Dao.NotificationDAO;
import Dao.ReportDAO;
import Dao.TaskDAO;
import Dao.TaskTypeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.List;
import model.Project;
import model.Task;
import model.User;
import model.Report;

/**
 *
 * @author ns
 */
@WebServlet(name = "AddReportStudentServlet", urlPatterns = {"/add_report"})
public class AddReportStudentServlet extends HttpServlet {

    private static final String VIEW_PATH = "/Add_Report.jsp";

    private final TaskDAO taskDAO = new TaskDAO();

    private final ReportDAO reportDAO = new ReportDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("session") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
//        User user = (User) session.getAttribute("session");
//        int accountId = user.getId_account();
//        List<Task> tasks = taskDAO.getTasksByAccountId(accountId);

        Project project = (Project) session.getAttribute("project");
        int project_id = project.getId_Project();
        List<Task> tasks = taskDAO.getTaskByProject(project_id);
        request.setAttribute("tasks", tasks);

        request.getRequestDispatcher(VIEW_PATH).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("session") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        User user = (User) session.getAttribute("session");
        int accountId = user.getId_account();

        // Retrieve form data
        Date date = Date.valueOf(request.getParameter("date"));
        String workDone = request.getParameter("workDone");
        String planningTomorrow = request.getParameter("planningTomorrow");
        String issue = request.getParameter("issue");
        String notes = request.getParameter("notes");
        int taskId = Integer.parseInt(request.getParameter("taskId"));

        // Create a new report object with form data
        Report report = new Report();
        report.setDate(date);
        report.setWorkDone(workDone);
        report.setPlanningTomorrow(planningTomorrow);
        report.setIssue(issue);
        report.setNotes(notes);
        report.setTaskId(taskId);
        report.setAccountId(accountId);

        Report addedReport = reportDAO.addRepost(report);
        if (addedReport == null) {
            request.setAttribute("error", "Add report failed. Please try again!");
            doGet(request, response);
            return;
        }

        request.setAttribute("success", "Added report successfully!");
        doGet(request, response);
    }

}
