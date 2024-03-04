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
<<<<<<< HEAD
    private int assign_to;
=======
    private String code;
>>>>>>> a932d4479392a1e5c91c4c321407a7dda252f9a8
    private int taskTypeId; // Sử dụng int cho khóa ngoại taskType_Id
    private int idMilestone; // Sử dụng int cho khóa ngoại Id_milestone

    // Constructors
<<<<<<< HEAD

    public Task() {
    }

    public Task(int idTask, String taskName, String taskDescription, Date startDate, Date endDate, int assign_to, int taskTypeId, int idMilestone) {
=======
    public Task() {
    }

    public Task(int idTask, String taskName, String taskDescription, Date startDate, Date endDate, String code, int taskTypeId, int idMilestone) {
>>>>>>> a932d4479392a1e5c91c4c321407a7dda252f9a8
        this.idTask = idTask;
        this.taskName = taskName;
        this.taskDescription = taskDescription;
        this.startDate = startDate;
        this.endDate = endDate;
<<<<<<< HEAD
        this.assign_to = assign_to;
=======
        this.code = code;
>>>>>>> a932d4479392a1e5c91c4c321407a7dda252f9a8
        this.taskTypeId = taskTypeId;
        this.idMilestone = idMilestone;
    }

<<<<<<< HEAD
    
=======

    // Getters and setters
>>>>>>> a932d4479392a1e5c91c4c321407a7dda252f9a8
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

<<<<<<< HEAD
    public int getAssign_to() {
        return assign_to;
    }

    public void setAssign_to(int assign_to) {
        this.assign_to = assign_to;
=======
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
>>>>>>> a932d4479392a1e5c91c4c321407a7dda252f9a8
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
<<<<<<< HEAD
    
    
}
=======

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
>>>>>>> a932d4479392a1e5c91c4c321407a7dda252f9a8
