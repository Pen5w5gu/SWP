/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tieup
 */
public class User {
    private int Id_account;
    private String username;
    private String password;
    private String email;
    private String status;
    private String role_project;
    private int Id_role;

    public User() {
    }

    public User(int Id_account, String username, String password, String email, String status, String role_project, int Id_role) {
        this.Id_account = Id_account;
        this.username = username;
        this.password = password;
        this.email = email;
        this.status = status;
        this.role_project = role_project;
        this.Id_role = Id_role;
    }

    public User(String string, String string0) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int getId_account() {
        return Id_account;
    }

    public void setId_account(int Id_account) {
        this.Id_account = Id_account;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRole_project() {
        return role_project;
    }

    public void setRole_project(String role_project) {
        this.role_project = role_project;
    }

    public int getId_role() {
        return Id_role;
    }

    public void setId_role(int Id_role) {
        this.Id_role = Id_role;
    }

    @Override
    public String toString() {
        return "User{" + "Id_account=" + Id_account + ", username=" + username + ", password=" + password + ", email=" + email + ", status=" + status + ", role_project=" + role_project + ", Id_role=" + Id_role + '}';
    }
    

   

  
    }
 
    
    

