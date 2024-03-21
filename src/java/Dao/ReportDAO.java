/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Report;

/**
 *
 * @author ns
 */
public class ReportDAO extends DBContext {

    public List<Report> getAllReports() {
        String sql = "SELECT Date, Work_Done, Planning_Tomorrow, Issue, Notes, Id_task, Id_Report, account_id "
                + "FROM Daily_report";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<Report> reports = new ArrayList<>();
            while (rs.next()) {
                Report report = new Report();
                report.setId(rs.getInt("Id_Report"));
                report.setDate(rs.getDate("Date"));
                report.setWorkDone(rs.getNString("Work_Done"));
                report.setPlanningTomorrow(rs.getNString("Planning_Tomorrow"));
                report.setIssue(rs.getNString("Issue"));
                report.setNotes(rs.getNString("Notes"));
                report.setTaskId(rs.getInt("Id_task"));
                report.setAccountId(rs.getInt("account_id"));
                reports.add(report);
            }
            return reports;
        } catch (SQLException e) {
            Logger.getLogger(ReportDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public List<Report> getReportsByAccountId(int accountId) {
        String sql = "SELECT Date, Work_Done, Planning_Tomorrow, Issue, Notes, Id_task, Id_Report, account_id "
                + "FROM Daily_report WHERE account_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            List<Report> reports = new ArrayList<>();
            while (rs.next()) {
                Report report = new Report();
                report.setId(rs.getInt("Id_Report"));
                report.setDate(rs.getDate("Date"));
                report.setWorkDone(rs.getNString("Work_Done"));
                report.setPlanningTomorrow(rs.getNString("Planning_Tomorrow"));
                report.setIssue(rs.getNString("Issue"));
                report.setNotes(rs.getNString("Notes"));
                report.setTaskId(rs.getInt("Id_task"));
                report.setAccountId(rs.getInt("account_id"));
                reports.add(report);
            }
            return reports;
        } catch (SQLException e) {
            Logger.getLogger(ReportDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public Report getReportById(int id) {
        String sql = "SELECT Date, Work_Done, Planning_Tomorrow, Issue, Notes, Id_task, account_id "
                + "FROM Daily_report WHERE Id_Report = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Report report = new Report();
                report.setId(id);
                report.setDate(rs.getDate("Date"));
                report.setWorkDone(rs.getNString("Work_Done"));
                report.setPlanningTomorrow(rs.getNString("Planning_Tomorrow"));
                report.setIssue(rs.getNString("Issue"));
                report.setNotes(rs.getNString("Notes"));
                report.setTaskId(rs.getInt("Id_task"));
                report.setAccountId(rs.getInt("account_id"));
                return report;
            }
        } catch (SQLException e) {
            Logger.getLogger(ReportDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public Report addRepost(Report report) {
        String sql = "insert into Daily_report(Date, Work_Done, Planning_Tomorrow, issue, Notes, Id_task, account_id) \n"
                + "values (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDate(1, report.getDate());
            ps.setNString(2, report.getWorkDone());
            ps.setNString(3, report.getPlanningTomorrow());
            ps.setNString(4, report.getIssue());
            ps.setNString(5, report.getNotes());
            ps.setInt(6, report.getTaskId());
            ps.setInt(7, report.getAccountId());
            int result = ps.executeUpdate();
            if (result > 0) {
                return report;
            }
        } catch (SQLException e) {
            Logger.getLogger(ReportDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public Report updateReport(Report report) {
        String sql = "update Daily_report set Date = ?, Work_Done = ?, Planning_Tomorrow = ?, issue = ?, Notes = ?, Id_task = ?\n"
                + "where Id_Report = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDate(1, report.getDate());
            ps.setNString(2, report.getWorkDone());
            ps.setNString(3, report.getPlanningTomorrow());
            ps.setNString(4, report.getIssue());
            ps.setNString(5, report.getNotes());
            ps.setInt(6, report.getTaskId());
            ps.setInt(7, report.getId());
            int result = ps.executeUpdate();
            if (result > 0) {
                return report;
            }
        } catch (SQLException e) {
            Logger.getLogger(ReportDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public void delete(Integer id) {
        String sql = "DELETE FROM Daily_report WHERE Id_Report = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(ReportDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
