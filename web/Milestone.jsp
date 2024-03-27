<%-- Document : Showstudentinclass Created on : Feb 21, 2024, 1:54:14 AM Author : tieup --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

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
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

        <!-- Custom styles for this page -->
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <c:if test="${session.getId_role() == 1}">
                <%@ include file="Sidebar_Lecture.jsp" %>
            </c:if>
            <c:if test="${session.getId_role() == 2}">
                <%@ include file="Sidebar_Student.jsp" %>
            </c:if>


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
                        <h1 class="h3 mb-2 text-gray-800">Milestone</h1>
                        <c:if test="${session.getRole_project() == 'TL'}">
                            <a href="Add_Milestone.jsp" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm">
                                <i class="fa-solid fa-plus"></i> New task
                            </a>
                        </c:if>
                        </br></br>

                        <!-- DataTales Example -->
                        <c:if test="${empty milestones}">
                            <p>Không có milestone nào.</p>
                        </c:if>

                        <c:forEach items="${milestones}" var="milestone">
                            <div class="card shadow mb-4">
                                <div class="card-header d-sm-flex align-items-center justify-content-between mb-4">
                                    <h6 class="m-0 font-weight-bold text-primary">${milestone.name_milestone}</h6>
                                    <c:if test="${session.getRole_project() == 'TL'}">
                                        <div class="edit-buttons">

                                            <a href="edit_milestone1?milestone_id=${milestone.id_milestone}"  class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                                                <i class="fa-solid fa-pen-to-square"></i> Edit
                                            </a>
                                            <a href="delete_milestone?milestone_id=${milestone.id_milestone}"  class="d-none d-sm-inline-block btn btn-sm btn-danger shadow-sm">
                                                <i class="fa-solid fa-pen-to-square"></i> Delete
                                            </a>
                                        </div>
                                    </c:if>
                                </div>
                                <div class="card-body">
                                    <c:forEach items="${tasktypes}" var="tasktype">
                                        <%-- Accessing percentage using EL --%>
                                        <c:set var="milestoneId" value="${milestone.id_milestone}" />
                                        <c:set var="attributeName" value="taskOfMilestonessize${milestoneId}" />
                                        <c:set var="milestoneIndex" value="${milestoneId-1}" />
                                        <c:set var="taskTypeIndex" value="${tasktype.taskType_Id}" />
                                        <!--                                        because the list will start with 0-->
                                        <c:set var="percentageMap" value="${milestoneTaskTypePercentageList[milestoneIndex]}" />
                                        <c:set var="percentage" value="${percentageMap[taskTypeIndex]}" />
                                        <c:set var="size" value="${requestScope[attributeName]}" />
                                        <c:set var="taskCount" value="${Math.round(percentage * size / 100)}" />

                                        <%-- Default percentage if not present --%>
                                        <c:if test="${empty percentage}">
                                            <c:set var="percentage" value="10" />
                                        </c:if>

                                        <h4 class="small font-weight-bold">${tasktype.taskType_Name} <span class="float-right">${percentage}% | ${taskCount}</span></h4>
                                        <div class="progress mb-4">
                                            <div class="progress-bar bg-danger" role="progressbar" style="width: ${percentage}%"
                                                 aria-valuenow="${percentage}" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:forEach>







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
                        <a class="btn btn-primary" href="logout">Logout</a>
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