package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Issue;

public class IssueDAO extends DBContext {

    public List<Issue> getAllIssues() {
        String sql = "SELECT Id, project_id, account_id, name, content, status, created_at FROM Issue";
        List<Issue> issues = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Issue issue = new Issue();
                issue.setId(rs.getInt("Id"));
                issue.setProjectId(rs.getInt("project_id"));
                issue.setAccountId(rs.getInt("account_id"));
                issue.setName(rs.getString("name"));
                issue.setContent(rs.getString("content"));
                issue.setStatus(rs.getString("status"));
                issue.setCreatedAt(rs.getTimestamp("created_at"));
                issues.add(issue);
            }
        } catch (SQLException e) {
            Logger.getLogger(IssueDAO.class.getName()).log(Level.SEVERE, "Error fetching all issues", e);
        }
        return issues;
    }

    public Issue getIssueById(int id) {
        String sql = "SELECT project_id, account_id, name, content, status, created_at FROM Issue WHERE Id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Issue issue = new Issue();
                issue.setId(id);
                issue.setProjectId(rs.getInt("project_id"));
                issue.setAccountId(rs.getInt("account_id"));
                issue.setName(rs.getString("name"));
                issue.setContent(rs.getString("content"));
                issue.setStatus(rs.getString("status"));
                issue.setCreatedAt(rs.getTimestamp("created_at"));
                return issue;
            }
        } catch (SQLException e) {
            Logger.getLogger(IssueDAO.class.getName()).log(Level.SEVERE, "Error fetching issue by ID", e);
        }
        return null;
    }

    public List<Issue> getIssuesByProjectId(int projectId) {
        String sql = "SELECT Id, project_id, account_id, name, content, status, created_at FROM Issue WHERE project_id = ?";
        List<Issue> issues = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, projectId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Issue issue = new Issue();
                issue.setId(rs.getInt("Id"));
                issue.setProjectId(projectId);
                issue.setAccountId(rs.getInt("account_id"));
                issue.setName(rs.getString("name"));
                issue.setContent(rs.getString("content"));
                issue.setStatus(rs.getString("status"));
                issue.setCreatedAt(rs.getTimestamp("created_at"));
                issues.add(issue);
            }
        } catch (SQLException e) {
            Logger.getLogger(IssueDAO.class.getName()).log(Level.SEVERE, "Error fetching issues by project ID", e);
        }
        return issues;
    }

    public Issue addIssue(Issue issue) {
        String sql = "INSERT INTO Issue(project_id, account_id, name, content, status, created_at) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, issue.getProjectId());
            ps.setInt(2, issue.getAccountId());
            ps.setString(3, issue.getName());
            ps.setString(4, issue.getContent());
            ps.setString(5, issue.getStatus());
            ps.setTimestamp(6, issue.getCreatedAt());
            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                return issue;

            }
        } catch (SQLException e) {
            Logger.getLogger(IssueDAO.class.getName()).log(Level.SEVERE, "Error adding issue", e);
        }
        return null;
    }

    public boolean updateIssue(Issue issue) {
        String sql = "UPDATE Issue SET project_id = ?, account_id = ?, name = ?, content = ?, status = ?, created_at = ? WHERE Id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, issue.getProjectId());
            ps.setInt(2, issue.getAccountId());
            ps.setString(3, issue.getName());
            ps.setString(4, issue.getContent());
            ps.setString(5, issue.getStatus());
            ps.setTimestamp(6, issue.getCreatedAt());
            ps.setInt(7, issue.getId());
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            Logger.getLogger(IssueDAO.class.getName()).log(Level.SEVERE, "Error updating issue", e);
            return false;
        }
    }

    public boolean deleteIssue(int id) {
        String sql = "DELETE FROM Issue WHERE Id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            Logger.getLogger(IssueDAO.class.getName()).log(Level.SEVERE, "Error deleting issue", e);
            return false;
        }
    }
}
