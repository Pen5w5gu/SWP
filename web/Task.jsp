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

        <!-- Custom styles for this page -->
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    </head>

    <body id="page-top">
        <script>
            function Sendata(taskId, newTaskTypeId) {
                // Tạo một đối tượng XMLHttpRequest
                var xhr = new XMLHttpRequest();

                // Thiết lập phương thức và URL cho servlet
                xhr.open("POST", "shange_status", true);
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

                // Thiết lập hàm xử lý khi nhận được phản hồi từ server
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                        // Xử lý phản hồi từ server nếu cần
                        console.log("Dữ liệu đã được gửi thành công!");
                    } else {
                        console.log("Failed");
                    }
                };

                // Gửi yêu cầu POST với dữ liệu taskId và newTaskTypeId
                xhr.send("taskId=" + taskId + "&newTaskTypeId=" + newTaskTypeId);
            }

        </script>

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="Homepagestudent.jsp">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fa-solid fa-graduation-cap"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Project Management</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item ">
                    <a class="nav-link" href="Homepagestudent.jsp">
                        <i class="fa-solid fa-church"></i>
                        <span>Home</span></a>
                </li>

                <!-- Heading -->

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Interface
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse"
                       data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Project</span>
                    </a>

                    <div id="collapsePages" class="collapse" aria-labelledby="headingPages"
                         data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">List Project</h6>
                            <div class="collapse-divider"></div>
                            <c:choose>
                                <c:when test="${not empty projects}">

                                    <c:forEach var="project" items="${projects}">
                                        <div class="project-container">
                                            <form id="form_${project.project_name}" action="showprojectstudent" method="GET" onsubmit="return submitForm('${project.project_name}')">
                                                <div class="project-item">
                                                    <input type="hidden" name  ="ID_project" value="${project.id_Project}" />
                                                    <a style="text-decoration: none;" href="#" onclick="document.getElementById('form_${project.project_name}').submit();">Project ${project.project_name}</a>
                                                </div>
                                            </form>
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <p>No PROJECTS available</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </li>

                <li class="nav-item active">
                    <a class="nav-link " href="task">
                        <i class="fa-solid fa-list-check"></i>
                        <span>Task</span></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="milestone">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Milestone</span></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="charts.html">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Issue</span></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="charts.html">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Report</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Search -->
                        <form action="searchclass"
                              class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group">
                                <input type="text" required="" class="form-control bg-light border-0 small"
                                       name="class" aria-label="Search" aria-describedby="basic-addon2"
                                       placeholder="Tìm kiếm tên lớp...">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="submit">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                     aria-labelledby="searchDropdown">
                                    <form action="searchstudent?classname=${Classname}" class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" name="namest"class="form-control bg-light border-0 small"
                                                   placeholder="Search for..." aria-label="Search"
                                                   aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="submit">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>

                            <!-- Nav Item - Alerts -->
                            <li class="nav-item dropdown no-arrow mx-1">
                                <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-bell fa-fw"></i>
                                    <!-- Counter - Alerts -->
                                    <span class="badge badge-danger badge-counter">3+</span>
                                </a>
                                <!-- Dropdown - Alerts -->
                                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="alertsDropdown">
                                    <h6 class="dropdown-header">
                                        Alerts Center
                                    </h6>
                                    <c:choose>
                                        <c:when test="${not empty notifications}">
                                            <c:forEach items="${notifications}" var="noti">
                                                <a class="dropdown-item d-flex align-items-center" href="#">
                                                    <div class="mr-3">
                                                        <div class="icon-circle bg-primary">
                                                            <i class="fas fa-file-alt text-white"></i>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <div class="small text-gray-500">${noti.date}</div>
                                                        <span class="font-weight-bold">${noti.user_name} ${noti.notification} 
                                                            <c:forEach items="${tasks}" var="task"> 
                                                                <c:if test="${task.idTask == noti.id_task}">
                                                                    ${task.taskName}
                                                                </c:if>
                                                            </c:forEach>
                                                        </span>
                                                    </div>
                                                </a>
                                            </c:forEach> 
                                        </c:when>
                                        <c:otherwise>
                                            <p class="text-center" style="padding-top: 10px">No notifications available</p>
                                        </c:otherwise>
                                    </c:choose>

                                    <a class="dropdown-item text-center small text-gray-500" href="#">Show All
                                        Alerts</a>
                                </div>
                            </li>

                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Xin chào,
                                        ${session.getUsername()}</span>
                                    <img class="img-profile rounded-circle" src="img/undraw_profile.svg">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Settings
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Activity Log
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal"
                                       data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Task</h1>
                        <p class="mb-4">List of task</p>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4 ">
                            <div class="card-header d-sm-flex align-items-center justify-content-between mb-4">
                                <h6 class="m-0  font-weight-bold text-primary">Task</h6>
                                <h1>${roleProject}</h1>
                                <c:if test="${session.getRole_project() == 'TL'}">
                                    <a href="Add_Task.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                                        <i class="fa-solid fa-plus"></i> New task
                                    </a>
                                </c:if>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <form action="comment" method="POST">
                                        <table class="table table-bordered" id="dataTable" width="100%"
                                               cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th >ID </th>
                                                    <th>Task name</th>
                                                    <th>Milestone</th>
                                                    <th>Task description</th>
                                                    <th>Start_date</th>
                                                    <th>End_Date</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>

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
                                                                    <c:forEach items="${tasktypes}" var="tasktypeText">
                                                                        <c:if test="${tasktypeText.taskType_Id == task.taskTypeId}">
                                                                            ${tasktypeText.taskType_Name}
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>

                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

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

    </body>

</html>