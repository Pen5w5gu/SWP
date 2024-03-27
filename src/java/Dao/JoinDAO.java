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
import model.Join;

/**
 *
 * @author acer
 */
public class JoinDAO extends DBContext {

    private List<Join> list = new ArrayList<>();

    PreparedStatement ps = null;
    ResultSet rs = null;

    public boolean AddJoin(int iD_account, int Id_Project) {
        try {
            // Define the SQL query
            String strInsert = "INSERT INTO [dbo].[Join]\n"
                    + "           ([ID_account]\n"
                    + "           ,[Id_Project]\n"
                    + "           ,[Allow_access])\n"
                    + "     VALUES\n"
                    + "           (?,?,?)";

            // Create the PreparedStatement object
            PreparedStatement ps = connection.prepareStatement(strInsert);

            // Set parameters for the prepared statement
            ps.setInt(1, iD_account);
            ps.setInt(2, Id_Project);
            ps.setInt(3, 1);
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
        JoinDAO jdao = new JoinDAO();
        System.out.println(jdao.AddJoin(6, 5));
    }

}
