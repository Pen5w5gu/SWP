/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.Account.Student;

import Dao.CommentIssueDAO;
import Dao.IssueDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Comment;
import model.User;
import model.Issue;

@WebServlet(name = "ShowCommentIssueServlet", urlPatterns = {"/comment_issue"})
public class ShowCommentIssueServlet extends HttpServlet {

    private final IssueDAO issueDAO = new IssueDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("session") != null) {
            User user = (User) session.getAttribute("session");
            CommentIssueDAO cdao = new CommentIssueDAO();

            int accountId = user.getId_account();
            int issueId = Integer.parseInt(request.getParameter("id"));

            Issue issue = issueDAO.getIssueById(issueId);

            List<Comment> comments = cdao.getCommentByIssueId(issueId);
            request.setAttribute("comments", comments);
            request.setAttribute("issue", issue);
            request.setAttribute("issueId", issueId);

            request.getRequestDispatcher("Issue_Comment.jsp").forward(request, response);

        } else {
            // User is not logged in or session doesn't exist, redirect to the login page
            response.sendRedirect("login.jsp");
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
