package control.Account.Student;

import Dao.IssueDAO;
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
import model.Issue;
import model.Project;

/**
 *
 * @author ns
 */
@WebServlet(name = "ShowIssueStudentServlet", urlPatterns = {"/issue"})
public class ShowIssueStudentServlet extends HttpServlet {

    private static final String VIEW_PATH = "/Issue.jsp";

    private final TaskDAO taskDAO = new TaskDAO();

    private final ReportDAO reportDAO = new ReportDAO();

    private final IssueDAO issueDAO = new IssueDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("session") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        Project project = (Project) session.getAttribute("project");
        int projectId = project.getId_Project();

        List<Issue> issues = issueDAO.getIssuesByProjectId(projectId);

        request.setAttribute("issues", issues);

        request.getRequestDispatcher(VIEW_PATH).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
