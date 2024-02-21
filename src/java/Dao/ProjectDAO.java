/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import model.Project;
import java.sql.Connection;
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
public class ProjectDAO extends DBContext{
     PreparedStatement ps = null;
    ResultSet rs = null;
     public Project getProjectsByUser(int accountId) {
    try {
        String sql = "SELECT p.*\n"
                + "FROM Project p\n"
                + "JOIN [Join] j ON p.Id_Project = j.Id_Project\n"
                + "WHERE j.ID_account = ? AND j.Allow_access = 1;";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
       
            ps.setInt(1, accountId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Project p = new Project(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getDate(4) ,rs.getDate(5));
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
            while(rs.next()){
                projects.add(new Project(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getDate(5)));
            }
            return projects;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return projects;
    }
     public List<Project> getProjectbyIdAccount(int ID_Account) {
        List<Project> projects = new ArrayList<>();

        try {
            String strSelect = "SELECT TOP 1 Project.*\n"
                    + "FROM         Account INNER JOIN\n"
                    + "                      [Join] ON Account.ID_account = [Join].ID_account INNER JOIN\n"
                    + "                      Project ON [Join].Id_Project = Project.Id_Project\n"
                    + "where Account.ID_account = ? and [Join].Allow_access=1";
            ps = connection.prepareStatement(strSelect);
            ps.setInt(1, ID_Account);
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
     
     
    public static void main(String[] args) {
        ProjectDAO dao= new ProjectDAO();
        List<Project> lists = dao.getProjectbyClass("1757");
        System.out.println(lists);

    }
}
