package Dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
                    + "	where Project.Id_Project=?";
            ps = connection.prepareStatement(strSelect);
            ps.setInt(1, project_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                tasks.add(new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getDate(5), rs.getString(6), rs.getInt(7), rs.getInt(8)));
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
                tasks.add(new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getDate(5), rs.getString(6), rs.getInt(7), rs.getInt(8)));
            }
            return tasks;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return tasks;
    }

    //created by Tung
    public boolean AddTask(String taskName, String taskDescription, Date startDate, Date endDate, String code, int taskTypeId, int milestoneId) {
        try {
            // Define the SQL query
            String strInsert = "INSERT INTO Task (task_name, task_description, start_date, end_date, code, taskType_id, id_milestone) VALUES (?, ?, ?, ?, ?, ?, ?)";

            // Create the PreparedStatement object
            PreparedStatement ps = connection.prepareStatement(strInsert);

            // Set parameters for the prepared statement
            ps.setString(1, taskName);
            ps.setString(2, taskDescription);
            ps.setDate(3, startDate);
            ps.setDate(4, endDate);
            ps.setString(5, code);
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
            // Câu lệnh SQL để cập nhật taskType của task
            String query = "UPDATE Task SET taskType_Id = ? WHERE Id_task = ?";

            // Tạo PreparedStatement
            ps = connection.prepareStatement(query);

            // Thiết lập các tham số cho câu lệnh SQL
            ps.setInt(1, newTaskTypeId);
            ps.setInt(2, taskId);

            // Thực thi câu lệnh SQL
            int rowsAffected = ps.executeUpdate();

            // Trả về true nếu có ít nhất một dòng bị ảnh hưởng
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Xử lý các ngoại lệ nếu có
            e.printStackTrace();
            return false;
        } finally {
            // Đóng PreparedStatement sau khi sử dụng
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    //created by Tung
    public Task getTaskByID(int task_id ) {
        
        try {
            String strSelect = "select * from Task where Id_task = ?";
            ps = connection.prepareStatement(strSelect);
            ps.setInt(1, task_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getDate(5), rs.getString(6), rs.getInt(7), rs.getInt(8));
            }
            return null;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        TaskDAO taskDAO = new TaskDAO();
        System.out.println(taskDAO.getTaskByProject(1));

        System.out.println(taskDAO.getTaskByID(1));

    }

}