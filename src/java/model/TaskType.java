/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author acer
 */
public class TaskType {
    private int taskType_Id;
    private String taskType_Name;
    
    public TaskType(){
        
    }
    public TaskType(int taskType_Id, String TaskType_Name){
        this.taskType_Name=TaskType_Name;
        this.taskType_Id=taskType_Id;
        
    }

    public int getTaskType_Id() {
        return taskType_Id;
    }

    public void setTaskType_Id(int taskType_Id) {
        this.taskType_Id = taskType_Id;
    }

    public String getTaskType_Name() {
        return taskType_Name;
    }

    public void setTaskType_Name(String TaskType_Name) {
        this.taskType_Name = TaskType_Name;
    }
    
}
