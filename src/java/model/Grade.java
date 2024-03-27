/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author acer
 */
public class Grade {
    private int id;
    private int Grade_Dailyreport;
    private int Grade_Code;
    private int Grade_Document;
    private int Grade_Presentation;
    private int id_project;

    public Grade() {
    }

    public Grade(int id, int Grade_Dailyreport, int Grade_Code, int Grade_Document, int Grade_Presentation, int id_project) {
        this.id = id;
        this.Grade_Dailyreport = Grade_Dailyreport;
        this.Grade_Code = Grade_Code;
        this.Grade_Document = Grade_Document;
        this.Grade_Presentation = Grade_Presentation;
        this.id_project = id_project;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGrade_Dailyreport() {
        return Grade_Dailyreport;
    }

    public void setGrade_Dailyreport(int Grade_Dailyreport) {
        this.Grade_Dailyreport = Grade_Dailyreport;
    }

    public int getGrade_Code() {
        return Grade_Code;
    }

    public void setGrade_Code(int Grade_Code) {
        this.Grade_Code = Grade_Code;
    }

    public int getGrade_Document() {
        return Grade_Document;
    }

    public void setGrade_Document(int Grade_Document) {
        this.Grade_Document = Grade_Document;
    }

    public int getGrade_Presentation() {
        return Grade_Presentation;
    }

    public void setGrade_Presentation(int Grade_Presentation) {
        this.Grade_Presentation = Grade_Presentation;
    }

    public int getId_project() {
        return id_project;
    }

    public void setId_project(int id_project) {
        this.id_project = id_project;
    }
    
    
    
            
}
