<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Project" %>
<%@ page import="model.Class" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8"> <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Project Management</title>


        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <!--fontawesome-->
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
                <%@ include file="Sidebar_Lecture.jsp" %>    
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
                            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                <h1 class="h3 mb-0 text-gray-800">Class </h1>
                                <a href="#"
                                   class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                        class="fas fa-download fa-sm text-white-50"></i> generate report</a>
                            </div>

                            <!-- Content Row -->
                            <div class="row">
                                <c:choose>
                                    <c:when test="${not empty classes}">

                                        <c:forEach var="myclass" items="${classes}">
                                            <div class="col-xl-3 col-md-6 mb-4">
                                                <div class="card border-left-info shadow h-100 py-2">
                                                    <div class="card-body">
                                                        <div class="row no-gutters align-items-center">
                                                            <div class="col mr-2">
                                                                <div
                                                                    class="h5 mb-0 font-weight-bold text-gray-800">
                                                                    Class ${myclass.class_name}</div>

                                                                <div
                                                                    class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                                    ${session.getUsername()}
                                                                </div>
                                                            </div>
                                                            <div class="col-auto">
                                                                <!--Chart Grade-->
                                                                <form action="showproject" method="GET" >
                                                                    <a href='ChartGrade.jsp'>
                                                                        <i class="fa-solid fa-chart-pie fa-2x text-gray-300"></i>
                                                                    </a>
                                                                    <input type="hidden" name="class_name" value="${myclass.class_name}">
                                                                </form>
                                                                
                                                            </div>
                                                                
                                                            <div class="col-12 text-right d-flex justify-content-end align-items-center">
                                                                <form id="form_${myclass.class_name}" action="showproject" method="GET"
                                                                      class="mr-2">
                                                                    <a href='showstudentinclass?classname=${myclass.class_name}'>
                                                                        <i class="fa-solid fa-list-check fa-1x"></i>
                                                                    </a>
                                                                    <input type="hidden" name="class_name" value="${myclass.class_name}">
                                                                </form>

                                                                <form id="form_${myclass.class_name}_folder" action="showproject" method="GET">
                                                                    <a href="showproject?classname=${myclass.class_name}">
                                                                        <i class="fa-regular fa-folder fa-1x"></i>
                                                                    </a>
                                                                    <input type="hidden" name="class_name" value="${myclass.class_name}">
                                                                </form>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>

                                    </c:when>
                                    <c:otherwise>
                                        <p>No classes available</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <!-- /.container-fluid -->

                        </div>
                        <!-- End of Main Content -->

                        <!-- Footer -->


                        <!-- End of Footer -->
                    </div>
                    <!-- End of Content Wrapper -->
                    <!-- Footer -->
                    <%@ include file="Footer.jsp" %>
                    <!-- End of Footer -->
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
                <script src="vendor/chart.js/Chart.min.js"></script>

                <!-- Page level custom scripts -->
                <script src="js/demo/chart-area-demo.js"></script>
                <script src="js/demo/chart-pie-demo.js"></script>

        </body>

    </html>