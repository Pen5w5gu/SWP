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
import model.Milestone;

/**
 *
 * @author acer
 */
public class MilestoneDAO extends DBContext {

    // Use more specific List interface rather than ArrayList in the declaration
    private List<Milestone> list = new ArrayList<>();

    PreparedStatement ps = null;
    ResultSet rs = null;

    //created by Tung
    public List<Milestone> getMilestoneByProjectId(int project_id) {
        List<Milestone> milestones = new ArrayList<>();

        try {
            String strSelect = "SELECT    milestone.*\n"
                    + "FROM         milestone\n"
                    + "where milestone.Id_Project = ?";
            ps = connection.prepareStatement(strSelect);
            ps.setInt(1, project_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                milestones.add(new Milestone(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4), rs.getInt(5)));
            }
            return milestones;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return milestones;
    }

    //created by Tung
    public boolean addMilestone(Milestone milestone) {
        try {
            String query = "INSERT INTO milestone (name_milestone, Start_date, End_date, Id_Project)\n"
                    + "VALUES (?, ?, ?, ?);";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, milestone.getName_milestone());
            ps.setDate(2, milestone.getStart_date());
            ps.setDate(3, milestone.getEnd_date());
            ps.setInt(4, milestone.getId_Project());

            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    //created by Tung
    public boolean editMilestone(int milestone_id, String name, Date startDate, Date endDate, int project_id) {
        try {
            String query = "UPDATE milestone SET name_milestone = ?, Start_date = ?, End_date = ? WHERE id_milestone = ? and Id_Project=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setDate(2, startDate);
            preparedStatement.setDate(3, endDate);
            preparedStatement.setInt(4, milestone_id);
            preparedStatement.setInt(4, project_id);

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
     public static void main(String[] args) {
        // Assuming startDate and endDate are Date objects
        Date startDate = new Date(System.currentTimeMillis()); // Example initialization
        Date endDate = new Date(System.currentTimeMillis()); // Example initialization

        MilestoneDAO dao = new MilestoneDAO();
        
    }
<<<<<<< HEAD
}
=======
}
>>>>>>> a932d4479392a1e5c91c4c321407a7dda252f9a8
