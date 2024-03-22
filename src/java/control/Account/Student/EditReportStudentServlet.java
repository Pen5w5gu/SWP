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

@WebServlet(name = "EditReportStudentServlet", urlPatterns = {"/edit_report"})
public class EditReportStudentServlet extends HttpServlet {

    private static final String VIEW_PATH = "/Edit_Report.jsp";

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

        int id = Integer.parseInt(request.getParameter("id"));
        Report report = reportDAO.getReportById(id);
        Task task = taskDAO.getTaskByID(report.getTaskId());
        report.setTask(task);
        request.setAttribute("report", report);

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
        int id = Integer.parseInt(request.getParameter("id"));
        String workDone = request.getParameter("workDone");
        String planningTomorrow = request.getParameter("planningTomorrow");
        String issue = request.getParameter("issue");
        String notes = request.getParameter("notes");
        int taskId = Integer.parseInt(request.getParameter("taskId"));

        Report report = reportDAO.getReportById(id);
        report.setDate(date);
        report.setWorkDone(workDone);
        report.setPlanningTomorrow(planningTomorrow);
        report.setIssue(issue);
        report.setNotes(notes);
        report.setTaskId(taskId);

        Report addedReport = reportDAO.updateReport(report);
        if (addedReport == null) {
            request.setAttribute("error", "Update report failed. Please try again!");
            doGet(request, response);
            return;
        }

        request.setAttribute("success", "Updated report successfully!");
        doGet(request, response);
    }

}
