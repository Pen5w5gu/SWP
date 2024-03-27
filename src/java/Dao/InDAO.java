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
import model.In;

/**
 *
 * @author acer
 */
public class InDAO extends DBContext {

    private List<In> list = new ArrayList<>();

    PreparedStatement ps = null;
    ResultSet rs = null;

    public boolean AddIn(int iD_account, int iD_class) {
        try {
            // Define the SQL query
            String strInsert = "INSERT INTO [dbo].[In]\n"
                    + "           ([ID_account]\n"
                    + "           ,[ID_class])\n"
                    + "     VALUES\n"
                    + "           (?,?)\n";

            // Create the PreparedStatement object
            PreparedStatement ps = connection.prepareStatement(strInsert);

            // Set parameters for the prepared statement
            ps.setInt(1, iD_account);
            ps.setInt(2, iD_class);
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
    public static void main(String[] args) {
        InDAO dao = new InDAO();
        System.out.println(dao.AddIn(1, 26));
    }
}
