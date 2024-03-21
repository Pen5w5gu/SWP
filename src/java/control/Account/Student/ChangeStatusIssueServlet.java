package control.Account.Student;

import Dao.IssueDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Issue;

/**
 *
 * @author ns
 */
@WebServlet(name = "ChangeStatusIssueServlet", urlPatterns = {"/change_status_issue"})
public class ChangeStatusIssueServlet extends HttpServlet {

    private final IssueDAO issueDAO = new IssueDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int issueId = Integer.parseInt(request.getParameter("issueId"));
        String status = request.getParameter("status");
        Issue issue = issueDAO.getIssueById(issueId);
        issue.setStatus(status);
        issueDAO.updateIssue(issue);
    }

}
