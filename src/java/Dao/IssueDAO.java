/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Comment;
import model.Issue;

/**
 *
 * @author acer
 */
public class IssueDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public boolean AddIssue(int id_mileStone, String Tittle, String Content, int status, int id_author, Date date) {
        try {
            // Define the SQL query
            String strInsert = "INSERT INTO [dbo].[Issue]\n"
                    + "           ([Id_milestone]\n"
                    + "           ,[Title]\n"
                    + "           ,[Content]\n"
                    + "           ,[Status]\n"
                    + "           ,[Id_author]\n"
                    + "           ,[Date])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?)";

            // Create the PreparedStatement object
            PreparedStatement ps = connection.prepareStatement(strInsert);

            // Set parameters for the prepared statement
            ps.setInt(1, id_mileStone);
            ps.setString(2, Tittle);

            ps.setString(3, Content);

            ps.setInt(4, status);

            ps.setInt(5, id_author);

            ps.setDate(6, date);

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

    public List<Issue> getIssueByProject(int project_id) {
        List<Issue> Issues = new ArrayList<>();

        try {
            String strSelect = "SELECT    Issue.*\n"
                    + "FROM         Issue INNER JOIN\n"
                    + "                      milestone ON Issue.Id_milestone = milestone.Id_milestone INNER JOIN\n"
                    + "                      Project ON milestone.Id_Project = Project.Id_Project\n"
                    + "	where Project.Id_Project=? AND Issue.status = 'true';"; // Sắp xếp theo Id_comment từ cao đến thấp
            ps = connection.prepareStatement(strSelect);
            ps.setInt(1, project_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Issues.add(new Issue(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getDate(7)));
            }
            return Issues;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return Issues;
    }

    public List<Issue> getClosedIssueByProject(int project_id) {
        List<Issue> Issues = new ArrayList<>();

        try {
            String strSelect = "SELECT Issue.*\n"
                    + "FROM Issue \n"
                    + "INNER JOIN milestone ON Issue.Id_milestone = milestone.Id_milestone \n"
                    + "INNER JOIN Project ON milestone.Id_Project = Project.Id_Project\n"
                    + "WHERE Project.Id_Project = ? AND Issue.status = 'false';"; // 
            ps = connection.prepareStatement(strSelect);
            ps.setInt(1, project_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Issues.add(new Issue(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getDate(7)));
            }
            return Issues;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return Issues;
    }

    public boolean ChangeStatus(int issuesID, int Status) {
        try {

                String strInsert = "Update [dbo].Issue\n"
                        + "SET \n"
                        + "Status = ?\n"
                        + "where Id_issue = ?";
                PreparedStatement ps = connection.prepareStatement(strInsert);
                ps.setInt(1, Status);
                ps.setInt(2, issuesID);

                // Execute the update
                int rowsAffected = ps.executeUpdate();

                // Check if any rows were affected
                if (rowsAffected > 0) {
                    return true;
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
        
        IssueDAO dao = new IssueDAO();

//        Date date = Date.valueOf("2022-12-12");
//        List<Issue> list = dao.getIssueByProject(1);
        System.out.println(dao.ChangeStatus(1, 1));
    }

}
