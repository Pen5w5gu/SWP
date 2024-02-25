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

    public static void main(String[] args) {
        MilestoneDAO dao = new MilestoneDAO();
        System.out.println(dao.getMilestoneByProjectId(1));
    }
}
