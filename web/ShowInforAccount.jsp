<%-- 
    Document   : profileStudent
    Created on : Jan 19, 2024, 3:56:51 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                background-image: url('https://static.vecteezy.com/system/resources/previews/005/263/697/original/e-learning-concept-isometric-mobile-or-smartphone-and-cloud-computing-for-study-on-orange-background-online-study-from-home-online-course-e-book-store-free-vector.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                font-family: 'Arial', sans-serif;
                margin: 0;
                padding: 0;
            }

            header {
                background-color: orange;
                color: orange;
                padding: -2px;
            }

            nav {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .logo img {
                width: 85px;
                height: auto;
                margin-left: 5px;
            }

            .links {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-grow: 1;
            }

            .nav_links {
                margin-right: 20px;
                color: #fff;
                text-decoration: none;
                font-size: 20px;
            }

            .nav_links:hover {
                text-decoration: none;
                background-color: #f5f5f5;
                color: #333;
            }

            .profile-dropdown {
                position: relative;
                cursor: pointer;
            }

            .img-profile img {
                width: 10px;
                height: auto;
                border-radius: 50%;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #fff;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
                z-index: 1;
            }

            .profile-dropdown.open .dropdown-content {
                display: block;
            }

            .dropdown-content a {
                display: block;
                padding: 10px;
                text-decoration: none;
                color: #333;
            }

            .dropdown-content a:hover {
                background-color: #f5f5f5;
            }

            .display_project {
                margin-top: 20px;
            }

            .display_project h2 {
                color: #333;
            }

            .img-profile img {
                width: 60px;
                height: auto;
                border-radius: 50%;
            }

            .display_profileStudent {

                margin-top : 120px;
                text-align: center;
            }
            .back-button {
                text-align: center;
                margin-top: 400px;

            }
            .back-button a {
                color: black;
            }
            .profile-container{
                
            }
        </style>

    <body>
        <header>
            <nav>
                <div class="logo">
                    <img src="data:image/png;base64,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"
                         width="200px">
                </div>
                <div class="links">
                    <a href="#" class="nav_links">Project</a>
                    <a href="#" class="nav_links">Task</a>
                    <a href="#" class="nav_links">Milestone</a>
                    <a href="#" class="nav_links">Issue</a>
                    <a href="#" class="nav_links">Report</a>
                </div>            
            </nav>
        </header>

        <div class="display_profileStudent">
            <h2>PROFILE</h2>
            <div class="profile-container">
          
                <p>User name:  ${session.getUsername()}></p>
                <p>Email:  ${session.getEmail()}></p>
            </div>
        </div>
        <div class="back-button" >
            <a href="lectureview" class="nav_links">Back</a>
        </div>
    </body>

</html>
