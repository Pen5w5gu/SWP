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
public class Issue {
    private int Id_issue;
    private int Id_milestone;
    private String Title;
    private String Content;
    private int Status;
    private int Id_author;
    private Date date;

    public Issue() {
    }

    public Issue(int Id_issue, int Id_milestone, String Title, String Content, int Status, int Id_author, Date date) {
        this.Id_issue = Id_issue;
        this.Id_milestone = Id_milestone;
        this.Title = Title;
        this.Content = Content;
        this.Status = Status;
        this.Id_author = Id_author;
        this.date = date;
    }

    public int getId_issue() {
        return Id_issue;
    }

    public void setId_issue(int Id_issue) {
        this.Id_issue = Id_issue;
    }

    public int getId_milestone() {
        return Id_milestone;
    }

    public void setId_milestone(int Id_milestone) {
        this.Id_milestone = Id_milestone;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public int isStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    public int getId_author() {
        return Id_author;
    }

    public void setId_author(int Id_author) {
        this.Id_author = Id_author;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    
}
