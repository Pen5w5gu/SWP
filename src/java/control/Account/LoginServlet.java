/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.Account;

import Dao.AccountDAO;
import Dao.ClassDAO;
import Dao.ProjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import model.Project;
import model.User;
import model.Class;

/**
 *
 * @author tieup
 */
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String AES_ALGORITHM = "AES";
    private static final String KEY = "njfvsdf2342fe123";

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");

// Use a more secure method to obtain the secret key (e.g., KeyGenerator)
        SecretKey secretKey = generateSecretKey();

        AccountDAO dao = new AccountDAO();
        ProjectDAO pdao = new ProjectDAO();
        ClassDAO cdao = new ClassDAO();
        HttpSession session = request.getSession();

        String hashed_password = "";

        try {
            // Use a more secure method to hash passwords (e.g., PBKDF2 or BCrypt)
            hashed_password = encrypt(password, secretKey);
            if (!dao.checkAccount(email, hashed_password)) {
                request.setAttribute("error", "Incorrect email or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                if (dao.checkStatus(email) == 1) {
                    User user = dao.getUser(email);
                    if (user.getId_role() == 1) {

                        Cookie loginCookie = new Cookie("username", email);
                        loginCookie.setMaxAge(3600); // Set the maximum age of the cookie in seconds
                        response.addCookie(loginCookie);

                        List<Class> classes = cdao.getClassByUser(user.getId_account());
                        session.setAttribute("session", user);
                        request.setAttribute("classes", classes);
                        request.getRequestDispatcher("Homepagelecture.jsp").forward(request, response);
                    } else {
                        int ID_user = user.getId_account();
                        List<Project> p = pdao.getProjectbyIdAccount(ID_user);
                        request.setAttribute("projects", p);
                        session.setAttribute("session", user);
                        request.getRequestDispatcher("Homepagestudent.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("email", email);
                    request.getRequestDispatcher("setPassword.jsp").forward(request, response);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            // Handle exception appropriately, for example, redirect to an error page
        }

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
    private static String encrypt(String plainText, SecretKey secretKey) throws Exception {
        Cipher cipher = Cipher.getInstance(AES_ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
        byte[] encryptedBytes = cipher.doFinal(plainText.getBytes(StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(encryptedBytes);
    }

    private static SecretKey generateSecretKey() {
        return new SecretKeySpec(KEY.getBytes(StandardCharsets.UTF_8), AES_ALGORITHM);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
