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
public class CommentDAO extends DBContext {

    private List<Comment> list = new ArrayList<>();

    PreparedStatement ps = null;
    ResultSet rs = null;

    //created by Tung
    public boolean AddComment(String comment, int task_id, int id_account) {
        try {
            // Define the SQL query
            String strInsert = "INSERT INTO [dbo].[Comment]\n"
                    + "           ([Comment_description]\n"
                    + "           ,[Id_task]\n"
                    + "           ,[id_Account])\n"
                    + "     VALUES\n"
                    + "           (?,?,?)";

            // Create the PreparedStatement object
            PreparedStatement ps = connection.prepareStatement(strInsert);

            // Set parameters for the prepared statement
            ps.setString(1, comment);
            ps.setInt(2, task_id);
            ps.setInt(3, id_account);
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
    public List<Comment> getCommentByTask(int task_id) {
        List<Comment> comments = new ArrayList<>();

        try {
            String strSelect = "SELECT Comment.* "
                    + "FROM Project "
                    + "INNER JOIN milestone ON Project.Id_Project = milestone.Id_Project "
                    + "INNER JOIN Task ON milestone.Id_milestone = Task.Id_milestone "
                    + "INNER JOIN Comment ON Task.Id_task = Comment.Id_task "
                    + "WHERE Task.Id_task = ? "
                    + "ORDER BY Comment.Id_comment DESC"; // Sắp xếp theo Id_comment từ cao đến thấp
            ps = connection.prepareStatement(strSelect);
            ps.setInt(1, task_id);
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
    
    public boolean EditComment(String comment, int Id_comment) {
        try {
            // Define the SQL query
            String strInsert = "UPDATE Comment\n"
                    + "SET Comment_description = ?\n"
                    + "WHERE Id_comment = ?;";

            // Create the PreparedStatement object
            PreparedStatement ps = connection.prepareStatement(strInsert);

            // Set parameters for the prepared statement
            ps.setString(1, comment);
            ps.setInt(2, Id_comment);
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
    public List<Comment> getCommentByTaskAndProject(int task_id, int project_id) {
        List<Comment> comments = new ArrayList<>();

        try {
            String strSelect = "SELECT    Comment.*\n"
                    + "FROM         Project INNER JOIN\n"
                    + "                      milestone ON Project.Id_Project = milestone.Id_Project INNER JOIN\n"
                    + "                      Task ON milestone.Id_milestone = Task.Id_milestone INNER JOIN\n"
                    + "                      Comment ON Task.Id_task = Comment.Id_task\n"
                    + "		where Task.Id_task=? and Project.Id_Project=?";
            ps = connection.prepareStatement(strSelect);
            ps.setInt(1, task_id);
            ps.setInt(2, project_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                comments.add(new Comment());
            }
            return comments;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return comments;
    }
    
    //created by Tung
public boolean deleteComment(int comment_id) {
    try {
        // Define the SQL query for deleting the comment
        String strDelete = "DELETE FROM Comment WHERE Id_comment = ?";

        // Create the PreparedStatement object
        PreparedStatement ps = connection.prepareStatement(strDelete);

        // Set parameters for the prepared statement
        ps.setInt(1, comment_id);

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

    
    //created by Tung
    public boolean editComment(String comment, int comment_id) {
    try {
        // Define the SQL query for updating the comment
        String strUpdate = "UPDATE [dbo].[Comment]\n"
                + "SET [comment_description] = ?\n"
                + "WHERE [id_comment] = ?";

        // Create the PreparedStatement object
        PreparedStatement ps = connection.prepareStatement(strUpdate);

        // Set parameters for the prepared statement
        ps.setString(1, comment);
        ps.setInt(2, comment_id);

        // Execute the update
        int rowsAffected = ps.executeUpdate();

        // Check if any rows were affected
        if (rowsAffected > 0) {
            return true;  // Comment updated successfully
        } else {
            return false; // No rows affected, comment not updated (perhaps the comment_id doesn't exist)
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
        CommentDAO cdeo = new CommentDAO();
        System.out.println(cdeo.deleteComment(3));
    }

    

   

    
    
   
}
