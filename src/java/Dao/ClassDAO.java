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
import model.Class;
import model.User;

/**
 *
 * @author tieup
 */
public class ClassDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Class> getClassByUser(int accountId) {
        List<Class> classes = new ArrayList<>();
        String sql = "SELECT  class.Id_class,  class.Class_name\n"
                + "FROM         class INNER JOIN\n"
                + "                      [In] ON class.Id_class = [In].ID_class\n"
                + "where ID_account=?";
        try {

            ps = connection.prepareStatement(sql);
            ps.setInt(1, accountId);
            rs = ps.executeQuery();
            while (rs.next()) {
                classes.add(new Class(rs.getInt(1), rs.getString(2)));

            }
        } catch (Exception e) {

        }
        return classes;
    }
    public boolean addClass(String classname) {
        String sql = "INSERT INTO class (Class_name) VALUES (?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,classname);

            int row = ps.executeUpdate();
            if (row>0) {
                return true;              
            }
            return false;
        } catch (Exception e) {
        }
        return false;
    }
    public List<Class> searchclass(String classname, int ID_account) {
        List<Class> classes = new ArrayList<>();
        String sql = "SELECT    class.*\n"
                + "FROM         Account INNER JOIN\n"
                + "                      [In] ON Account.ID_account = [In].ID_account INNER JOIN\n"
                + "                      class ON [In].ID_class = class.Id_class\n"
                + "where class.Class_name like ? AND Account.ID_account=?";
        try {

            ps = connection.prepareStatement(sql);
            ps.setString(1, classname + "%");
            ps.setInt(2, ID_account);
            rs = ps.executeQuery();
            while (rs.next()) {
                classes.add(new Class(rs.getInt(1), rs.getString(2)));

            }
        } catch (Exception e) {

        }
        return classes;
    }
    
    
    public int getIdByName(String classname){
        String sql = "select class.Id_class from class where class.Class_name=?";
        try {

            ps = connection.prepareStatement(sql);
            ps.setString(1, classname);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);

            }
        } catch (Exception e) {

        }
        return 0;
    }
    
    

    public static void main(String[] args) {
        ClassDAO dao = new ClassDAO();
        System.out.println(dao.getIdByName("abc"));
    }
}