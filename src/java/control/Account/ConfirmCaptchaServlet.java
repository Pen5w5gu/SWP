/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.Account;

import Dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author acer
 */
public class ConfirmCaptchaServlet extends HttpServlet {

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
        String email = (String) request.getParameter("email");
        String password = (String) request.getParameter("password");
        String func = (String) request.getParameter("func");
        String enter_captcha = request.getParameter("captcha");
        String username = request.getParameter("username");
        
        HttpSession session = request.getSession();
        String storedCaptcha = (String) session.getAttribute("default_captcha");
        
        SecretKey secretKey = generateSecretKey();
        String hashed_password="";
        try {
            hashed_password = encrypt(password, secretKey);
        } catch (Exception ex) {
            Logger.getLogger(ConfirmCaptchaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
            
                    AccountDAO user = new AccountDAO();
                    user.Register(email, hashed_password,username);
        if (func=="regis") {
            if (enter_captcha.equalsIgnoreCase(storedCaptcha)) {
//                try {
//                    SecretKey secretKey = generateSecretKey();
//                    String hashed_password = encrypt(password, secretKey);
//
//                    AccountDAO user = new AccountDAO();
//                    user.Register(email, hashed_password);
//                } catch (Exception ex) {
//                    Logger.getLogger(ConfirmCaptchaServlet.class.getName()).log(Level.SEVERE, null, ex);
//                }
            }
        } else if ("forgot".equalsIgnoreCase(func)) {
             if (enter_captcha.equalsIgnoreCase(storedCaptcha)) {
                request.setAttribute("email", email);
            }
        }
        
        request.getRequestDispatcher("login.jsp").forward(request, response);
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

    }

    private static String encrypt(String plainText, SecretKey secretKey) throws Exception {
        Cipher cipher = Cipher.getInstance(AES_ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
        byte[] encryptedBytes = cipher.doFinal(plainText.getBytes(StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(encryptedBytes);
    }

    private static SecretKey generateSecretKey() {
        return new SecretKeySpec(KEY.getBytes(StandardCharsets.UTF_8), AES_ALGORITHM);
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
