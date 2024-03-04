/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author quann
 */
public class Notification {
    
    private int noti_id;
    private int id_account;
    private String user_name;
    private int id_Project;
    private String notification;
    private Date date;
    private int id_task;

    public Notification() {
    }

    public Notification(int noti_id, int id_account, String user_name, int id_Project, String notification, Date date, int id_task) {
        this.noti_id = noti_id;
        this.id_account = id_account;
        this.user_name = user_name;
        this.id_Project = id_Project;
        this.notification = notification;
        this.date = date;
        this.id_task = id_task;
    }

    public int getNoti_id() {
        return noti_id;
    }

    public void setNoti_id(int noti_id) {
        this.noti_id = noti_id;
    }

    public int getId_account() {
        return id_account;
    }

    public void setId_account(int id_account) {
        this.id_account = id_account;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public int getId_Project() {
        return id_Project;
    }

    public void setId_Project(int id_Project) {
        this.id_Project = id_Project;
    }

    public String getNotification() {
        return notification;
    }

    public void setNotification(String notification) {
        this.notification = notification;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getId_task() {
        return id_task;
    }

    public void setId_task(int id_task) {
        this.id_task = id_task;
    }

    
}
