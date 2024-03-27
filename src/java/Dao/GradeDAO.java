/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Comment;

/**
 *
 * @author acer
 */
public class GradeDAO extends DBContext {

    private List<Comment> list = new ArrayList<>();

    PreparedStatement ps = null;
    ResultSet rs = null;

    public boolean GradeStudent(int daily, int code, int document, int present, int id_project) {

        try {
            // Define the SQL query
            String strInsert = "INSERT INTO [dbo].[grade]\n"
                    + "           ([Grade_Dailyreport]\n"
                    + "           ,[Grade_Code]\n"
                    + "           ,[Grade_Document]\n"
                    + "           ,[Grade_Presentation]\n"
                    + "           ,[Id_Project])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?)";

            // Create the PreparedStatement object
            PreparedStatement ps = connection.prepareStatement(strInsert);

            // Set parameters for the prepared statement
            ps.setInt(1, daily);
            ps.setInt(2, code);
            ps.setInt(3, document);
            ps.setInt(4, present);
            ps.setInt(5, id_project);

            // Execute the update
            int rowsAffected = ps.executeUpdate();

            // Check if any rows were affected
            if (rowsAffected > 0) {
                return true;  // Task added successfully
            } else {
                return false; // No rows affected, task not added
            }
        } catch (SQLException e) {
            // Handle any SQL exceptions
            e.printStackTrace();
            return false;
        } finally {
            // Close PreparedStatement if necessary (preferably in a separate finally block)
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

}
