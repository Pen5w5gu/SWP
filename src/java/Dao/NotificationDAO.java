/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import model.Notification;

/**
 *
 * @author quann
 */
public class NotificationDAO extends DBContext {

    private List<Notification> list = new ArrayList<>();

    PreparedStatement ps = null;
    ResultSet rs = null;

    public boolean AddNoti(int Id_account, int Id_Project, int idTask, String Noti) {
        Connection connection = null;
        PreparedStatement ps = null;

        try {
            // Get current date
            Calendar calendar = Calendar.getInstance();
            Date date = new Date(calendar.getTime().getTime());

            // Define the SQL query
            String strInsert = "INSERT INTO [dbo].[Notification] "
                    + "([account_id],[Id_Project], [Id_task], [notification], [date]) "
                    + "VALUES (?, ?, ?, ?, ?)";

            // Create the PreparedStatement object
            ps = connection.prepareStatement(strInsert);

            // Set parameters for the prepared statement
            ps.setInt(1, Id_account);
            ps.setInt(2, Id_Project);
            ps.setInt(3, idTask);
            ps.setString(4, Noti);
            ps.setDate(5, date);

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

    public List<Notification> getAllNotiInProject(int Id_Project) {
        List<Notification> notifications = new ArrayList<>();

        try {
            String strSelect = "select * from Notification\n"
                    + "where Id_Project = ? ";
            ps = connection.prepareStatement(strSelect);
            ps.setInt(1, Id_Project);
            rs = ps.executeQuery();
            while (rs.next()) {
                notifications.add(new Notification());
            }
            return notifications;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return null;
    }

}
