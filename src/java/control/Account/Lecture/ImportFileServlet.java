package control.Account.Lecture;


import java.io.InputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import org.apache.poi.ss.usermodel.*;



public class ImportFileServlet extends HttpServlet {
    
    private static final Logger LOGGER = Logger.getLogger(ImportFileServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            InputStream inputStream = null;
            Part filePart = request.getPart("file");
            if (filePart != null) {
                inputStream = filePart.getInputStream();
            }
            
            try (Workbook workbook = WorkbookFactory.create(inputStream)) {
                int numberOfSheets = workbook.getNumberOfSheets();
                for (int i = 0; i < numberOfSheets; i++) {
                    Sheet sheet = workbook.getSheetAt(i);
                    out.println("<h2>Sheet " + (i + 1) + "</h2>");
                    for (Row row : sheet) {
                        for (Cell cell : row) {
                            switch (cell.getCellTypeEnum()) {
                                case STRING:
                                    out.print(cell.getStringCellValue() + "\t");
                                    break;
                                case NUMERIC:
                                    out.print(cell.getNumericCellValue() + "\t");
                                    break;
                                case BOOLEAN:
                                    out.print(cell.getBooleanCellValue() + "\t");
                                    break;
                                case BLANK:
                                    out.print("\t");
                                    break;
                                default:
                                    out.print("\t");
                            }
                        }
                        out.println("<br/>");
                    }
                }
            } catch (Exception ex) {
                LOGGER.log(Level.SEVERE, "Error processing Excel file", ex);
                out.println("Error processing Excel file. Please check the log for details.");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
