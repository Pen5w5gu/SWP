/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Role;
import model.User;

/**
 *
 * @author tieup
 */
public class AccountDAO extends DBContext { // Follow Java naming conventions for class names

    // Use more specific List interface rather than ArrayList in the declaration
    private List<User> list = new ArrayList<>();

    PreparedStatement ps = null;
    ResultSet rs = null;

    public User getUser(String email) {

        String query = "select * from Account\n"
                + "where email=? ";
        try {

            ps = connection.prepareStatement(query);
            ps.setString(1, email);

            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public List<User> getAllAccount() {
        List<User> users = new ArrayList<>();

        try {
            String strSelect = "select * from Account";
            ps = connection.prepareStatement(strSelect);
            rs = ps.executeQuery();
            while (rs.next()) {
                users.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7)));
            }
            return users;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkExistAccount(String email) {
        try {
            String sql = "select * from Account\n"
                    + "where email=?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                User cA = new User(rs.getString("password"), rs.getString("email"));
                return true;
            }
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return false;
    }

    public Boolean Register(String email, String password, String username) {

        try {
            String strSelect = "  INSERT INTO Account (User_name,  Password, email,role_project,Id_role,status)\n"
                    + " VALUES (?,?,?,?,?,?);";
            ps = connection.prepareStatement(strSelect);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, null);
            ps.setInt(5, 1);
            ps.setInt(6, 1);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        } finally {
            // Always close resources in a finally block
            closeResources();
        }
        return false;
    }

    public boolean changePassword(String email, String newPassword) {
        try {
            String sql = "UPDATE Account SET Password=? WHERE email=?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, email);

            int rowsUpdated = ps.executeUpdate();

            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close your resources (PreparedStatement, ResultSet) here in a try-catch-finally block.
        }
        return false;
    }

    public void changeStatus(User account) {
        try {
            String sql = "UPDATE Account \n"
                    + "SET status='1' \n"
                    + "WHERE email=?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, account.getEmail());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean checkAccount(String email, String password) {
        try {
            String sql = "select * from Account\n"
                    + "where email=? And Password=?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return false;
    }

    public Boolean RegisterStudent(String email, String password, String username, String role_project) {

        try {
            String strSelect = "  INSERT INTO Account (User_name,  Password, email,role_project,Id_role,status)\n"
                    + " VALUES (?,?,?,?,?,?);";
            ps = connection.prepareStatement(strSelect);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, role_project);
            ps.setInt(5, 2);
            ps.setInt(6, 0);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        } finally {
            // Always close resources in a finally block
            closeResources();
        }
        return false;
    }

    public int checkStatus(String email) {
        try {
            String sql = "SELECT status FROM Account WHERE email=?";
            try ( PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, email);
                try ( ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {

                        return rs.getInt("status");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log or handle the exception appropriately
        }

        return -1;
    }

//    private static String getUsernameFromEmail(String email) {
//        // Kiểm tra xem có dấu @ trong địa chỉ email hay không
//        int atIndex = email.indexOf('@');
//
//        // Nếu có, lấy phần từ đầu đến dấu @
//        if (atIndex != -1) {
//            return email.substring(0, atIndex);
//        } else {
//            // Nếu không có dấu @, trả về chuỗi trống hoặc xử lý theo yêu cầu của bạn
//            return "";
//        }
//    }
    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<User> getUserByProject(int ID_Project) {
        List<User> users = new ArrayList<>();

        try {
            String strSelect = "SELECT  distinct  Account.*\n"
                    + "FROM         Account INNER JOIN\n"
                    + "                      [Join] ON Account.ID_account = [Join].ID_account INNER JOIN\n"
                    + "                      Project ON [Join].Id_Project = Project.Id_Project\n"
                    + "	where Project.Id_Project=?";
            ps = connection.prepareStatement(strSelect);
            ps.setInt(1, ID_Project);
            rs = ps.executeQuery();
            while (rs.next()) {
                users.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7)));
            }
            return users;
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return null;
    }

    public List<User> getallstudentinclass(String classname) {
        List<User> users = new ArrayList<>();

        try {
            String strSelect = "SELECT   Account.ID_account, Account.User_name, Account.email, Account.role_project\n"
                    + "FROM         Account INNER JOIN\n"
                    + "                      [In] ON Account.ID_account = [In].ID_account INNER JOIN\n"
                    + "                      class ON [In].ID_class = class.Id_class\n"
                    + "where  Class_name =? and Account.Id_role=2";
            ps = connection.prepareStatement(strSelect);
            ps.setString(1, classname);
            rs = ps.executeQuery();
            while (rs.next()) {
                users.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }

        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return users;
    }

    public List<User> getHiddenStudentinclass(String classname) {
        List<User> users = new ArrayList<>();

        try {
            String strSelect = "SELECT Account.ID_account, Account.User_name, Account.email, Account.role_project\n"
                    + "FROM Account\n"
                    + "INNER JOIN [In] ON Account.ID_account = [In].ID_account\n"
                    + "INNER JOIN [Join] ON Account.ID_account = [Join].ID_account AND [Join].Allow_access = 'false'\n"
                    + "INNER JOIN class ON [In].ID_class = class.Id_class\n"
                    + "WHERE class.Class_name = ? AND Account.Id_role = 2;";
            ps = connection.prepareStatement(strSelect);
            ps.setString(1, classname);
            rs = ps.executeQuery();
            while (rs.next()) {
                users.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }

        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return users;
    }

    public boolean ChangeStatus(int id_account, int Status) {
        try {

            String strInsert = "update [Join]\n"
                    + "set\n"
                    + "Allow_access = ?\n"
                    + "where ID_account = ?";
            PreparedStatement ps = connection.prepareStatement(strInsert);
            ps.setInt(1, Status);
            ps.setInt(2, id_account);

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

    public List<User> getAllowStudentinclass(String classname) {
        List<User> users = new ArrayList<>();

        try {
            String strSelect = "SELECT Account.ID_account, Account.User_name, Account.email, Account.role_project\n"
                    + "FROM Account\n"
                    + "INNER JOIN [In] ON Account.ID_account = [In].ID_account\n"
                    + "INNER JOIN [Join] ON Account.ID_account = [Join].ID_account AND [Join].Allow_access = 'true'\n"
                    + "INNER JOIN class ON [In].ID_class = class.Id_class\n"
                    + "WHERE class.Class_name = ? AND Account.Id_role = 2;";
            ps = connection.prepareStatement(strSelect);
            ps.setString(1, classname);
            rs = ps.executeQuery();
            while (rs.next()) {
                users.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }

        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return users;
    }

    public User getAccountProfile(String email) {
        User user = null;
        try {
            String sql = "SELECT a.User_name, a.email, r.Id_role, r.Role_Name "
                    + "FROM account a "
                    + "JOIN Role r ON r.Id_role = a.Id_role "
                    + "WHERE a.email = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();

            if (rs.next()) {
                String userName = rs.getString("User_name");
                String roleName = rs.getString("Role_Name");
                int roleId = rs.getInt("Id_role");
                // Tạo đối tượng Role với thông tin từ cơ sở dữ liệu
                Role role = new Role(roleId, roleName);
                // Tạo đối tượng User với thông tin tương ứng
                user = new User(userName, email, role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public String getUsernameById(int Id_account) {

        try {
            String strSelect = "select User_name from Account\n"
                    + "where ID_account = ?";
            ps = connection.prepareStatement(strSelect);
            ps.setInt(1, Id_account);
            rs = ps.executeQuery();
            while (rs.next()) {
                String Username = rs.getString("User_name");
                return Username;
            }

        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return null;
    }

    public Role getUserRole(String email) {
        Role role = null;

        try {
            String sql = "SELECT r.Id_role, r.Role_Name "
                    + "FROM account a "
                    + "JOIN Role r ON r.Id_role = a.Id_role "
                    + "WHERE a.email = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int roleId = rs.getInt("Id_role");
                String roleName = rs.getString("Role_Name");
                role = new Role(roleId, roleName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return role;
    }

    public List<User> searchstudentinclass(String classname, String name) {
        List<User> users = new ArrayList<>();

        try {
            String strSelect = "SELECT    Account.User_name, Account.email, Account.role_project\n"
                    + "FROM         Account INNER JOIN\n"
                    + "                      [In] ON Account.ID_account = [In].ID_account INNER JOIN\n"
                    + "                      class ON [In].ID_class = class.Id_class\n"
                    + "where  Class_name =? and  Account.User_name like ? and Account.Id_role=2";
            ps = connection.prepareStatement(strSelect);
            ps.setString(1, classname);
            ps.setString(2, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                users.add(new User(rs.getString(1), rs.getString(2), rs.getString(3)));
            }

        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return users;
    }

    public boolean updateAllowAccess(int id_account, int id_project) {
        try {
            String sql = "update [Join]\n"
                    + "set Allow_access=0\n"
                    + "where iD_account=? and Id_Project=?";

            ps = connection.prepareStatement(sql);
            ps.setInt(1, id_account);
            ps.setInt(2, id_project);
            int row = ps.executeUpdate();
            if (row > 0) {
                return true;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public int getIDbyEmail(String email) {
        try {
            String sql = "SELECT ID_account FROM Account WHERE email=?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("ID_account");
            }
        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        } finally {
            // Close your resources (PreparedStatement, ResultSet) here in a try-catch-finally block.
            closeResources();
        }
        return -1; // Return a default value in case of failure, such as -1
    }

    public String getProjectID(int accountID) {

        try {
            String strSelect = "SELECT    Project.Id_Project\n"
                    + "FROM         Account INNER JOIN\n"
                    + "                      [Join] ON Account.ID_account = [Join].ID_account INNER JOIN\n"
                    + "                      Project ON [Join].Id_Project = Project.Id_Project\n"
                    + "\n"
                    + "		where Account.ID_account=?";
            ps = connection.prepareStatement(strSelect);
            ps.setInt(1, accountID);
            rs = ps.executeQuery();
            while (rs.next()) {
                String Username = rs.getString("Id_Project");
                return Username;
            }

        } catch (SQLException e) {
            // Consider logging the exception instead of just printing it
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        System.out.println(dao.ChangeStatus(6, 0));

    }
}
