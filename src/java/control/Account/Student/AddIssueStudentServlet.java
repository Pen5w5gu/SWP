package control.Account.Student;

import Dao.IssueDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import model.Project;
import model.User;
import model.Issue;

/**
 *
 * @author ns
 */
@WebServlet(name = "AddIssueStudentServlet", urlPatterns = {"/add_issue"})
public class AddIssueStudentServlet extends HttpServlet {

    private static final String VIEW_PATH = "/Add_Issue.jsp";

    private final IssueDAO issueDAO = new IssueDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("session") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
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

        Project project = (Project) session.getAttribute("project");
        int projectId = project.getId_Project();

        // Retrieve form parameters
        String name = request.getParameter("name");
        String content = request.getParameter("content");
        String status = request.getParameter("status");

        // Create Issue object
        Issue issue = new Issue();
        issue.setName(name);
        issue.setContent(content);
        issue.setStatus(status);

        issue.setCreatedAt(Timestamp.valueOf(LocalDateTime.now()));
        issue.setAccountId(accountId);
        issue.setProjectId(projectId);

        Issue addedIssue = issueDAO.addIssue(issue);

        if (addedIssue == null) {
            request.setAttribute("error", "Add issue failed. Please try again!");
            request.getRequestDispatcher(VIEW_PATH).forward(request, response);
            return;
        }

        request.setAttribute("success", "Added issue successfully!");
        request.getRequestDispatcher(VIEW_PATH).forward(request, response);
    }

}
