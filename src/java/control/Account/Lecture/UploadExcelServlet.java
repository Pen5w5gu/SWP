/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.Account.Lecture;

import Dao.AccountDAO;
import Dao.ClassDAO;
import Dao.InDAO;
import Dao.JoinDAO;
import Dao.ProjectDAO;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.util.Base64;
import java.util.Random;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import model.User;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import static util.Email.sendEmail;

/**
 *
 * @author acer
 */
@MultipartConfig
public class UploadExcelServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String AES_ALGORITHM = "AES";
    private static final String KEY = "njfvsdf2342fe123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        if (session != null && session.getAttribute("session") != null) {
        User user = (User) session.getAttribute("session");
        int user_id = user.getId_account();
        response.setContentType("text/html;charset=UTF-8");
        SecretKey secretKey = generateSecretKey();
        String new_class = request.getParameter("class_name");
        ClassDAO cdao = new ClassDAO();
        AccountDAO adao = new AccountDAO();
        ProjectDAO pdao = new ProjectDAO();
        JoinDAO jdao =  new JoinDAO();
        InDAO idao = new InDAO();
        cdao.addClass(new_class);
        int id_class = cdao.getIdByName(new_class);

// Lấy phần tải lên từ request
        Part filePart = request.getPart("file");

// Tạo đường dẫn lưu trữ tạm thời cho tệp
        String fileName = filePart.getSubmittedFileName();
        String path = getServletContext().getRealPath("/WEB-INF/" + fileName);
        File file = new File(path);

// Lưu tệp đã tải lên vào đường dẫn tạm thời
        filePart.write(path);

// Đọc tệp Excel và hiển thị dữ liệu
        try ( FileInputStream fis = new FileInputStream(file);  XSSFWorkbook wb = new XSSFWorkbook(fis)) {
            XSSFSheet sheet = wb.getSheetAt(0);
            FormulaEvaluator formulaEvaluator = wb.getCreationHelper().createFormulaEvaluator();
            StringBuilder result = new StringBuilder();

            // Lặp qua các hàng trong tệp Excel
            int rowCount = 0; // Biến đếm dòng
            for (Row row : sheet) {
                // Bỏ qua dòng đầu tiên (index 0)
                if (rowCount == 0) {
                    rowCount++;
                    continue;
                }

                String studentName = ""; // Thay đổi tên biến theo quy tắc camelCase
                String email = "";
                String roleProject = "";
                String project = ""; // Thay đổi tên biến theo quy tắc camelCase

                // Đảm bảo chỉ lấy dữ liệu từ 4 cột đầu tiên (A, B, C, D)
                for (int i = 0; i < 4; i++) {
                    Cell cell = row.getCell(i);
                    if (cell != null) {
                        switch (formulaEvaluator.evaluateInCell(cell).getCellType()) {
                            case Cell.CELL_TYPE_NUMERIC:
                                // Kiểm tra từng cột và gán giá trị cho biến tương ứng
                                if (i == 0) {
                                    studentName = String.valueOf(cell.getNumericCellValue());
                                } else if (i == 1) {
                                    email = String.valueOf(cell.getNumericCellValue());
                                } else if (i == 2) {
                                    roleProject = String.valueOf(cell.getNumericCellValue());
                                } else if (i == 3) {
                                    project = String.valueOf(cell.getNumericCellValue());
                                }
                                result.append(cell.getNumericCellValue()).append("\t\t");
                                break;
                            case Cell.CELL_TYPE_STRING:
                                // Kiểm tra từng cột và gán giá trị cho biến tương ứng
                                if (i == 0) {
                                    studentName = cell.getStringCellValue();
                                } else if (i == 1) {
                                    email = cell.getStringCellValue();
                                } else if (i == 2) {
                                    roleProject = cell.getStringCellValue();
                                } else if (i == 3) {
                                    project = cell.getStringCellValue();
                                }
                                result.append(cell.getStringCellValue()).append("\t\t");
                                break;
                        }

                    }

                }
                // lay id
                int projectId = pdao.getIDProjectByName(project);
                // check chua ton tai
                if (projectId == -1) {
                    
                    Date startDate = null; // Ngày bắt đầu là null
                    Date endDate = null; // Ngày kết thúc là null
                    pdao.addProjectByName(project, "",startDate, endDate);
                    // Retrieve the ID of the newly added project
                    projectId = pdao.getIDProjectByName(project);
                }
                
                
                //add to Join table
                jdao.AddJoin(adao.getIDbyEmail(email), projectId);
                //add to In table
                idao.AddIn(adao.getIDbyEmail(email), id_class);
                //create accunt with status = Flase
                String raw_pass = randomCode(5);
                String pass_hashed = encrypt(raw_pass, secretKey);
                sendEmail(email, "New Account", raw_pass);
                adao.RegisterStudent(email, pass_hashed, studentName, roleProject);
                result.append("\n");
                // Tại đây bạn có thể thực hiện xử lý với dữ liệu đã đọc được từ từng dòng, ví dụ: lưu vào cơ sở dữ liệu, xử lý logic, ...
                rowCount++;

            }

            // Gửi kết quả về cho client
            response.getWriter().println(result.toString());
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            // Xóa tệp tạm thời sau khi đã xử lý
            if (file.exists()) {
                file.delete();
            }
            idao.AddIn(user_id, id_class);
            
            request.getRequestDispatcher("lectureview").forward(request, response);
        }
        }else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

    public static String randomCode(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder randomCode = new StringBuilder();

        Random random = new Random();
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            randomCode.append(characters.charAt(index));
        }

        return randomCode.toString();
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
// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
