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
import model.TaskType;

/**
 *
 * @author acer
 */
public class TaskTypeDAO extends DBContext{
    // Use more specific List interface rather than ArrayList in the declaration
    private List<TaskType> list = new ArrayList<>();

    PreparedStatement ps = null;
    ResultSet rs = null;
    
    //created by Tung
    public List<TaskType> getTaskType() {
        List<TaskType> tasktypes = new ArrayList<>();

        try {
            String strSelect = "select * from Task_type";
            ps = connection.prepareStatement(strSelect);
            rs = ps.executeQuery();
            while (rs.next()) {
                tasktypes.add(new TaskType(rs.getInt(1), rs.getString(2)));
            }
            return tasktypes;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return tasktypes;
    }
    public static void main(String[] args) {
        TaskTypeDAO ttdao = new TaskTypeDAO();
        System.out.println(ttdao.getTaskType());
    }
    
}