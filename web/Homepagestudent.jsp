<%-- Document : Showstudentinclass Created on : Feb 21, 2024, 1:54:14 AM Author : tieup --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Task</title>

        <!-- Custom fonts for this template -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <!--fontawesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/task.css" rel="stylesheet">
        <link href="css/mytask.css" rel="stylesheet">

        <!-- Custom styles for this page -->
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <%@ include file="Sidebar_Student.jsp" %>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <%@ include file="Topbar.jsp" %>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Task</h1>
                        <p class="mb-4">List of task</p>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4 ">
                            <div class="card-header py-3">
                                <h6 class="m-0  font-weight-bold text-primary">Task</h6>
                            </div>

                            <div class="card-body">
                                <c:if test="${not empty id_account}">
                                    <h1 style="cursor: pointer;" onclick="Grade(${id_account})">${user_name}</h1>
                                </c:if>
                                <form action="comment" method="POST">
                                    <div class="table-responsive">

                                        <table class="table table-bordered" id="dataTable" width="100%"
                                               cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Task name</th>
                                                    <th>Milestone</th>
                                                    <th>Task description</th>
                                                    <th>Start_date</th>
                                                    <th>End_Date</th>

                                                    <c:choose>
                                                        <c:when test="${session.getRole_project() == 'TL'}">
                                                            <th>Status</th>
                                                            </c:when>

                                                        <c:otherwise>
                                                            <th>Action</th>
                                                            </c:otherwise>
                                                        </c:choose>
                                                </tr>
                                            </thead>
                                            <ul id="taskList">
                                                <tbody>

                                                    <c:forEach items="${tasks}" var="task" varStatus="loop">
                                                        <tr>

                                                            <td>${loop.index + 1}</td>
                                                            <td>
                                                                <input type="hidden" name="task_id" value="${task.idTask}">
                                                                <button type="submit" class="nav-link text-primary" style=" border: none; background-color: transparent; padding: 0; cursor: pointer;" >${task.taskName}</button>
                                                            </td>
                                                            <td>
                                                                <%-- Iterate through milestones to find the corresponding milestone name --%>
                                                                <c:forEach items="${milestones}" var="milestone">
                                                                    <c:if test="${milestone.id_milestone == task.idMilestone}">
                                                                        ${milestone.name_milestone}
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>
                                                            <td>${task.taskDescription}</td>
                                                            <td>${task.startDate}</td>
                                                            <td>${task.endDate}</td>

                                                            <td>
                                                                <%-- Display task type --%>

                                                                <c:choose>
                                                                    <c:when test="${session.getRole_project() == 'TL'}">
                                                                        <select class="form-control bg-light border-0 small" name="taskType" id="taskType_${loop.index}" onchange="Sendata(${task.idTask}, this.value)">
                                                                            <c:forEach items="${tasktypes}" var="tasktypeText">
                                                                                <option value="${tasktypeText.taskType_Id}" <c:if test="${tasktypeText.taskType_Id == task.taskTypeId}">selected</c:if>>${tasktypeText.taskType_Name}</option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </c:when>

                                                                    <c:otherwise>
                                                                        <div class="notification" onmouseover="showNotification()" onmouseout="hideNotification()">
                                                                            <a href="#" id="emailDropdown" aria-haspopup="true" aria-expanded="false">
                                                                                <i class="fa-regular fa-bell"></i>
                                                                            </a>
                                                                            <div class="notification-content" id="notificationContent">
                                                                                Gửi thông báo cho Team Leader
                                                                            </div>
                                                                        </div>
                                                                    </c:otherwise>
                                                                </c:choose>



                                                                <!--                                                                dan thuong-->

                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </ul>
                                        </table>
                                    </div>
                                </form> 
                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->
                <!-- Footer -->
                <%@ include file="Footer.jsp" %>
                <!-- End of Footer -->
            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your
                        current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button"
                                data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login.jsp">Logout</a>
                    </div>
                </div>
            </div>
        </div>



        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/datatables-demo.js"></script>
        <script>

                                                                            function Grade(id) {
                                                                                // Tạo URL với tham số taskIDs và checkedIDs
                                                                                var urlWithParams = 'Grade.jsp?accountId=' + encodeURIComponent(id);

                                                                                // Chuyển hướng đến URL mới
                                                                                window.location.href = urlWithParams;
                                                                            }

        </script>
        

    </body>

</html>