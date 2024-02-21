<%-- 
    Document   : Showstudentinclass
    Created on : Feb 21, 2024, 1:54:14 AM
    Author     : tieup
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f5f5;
        }

        table {
            border: 1px solid black;
            border-collapse: collapse;
            width: 80%;
            background-color: #fff;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .back-button {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
        </tr>
        <c:forEach items="${student}" var="x" varStatus="loop">
            <tr>
                <td>${loop.index + 1}</td>
                <td>${x.username}</td>
                <td>${x.email}</td>
                <td>${x.role_project}</td>
            </tr>
        </c:forEach>
    </table>
    <button class="back-button" onclick="window.history.back()">Back</button>
</body>
</html>
