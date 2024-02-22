<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%@ page import="model.Role" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Profile</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .profile-container {
                max-width: 400px;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;
            }
            .profile-item {
                margin-bottom: 10px;
            }
            .profile-label {
                font-weight: bold;
            }
            .change-password-button {
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 3px;
                padding: 5px 10px;
                cursor: pointer;
                text-decoration: none;
            }
            .change-password-button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
<body>
    <div class="profile-container">
        <h2>User Profile</h2>
        <div class="profile-item">
            <span class="profile-label">Username:</span>
            <span>${user.getUsername()}</span>
        </div>
        <div class="profile-item">
            <span class="profile-label">Role:</span>
            <span>${user.getRole().getRole_name()}</span>
        </div>
        <div class="profile-item">
            <span class="profile-label">Email:</span>
            <span>${user.getEmail()}</span>
        </div>
        <div class="profile-item">
            <form action="changepassword" method="post">
                <button type="submit" class="change-password-button">Change Password</button>
            </form>
        </div>
    </div>
</body>




</html>
