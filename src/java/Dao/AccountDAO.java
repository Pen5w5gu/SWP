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
    

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        User user = dao.getAccountProfile("nguyenthiminhhang141205@gmail.com");

        if (user != null) {
            // In ra thông tin người dùng và tên của vai trò
            System.out.println("Username: " + user.getUsername());

            System.out.println("Email: " + user.getEmail());
            if (user.getRole() != null) { // Kiểm tra xem người dùng có vai trò hay không
                Role role = user.getRole(); // Lấy đối tượng Role từ đối tượng User
                System.out.println("Role: " + role.getRole_name()); // In ra tên của vai trò
            } else {
                System.out.println("Role not found for user!");
            }
        } else {
            System.out.println("User not found!");
        }
    }

    public void close() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
