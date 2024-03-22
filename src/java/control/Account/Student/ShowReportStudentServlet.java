package control.Account.Student;

import Dao.ReportDAO;
import Dao.TaskDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Task;
import model.User;
import model.Report;

@WebServlet(name = "ShowReportStudentServlet", urlPatterns = {"/report"})
public class ShowReportStudentServlet extends HttpServlet {

    private static final String VIEW_PATH = "/Report.jsp";

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

        User user = (User) session.getAttribute("session");
        int accountId = user.getId_account();

        List<Report> reports = reportDAO.getReportsByAccountId(accountId);

        for (Report report : reports) {
            Task task = taskDAO.getTaskByID(report.getTaskId());
            report.setTask(task);
        }

        request.setAttribute("reports", reports);

        request.getRequestDispatcher(VIEW_PATH).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
