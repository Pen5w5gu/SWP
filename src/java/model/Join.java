/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author acer
 */
public class Join {
    private int Id_join;
    private int iD_account;
    private int id_Project;
    private int allow_access;

    public Join() {
    }

    public Join(int Id_join, int iD_account, int id_Project, int allow_access) {
        this.Id_join = Id_join;
        this.iD_account = iD_account;
        this.id_Project = id_Project;
        this.allow_access = allow_access;
    }

    public int getId_join() {
        return Id_join;
    }

    public void setId_join(int Id_join) {
        this.Id_join = Id_join;
    }

    public int getiD_account() {
        return iD_account;
    }

    public void setiD_account(int iD_account) {
        this.iD_account = iD_account;
    }

    public int getId_Project() {
        return id_Project;
    }

    public void setId_Project(int id_Project) {
        this.id_Project = id_Project;
    }

    public int getAllow_access() {
        return allow_access;
    }

    public void setAllow_access(int allow_access) {
        this.allow_access = allow_access;
    }
    
    
}
