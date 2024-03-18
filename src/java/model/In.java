/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author acer
 */
public class In {
    private int id_in;
    private int iD_account;
    private int iD_class;

    public In(int id_in, int iD_account, int iD_class) {
        this.id_in = id_in;
        this.iD_account = iD_account;
        this.iD_class = iD_class;
    }

    public In() {
    }

    public int getId_in() {
        return id_in;
    }

    public void setId_in(int id_in) {
        this.id_in = id_in;
    }

    public int getiD_account() {
        return iD_account;
    }

    public void setiD_account(int iD_account) {
        this.iD_account = iD_account;
    }

    public int getiD_class() {
        return iD_class;
    }

    public void setiD_class(int iD_class) {
        this.iD_class = iD_class;
    }
    
    
}
