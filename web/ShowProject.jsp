<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Project" %>
<%@ page import="model.Class" %>
<%@ page import="java.util.List" %>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Project Managerment</title>
        <!--        <link rel="stylesheet" href="test2.css">
                <script src="script.js"></script>-->
    </head>

    <body>
        <script>
            function submitForm(class_name) {
                console.log(`Submitting form for class: ${class_name}`);
                // Optionally, perform any additional actions or validations here

                // Set the class_name value in the hidden input
                document.getElementById(`form_${class_name}`).elements["class_name"].value = class_name;

                // Submit the form
                document.getElementById(`form_${class_name}`).submit();

                // Return false to prevent the default link navigation
                return false;
            }
        </script>


        <style>
            body {
                font-family: 'Roboto', sans-serif;
                margin: 0;
                padding: 0;
            }

            .container {
                display: flex;
                justify-content: space-between;
            }

            .section_left {
                width: 20%;
                background-color: #f5f5f5;
                padding: 20px;
                height: 100vh;
                box-sizing: border-box;
            }

            .menu-container img {
                width: 100%;
                height: auto;
                margin-bottom: 20px;
            }

            .content_menu a {
                display: block;
                padding: 10px;
                margin-bottom: 10px;
                text-decoration: none;
                color: #333;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .content_menu a:hover {
                background-color: #e0e0e0;
            }

            .section_right {
                width: 80%;
                padding: 20px;
                box-sizing: border-box;
            }

            .header {
                background-color: #4285f4;
                color: #ffffff;
                padding: 10px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .header h2 {
                margin: 0;
            }

            .avatar img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
            }

            .profile-dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #ffffff;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                border-radius: 5px;
                right: 0;
                z-index: 1;
            }

            .dropdown-content a {
                color: #333;
                padding: 10px;
                text-decoration: none;
                display: block;
                transition: background-color 0.3s ease;
            }

            .dropdown-content a:hover {
                background-color: #e0e0e0;
            }

            .product {
                background-color: #ffffff;
                padding: 20px;
                border: 1px solid #e0e0e0;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
                border-radius: 5px;
            }

            .product a {
                color: #4285f4;
                text-decoration: none;
            }

            .product a:hover {
                text-decoration: underline;
            }

            .product p {
                margin: 0;
                color: #333;
            }
            .content_menu a {
                display: block;
                padding: 20px;
                margin-bottom: 10px;
                text-decoration: none;
                color: #333;
                border-radius: 10px; /* Increased border radius to create a square shape */
                transition: background-color 0.3s ease;
                background-color: #ffffff;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .content_menu a:hover {
                background-color: #e0e0e0;

                .content_class {
                    display: grid;
                    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); /* Adjust the minmax values based on your design */
                    gap: 20px; /* Adjust the gap between squares based on your design */
                }

                .content_class form {
                    text-align: center;
                }

                .content_class a {
                    display: block;
                    padding: 20px;
                    text-decoration: none;
                    color: #333;
                    border-radius: 10px; /* Increased border radius to create a square shape */
                    transition: background-color 0.3s ease;
                    background-color: #ffffff;
                    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                }

                .content_class a:hover {
                    background-color: #e0e0e0;
                }
            }
            .dropdown-content {
                /* Your existing styles for the dropdown content */
                padding: 10px;
                margin-top: 10px;
                /* Display flex to make the icons and text align horizontally */
                display: flex;
                align-items: center;
            }

            .icon_classroom img,
            .icon_project img,
            .icon_logout img {
                max-width: 40px;
                max-height: 40px;
                margin-right: 10px;
            }

            .header_classrom,
            .header_project,
            .header_sign_out {
                margin-right: 20px; /* Add margin between sections */
                display: flex;
                align-items: center;
            }

            .dropdown-content a {
                color: #333;
                text-decoration: none;
                padding: 5px;
                display: flex;
                align-items: center; /* Align text and icon vertically */
            }

            .dropdown-content a:hover {
                background-color: #f0f0f0;
            }
        </style>


        <div class="container">

            <!--Code List products here-->
            <div class="section_left">
                <div class="menu-container">
                    <img class="image1"
                         src="data:image/png;base64,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"
                         width="200px">
                </div>
                <div class="content_menu">

                    <c:choose>
                        <c:when test="${not empty classes}">
                            <c:forEach var="myclass" items="${classes}">
                                <form id="form_${myclass.class_name}" action="showproject" method="GET" onsubmit="return submitForm(${myclass.class_name})">
                                    <a href="#" onclick="document.getElementById('form_${myclass.class_name}').submit();">Class ${myclass.class_name}</a><!-- comment -->
                                    <input type="hidden" name="class_name" value="${myclass.class_name}">
                                </form>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <p>No classes available</p>
                        </c:otherwise>
                    </c:choose>

                </div>

                </form>
            </div><!-- End List-->

            <div class="section_right">

                <div class="header">
                    <div class="header_text">
                        <h2 style="color: rgb(230, 93, 13);">
                            Project Management 
                        </h2>

                    </div>
                    <div class="profile-dropdown">
                        <div class="button-login">
                            <div class="avatar" onclick="toggleInfo()">
                                <img src="https://via.placeholder.com/150" alt="Avatar">
                            </div>
                        </div>
                        <div class="dropdown-content additional-info">
                            <!-- Additional information goes here -->
                            <div class="header_classrom">
                                <div class="icon_classroom">
                                    <img src="https://e7.pngegg.com/pngimages/78/883/png-clipart-computer-icons-google-classroom-keyword-research-technical-application-text-black.png">
                                </div><!-- comment -->
                                <a href="#">My Clss</a>

                            </div>
                            <div class="header_project">
                                <div class="icon_project">
                                    <img src="https://w7.pngwing.com/pngs/599/165/png-transparent-project-management-task-computer-icons-others-text-logo-project-management.png">
                                </div>
                                <a href="#">My Project</a>
                            </div>
                            <div class="header_project">
                                <div class="icon_project">
                                    <img src="https://w7.pngwing.com/pngs/599/165/png-transparent-project-management-task-computer-icons-others-text-logo-project-management.png">
                                </div>
                                <form id="profileForm" action="showinfor" method="post">
                                    <a href="ShowInforAccount.jsp" >My Profile</a>
                                </form>
                            </div>
                            <div class="header_sign_out">
                                <div class="icon_logout">
                                    <img src="https://cdn-icons-png.flaticon.com/512/126/126467.png">
                                </div>
                                <a href="logout">Log Out</a>
                            </div>
                        </div>
                    </div>
                </div>  
                <div class="content_menu">
                    <c:choose>
                        <c:when test="${not empty projects}">
                            <c:forEach var="project" items="${projects}">
                                <form id="form_${project.project_name}" action="lecture_viewclass" method="POST" onsubmit="return submitForm()">
                                    <a href="#" onclick="submitForm()"> Class${project.project_name}</a>
                                    <input type="hidden" name="class_name" value="${project.project_name}">
                                </form>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <p>No PROJECTS available</p>
                        </c:otherwise>
                    </c:choose>



                </div>




            </div>




    </body>

    <script>
        function submitForm(class_name) {
            console.log(`Submitting form for class: ${class_name}`);
            // Optionally, perform any additional actions or validations here

            // Set the class_name value in the hidden input
            document.getElementById(`form_${class_name}`).elements["class_name"].value = class_name;

            // Submit the form
            document.getElementById(`form_${class_name}`).submit();

            // Return false to prevent the default link navigation
            return false;
        }
        function toggleInfo() {
            var info = document.querySelector('.additional-info');
            info.style.display = info.style.display === 'none' ? 'block' : 'none';
        }

    </script>

</html>



