/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Date;

public class Task {
    private int idTask;
    private String taskName;
    private String taskDescription;
    private Date startDate;
    private Date endDate;
    private String code;
    private int taskTypeId; // Sử dụng int cho khóa ngoại taskType_Id
    private int idMilestone; // Sử dụng int cho khóa ngoại Id_milestone

    // Constructors
    public Task() {
    }

    public Task(int idTask, String taskName, String taskDescription, Date startDate, Date endDate, String code, int taskTypeId, int idMilestone) {
        this.idTask = idTask;
        this.taskName = taskName;
        this.taskDescription = taskDescription;
        this.startDate = startDate;
        this.endDate = endDate;
        this.code = code;
        this.taskTypeId = taskTypeId;
        this.idMilestone = idMilestone;
    }


    // Getters and setters
    public int getIdTask() {
        return idTask;
    }

    public void setIdTask(int idTask) {
        this.idTask = idTask;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskDescription() {
        return taskDescription;
    }

    public void setTaskDescription(String taskDescription) {
        this.taskDescription = taskDescription;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getTaskTypeId() {
        return taskTypeId;
    }

    public void setTaskTypeId(int taskTypeId) {
        this.taskTypeId = taskTypeId;
    }

    public int getIdMilestone() {
        return idMilestone;
    }

    public void setIdMilestone(int idMilestone) {
        this.idMilestone = idMilestone;
    }

    // toString method for debugging
    @Override
    public String toString() {
        return "Task{" +
                "idTask=" + idTask +
                ", taskName='" + taskName + '\'' +
                ", taskDescription='" + taskDescription + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", code='" + code + '\'' +
                ", taskTypeId=" + taskTypeId +
                ", idMilestone=" + idMilestone +
                '}';
    }
}