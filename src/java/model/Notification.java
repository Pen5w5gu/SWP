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
    
    private int norifi_id;
    private int account_id;
    private String notification;
    private Date date;

    public Notification() {
    }

    public Notification(int norifi_id, int account_id, String notification, Date date) {
        this.norifi_id = norifi_id;
        this.account_id = account_id;
        this.notification = notification;
        this.date = date;
    }

    public int getNorifi_id() {
        return norifi_id;
    }

    public void setNorifi_id(int norifi_id) {
        this.norifi_id = norifi_id;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
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
}
