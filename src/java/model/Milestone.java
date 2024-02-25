/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author acer
 */
public class Milestone {
    private int id_milestone;
    private String name_milestone;
    private Date Start_date;
    private Date End_date;
    private int Id_Project;
    
    public Milestone(){
        
    }

    public Milestone(int Id_milestone, String name_milestone, Date Start_date, Date End_date, int Id_Project) {
        this.id_milestone = Id_milestone;
        this.name_milestone = name_milestone;
        this.Start_date = Start_date;
        this.End_date = End_date;
        this.Id_Project = Id_Project;
    }

    public int getId_milestone() {
        return id_milestone;
    }

    public void setId_milestone(int Id_milestone) {
        this.id_milestone = Id_milestone;
    }

    public String getName_milestone() {
        return name_milestone;
    }

    public void setName_milestone(String name_milestone) {
        this.name_milestone = name_milestone;
    }

    public Date getStart_date() {
        return Start_date;
    }

    public void setStart_date(Date Start_date) {
        this.Start_date = Start_date;
    }

    public Date getEnd_date() {
        return End_date;
    }

    public void setEnd_date(Date End_date) {
        this.End_date = End_date;
    }

    public int getId_Project() {
        return Id_Project;
    }

    public void setId_Project(int Id_Project) {
        this.Id_Project = Id_Project;
    }
    
}
