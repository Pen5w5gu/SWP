package Dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.Task;

/**
 *
 * @author acer
 */
public class TaskDAO extends DBContext {

    // Use more specific List interface rather than ArrayList in the declaration
    private List<Task> list = new ArrayList<>();

    PreparedStatement ps = null;
    ResultSet rs = null;

    //created by Tung
    public List<Task> getTaskByProject(int project_id) {
        List<Task> tasks = new ArrayList<>();

        try {
            String strSelect = "SELECT    Task.*\n"
                    + "FROM         milestone INNER JOIN\n"
                    + "                      Project ON milestone.Id_Project = Project.Id_Project INNER JOIN\n"
                    + "                      Task ON milestone.Id_milestone = Task.Id_milestone\n"
                    + "					  where Project.Id_Project=?";
            ps = connection.prepareStatement(strSelect);
            ps.setInt(1, project_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                tasks.add(new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getDate(5), rs.getInt(6), rs.getInt(7), rs.getInt(8)));
            }
            return tasks;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return tasks;
    }

    //created by Tung
    public List<Task> getTaskByProjectAndMileStone(int project_id, int milestone_id) {
        List<Task> tasks = new ArrayList<>();
        try {
            String strSelect = "SELECT Task.* "
                    + "FROM milestone "
                    + "INNER JOIN Project ON milestone.Id_Project = Project.Id_Project "
                    + "INNER JOIN Task ON milestone.Id_milestone = Task.Id_milestone "
                    + "WHERE Project.Id_Project=? AND milestone.Id_milestone=?";
            ps = connection.prepareStatement(strSelect);
            ps.setInt(1, project_id);
            ps.setInt(2, milestone_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                tasks.add(new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getDate(5), rs.getInt(6), rs.getInt(7), rs.getInt(8)));
            }
            return tasks;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return tasks;
    }

    //created by Tung
    public boolean AddTask(String taskName, String taskDescription, Date startDate, Date endDate, int assign_to, int taskTypeId, int milestoneId) {
        try {
            // Define the SQL query
            String strInsert = "INSERT INTO Task (task_name, task_description, start_date, end_date, assign_to, taskType_id, id_milestone) VALUES (?, ?, ?, ?, ?, ?, ?)";

            // Create the PreparedStatement object
            PreparedStatement ps = connection.prepareStatement(strInsert);

            // Set parameters for the prepared statement
            ps.setString(1, taskName);
            ps.setString(2, taskDescription);
            ps.setDate(3, startDate);
            ps.setDate(4, endDate);
            ps.setInt(5, assign_to);
            ps.setInt(6, taskTypeId);
            ps.setInt(7, milestoneId);

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
    public boolean changeTaskType(int taskId, int newTaskTypeId) {
        PreparedStatement ps = null;
        try {
            // SQL statement to update the taskType of a task
            String query = "UPDATE Task SET taskType_Id = ? WHERE Id_task = ?";
            if (newTaskTypeId == 1 || newTaskTypeId == 4) {
                query = "UPDATE [dbo].[Task]\n"
                        + "   SET \n"
                        + "      [assign_to] = 0,\n"
                        + "	  [taskType_Id]=?\n"
                        + "\n"
                        + " WHERE Task.Id_task = ?";
            }

            // Create PreparedStatement
            ps = connection.prepareStatement(query);

            // Set parameters for the SQL statement
            ps.setInt(1, newTaskTypeId);
            ps.setInt(2, taskId);

            // Execute the SQL statement
            int rowsAffected = ps.executeUpdate();

            // Return true if at least one row is affected
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Handle any exceptions
            e.printStackTrace();
            return false; // Return false indicating failure
        } finally {
            // Close PreparedStatement after use
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    //create by Tung
    public List<Task> getTaskByLecture(int id_account, String class_name) {
        List<Task> tasks = new ArrayList<>();
        try {
            String strSelect = "	SELECT Task.*\n"
                    + "FROM Task\n"
                    + "WHERE Task.assign_to IN (\n"
                    + "    SELECT Account.ID_account\n"
                    + "    FROM Account\n"
                    + "    INNER JOIN [In] ON Account.ID_account = [In].ID_account\n"
                    + "    INNER JOIN class ON [In].ID_class = class.Id_class\n"
                    + "    WHERE class.Class_name = ?\n"
                    + ") and Task.assign_to = ?";
            ps = connection.prepareStatement(strSelect);
            ps.setString(1, class_name);
            ps.setInt(2, id_account);
            rs = ps.executeQuery();
            while (rs.next()) {
                tasks.add(new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getDate(5), rs.getInt(6), rs.getInt(7), rs.getInt(8)));
            }
            return tasks;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return tasks;
    }

    //created by Tung
    public Task getTaskByID(int task_id) {

        try {
            String strSelect = "select * from Task where Id_task = ?";
            ps = connection.prepareStatement(strSelect);
            ps.setInt(1, task_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getDate(5), rs.getInt(6), rs.getInt(7), rs.getInt(8));
            }
            return null;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return null;
    }

    public List<Task> getTasksByAccountId(int accountId) {
        List<Task> tasks = new ArrayList<>();
        try {
            String strSelect = "select * from Task where assign_to = ?";
            ps = connection.prepareStatement(strSelect);
            ps.setInt(1, accountId);
            rs = ps.executeQuery();
            while (rs.next()) {
                tasks.add(new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getDate(5), rs.getInt(6), rs.getInt(7), rs.getInt(8)));
            }
            return tasks;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return null;
    }

    public boolean AssignTask(List<Integer> tasks, int accoint_id) {
        try {

            for (int i = 0; i < tasks.size(); i++) {

                String strInsert = "UPDATE [dbo].[Task]\n"
                        + "   SET \n"
                        + "      [assign_to] = ?,\n"
                        + "	  [taskType_Id]=2\n"
                        + "\n"
                        + " WHERE Task.Id_task = ?";
                PreparedStatement ps = connection.prepareStatement(strInsert);
                ps.setInt(1, accoint_id);
                ps.setInt(2, tasks.get(i));

                // Execute the update
                int rowsAffected = ps.executeUpdate();

                // Check if any rows were affected
                if (rowsAffected > 0) {

                } else {
                    return false; // No rows affected, task not added

                }

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
        return true;
    }

    public static void main(String[] args) {
        TaskDAO taskDAO = new TaskDAO();

        System.out.println(taskDAO.getTaskByLecture(4, "1750"));

//        System.out.println(taskDAO.getTaskByID(1));
    }

}
