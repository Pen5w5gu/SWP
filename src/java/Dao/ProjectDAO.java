/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import model.Project;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author tieup
 */
public class ProjectDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public Project getProjectsByUser(int accountId) {
        try {
            String sql = "SELECT p.*\n"
                    + "FROM Project p\n"
                    + "JOIN [Join] j ON p.Id_Project = j.Id_Project\n"
                    + "WHERE j.ID_account = ? AND j.Allow_access = 1;";
            try ( PreparedStatement ps = connection.prepareStatement(sql)) {

                ps.setInt(1, accountId);

                try ( ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        Project p = new Project(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getDate(5));
                        return p;
                    }
                }
            }
        } catch (SQLException ex) {
        }
        return null; // Return null if no project is found
    }

    public List<Project> getProjectbyClass(String class_name) {
        List<Project> projects = new ArrayList<>();

        try {
            String strSelect = "SELECT    DISTINCT Project.*\n"
                    + "FROM         Account INNER JOIN\n"
                    + "                      [In] ON Account.ID_account = [In].ID_account INNER JOIN\n"
                    + "                      class ON [In].ID_class = class.Id_class INNER JOIN\n"
                    + "                      [Join] ON Account.ID_account = [Join].ID_account INNER JOIN\n"
                    + "                      Project ON [Join].Id_Project = Project.Id_Project INNER JOIN\n"
                    + "                      role ON Account.Id_role = role.Id_role\n"
                    + "where class.Class_name=? and role.Id_role = 2";
            ps = connection.prepareStatement(strSelect);
            ps.setString(1, class_name);
            rs = ps.executeQuery();
            while (rs.next()) {
                projects.add(new Project(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getDate(5)));
            }
            return projects;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return projects;
    }


    public boolean addProjectByName(String projectName, String description, Date startDate, Date endDate) {
        // Default values for description, start date, and end date if not provided
        if (description == null) {
            description = ""; // Default description is an empty string
        }
        if (startDate == null) {
            startDate = new Date(System.currentTimeMillis()); // Default start date is the current date
        }
        if (endDate == null) {
            endDate = new Date(System.currentTimeMillis()); // Default end date is also the current date
        }

        try {
            // SQL query to insert a new project with the given name, description, start date, and end date
            String sql = "INSERT INTO Project (Project_name, Project_description, Start_date, End_date) VALUES (?, ?, ?, ?)";

            // Create a prepared statement
            try ( PreparedStatement ps = connection.prepareStatement(sql)) {
                // Set parameters for project name, description, start date, and end date
                ps.setString(1, projectName);
                ps.setString(2, description);
                ps.setDate(3, startDate);
                ps.setDate(4, endDate);

                // Execute the insert query
                int rowsAffected = ps.executeUpdate();

                // Check if any rows were affected (i.e., if the insertion was successful)
                if (rowsAffected > 0) {
                    return true; // Return true if the project was added successfully
                }
            }
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }

        return false; // Return false if the project addition failed
    }

    public int getIDProjectByName(String projectName) {
        try {
            // SQL query to select the ID of the project with the given name
            String sql = "SELECT Id_Project FROM Project WHERE Project_Name = ?";

            // Create a prepared statement
            try ( PreparedStatement ps = connection.prepareStatement(sql)) {
                // Set the project name parameter
                ps.setString(1, projectName);

                // Execute the select query
                try ( ResultSet rs = ps.executeQuery()) {
                    // Check if a result set is returned
                    if (rs.next()) {
                        // Retrieve and return the ID of the project
                        return rs.getInt("Id_Project");
                    }
                }
            }
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }

        return -1; // Return -1 if the project ID retrieval failed
    }

    public static void main(String[] args) {
        ProjectDAO dao = new ProjectDAO();

        Date startDate = null; // Ngày bắt đầu là null
        Date endDate = null; // Ngày kết thúc là null
        System.out.println(dao.addProjectByName("project 5", "", startDate, endDate));

    }
}
