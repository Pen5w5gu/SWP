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

/**
 *
 * @author acer
 */
public class CommentIssueDAO extends DBContext {

    private List<Comment> list = new ArrayList<>();

    PreparedStatement ps = null;
    ResultSet rs = null;

    //created by Tung
    public boolean AddComment(String comment, int issueId, int accountId) {
        try {
            // Define the SQL query
            String strInsert = "INSERT INTO [dbo].[Comment_Issue]\n"
                    + "           ([content]\n"
                    + "           ,[issue_id]\n"
                    + "           ,[account_id])\n"
                    + "     VALUES\n"
                    + "           (?,?,?)";

            // Create the PreparedStatement object
            PreparedStatement ps = connection.prepareStatement(strInsert);

            // Set parameters for the prepared statement
            ps.setString(1, comment);
            ps.setInt(2, issueId);
            ps.setInt(3, accountId);
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

    public List<Comment> getCommentByIssueId(int issueId) {
        List<Comment> comments = new ArrayList<>();

        try {
            String strSelect = "SELECT * "
                    + "FROM Comment_Issue "
                    + "WHERE issue_id = ? "
                    + "ORDER BY id DESC"; // Sắp xếp theo Id_comment từ cao đến thấp
            ps = connection.prepareStatement(strSelect);
            ps.setInt(1, issueId);
            rs = ps.executeQuery();
            while (rs.next()) {
                comments.add(new Comment(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4)));
            }
            return comments;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return comments;
    }

    public boolean editComment(String content, int id) {
        try {
            // Define the SQL query
            String strInsert = "UPDATE Comment_Issue \n"
                    + "SET content = ?\n"
                    + "WHERE id = ?;";

            // Create the PreparedStatement object
            PreparedStatement ps = connection.prepareStatement(strInsert);

            // Set parameters for the prepared statement
            ps.setString(1, content);
            ps.setInt(2, id);
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

    //created by Tung
    public boolean deleteComment(int id) {
        try {
            // Define the SQL query for deleting the comment
            String strDelete = "DELETE FROM Comment_Issue WHERE id = ?";

            // Create the PreparedStatement object
            PreparedStatement ps = connection.prepareStatement(strDelete);

            // Set parameters for the prepared statement
            ps.setInt(1, id);

            // Execute the deletion
            int rowsAffected = ps.executeUpdate();

            // Check if any rows were affected
            if (rowsAffected > 0) {
                return true;  // Comment deleted successfully
            } else {
                return false; // No rows affected, comment not deleted (perhaps the comment_id doesn't exist)
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
