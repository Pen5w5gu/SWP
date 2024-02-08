/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author tieup
 */
public class Project {
    private int id_Project;
    private String project_name;
    private String project_description;
    private Date start_date;
    private Date end_date;

    public Project() {
    }

    public Project(int id_Project, String project_name, String project_description, Date start_date, Date end_date) {
        this.id_Project = id_Project;
        this.project_name = project_name;
        this.project_description = project_description;
        this.start_date = start_date;
        this.end_date = end_date;
    }

    public int getId_Project() {
        return id_Project;
    }

    public void setId_Project(int id_Project) {
        this.id_Project = id_Project;
    }

    public String getProject_name() {
        return project_name;
    }

    public void setProject_name(String project_name) {
        this.project_name = project_name;
    }

    public String getProject_description() {
        return project_description;
    }

    public void setProject_description(String project_description) {
        this.project_description = project_description;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    
    @Override
    public String toString() {
        return "Project{" + "id_Project=" + id_Project + ", project_name=" + project_name + ", project_description=" + project_description + ", start_date=" + start_date + ", end_date=" + end_date + '}';
    }
    
}
