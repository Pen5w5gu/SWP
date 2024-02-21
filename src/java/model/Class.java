/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tieup
 */
public class Class {
    private int Id_class;
    private String class_name;

    public Class() {
    }

    public Class(String class_name) {
        this.class_name = class_name;
    }
    

    public Class(int Id_class, String class_name) {
        this.Id_class = Id_class;
        this.class_name = class_name;
    }

    public int getId_class() {
        return Id_class;
    }

    public void setId_class(int Id_class) {
        this.Id_class = Id_class;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    @Override
    public String toString() {
        return "Class{" + "Id_class=" + Id_class + ", class_name=" + class_name + '}';
    }

    
    
}
