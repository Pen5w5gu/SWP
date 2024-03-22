/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author ns
 */
public class Report {

    private Integer id;

    private Date date;

    private String workDone;

    private String planningTomorrow;

    private String issue;

    private String notes;

    private Integer taskId;

    private Integer accountId;

    private Task task;

    public Report() {
    }

    public Report(Integer id, Date date, String workDone, String planningTomorrow, String issue, String notes, Integer taskId) {
        this.id = id;
        this.date = date;
        this.workDone = workDone;
        this.planningTomorrow = planningTomorrow;
        this.issue = issue;
        this.notes = notes;
        this.taskId = taskId;
    }

    public Report(Integer id, Date date, String workDone, String planningTomorrow, String issue, String notes, Integer taskId, Integer accountId) {
        this.id = id;
        this.date = date;
        this.workDone = workDone;
        this.planningTomorrow = planningTomorrow;
        this.issue = issue;
        this.notes = notes;
        this.taskId = taskId;
        this.accountId = accountId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getWorkDone() {
        return workDone;
    }

    public void setWorkDone(String workDone) {
        this.workDone = workDone;
    }

    public String getPlanningTomorrow() {
        return planningTomorrow;
    }

    public void setPlanningTomorrow(String planningTomorrow) {
        this.planningTomorrow = planningTomorrow;
    }

    public String getIssue() {
        return issue;
    }

    public void setIssue(String issue) {
        this.issue = issue;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public Integer getTaskId() {
        return taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

}
