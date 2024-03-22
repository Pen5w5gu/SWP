package control.Account.Student;

import Dao.ReportDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "DeleteReportStudentServlet", urlPatterns = {"/delete_report"})
public class DeleteReportStudentServlet extends HttpServlet {

    private final ReportDAO reportDAO = new ReportDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("session") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));

        reportDAO.deleteReport(id);

        response.sendRedirect(request.getContextPath() + "/report");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
