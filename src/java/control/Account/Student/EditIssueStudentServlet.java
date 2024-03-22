package control.Account.Student;

import Dao.IssueDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Issue;

@WebServlet(name = "EditIssueStudentServlet", urlPatterns = {"/edit_issue"})
public class EditIssueStudentServlet extends HttpServlet {
    
    private static final String VIEW_PATH = "/Edit_Issue.jsp";
    
    private final IssueDAO issueDAO = new IssueDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("session") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        int id = Integer.parseInt(request.getParameter("id"));
        Issue issue = issueDAO.getIssueById(id);
        request.setAttribute("issue", issue);
        
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

        int id = Integer.parseInt(request.getParameter("id"));
        Issue issue = issueDAO.getIssueById(id);

        // Retrieve form parameters
        String name = request.getParameter("name");
        String content = request.getParameter("content");
        String status = request.getParameter("status");

        issue.setName(name);
        issue.setContent(content);
        issue.setStatus(status);
        
        boolean check = issueDAO.updateIssue(issue);
        
        request.setAttribute("issue", issue);
        
        if (!check) {
            request.setAttribute("error", "Edit issue failed. Please try again!");
            request.getRequestDispatcher(VIEW_PATH).forward(request, response);
            return;
        }
        
        request.setAttribute("success", "Edited issue successfully!");
        request.getRequestDispatcher(VIEW_PATH).forward(request, response);
    }
    
}
