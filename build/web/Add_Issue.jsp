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

        <title>Add Issue</title>

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
        <link href="css/custom.css" rel="stylesheet">

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
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <%@ include file="Topbar.jsp" %>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid" style="padding-left: 250px; padding-right: 250px;">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Issues</h1>
                        <p class="mb-4">List of issues</p>

                        <!-- DataTales Example -->
                        <form action="Add_Issue" id="issueForm">
                            <input type="hidden" id="milestone_id" name="milestone_id" value="1"/>
                            <div class="card shadow mb-4">
                                <div class="card-header d-sm-flex align-items-center justify-content-between mb-4">
                                    <h6 style="padding-right: 15px"  class="m-0 font-weight-bold text-primary"> Add Issue</h6>
                                </div>
                                <div class="card-body">
                                    <div class="" style="display: flex">
                                        <img class="img-profile rounded-circle" src="img/undraw_profile.svg" style="max-width: 40px; max-height: 40px; margin-right: 10px">
                                        <div class="title">
                                            <p class="mb-2 font-weight-bold text-gray-900">Add a title</p>
                                            <input required="required" autofocus="autofocus" autocomplete="off" placeholder="Title" aria-labelledby="issue_title" class="form-control" type="text" name="title_issue" id="title_issue">
                                        </div>
                                    </div>
                                    <br>
                                    
                                    <div class="" style="padding-left: 50px;">
                                        <div class="title">
                                            <p class="mb-2 font-weight-bold text-gray-900">Add a description</p>
                                            <textarea required="required" autofocus="autofocus" autocomplete="off" placeholder="Add your description here..." aria-labelledby="issue_content" class="form-control textarea-500" name="content_issue" id="content_issue"  style="height: 200px;"></textarea>
                                        </div>
                                    </div>
                                    <div class="flex-items-center flex-justify-end d-none d-md-flex my-3">
                                        <button type="submit" data-disable-invalid="" data-disable-with="" type="submit" data-view-component="true" class="btn-primary btn ml-2" disabled>Submit new issue</button>        
                                    </div>
                                </div>
                            </div>
                        </form>

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
                                                        document.addEventListener("DOMContentLoaded", function () {
                                                            var titleInput = document.getElementById("title_issue");
                                                            var contentTextarea = document.getElementById("content_issue");
                                                            var submitButton = document.querySelector("#issueForm button[type='submit']");

                                                            function checkInputs() {
                                                                if (titleInput.value.trim() !== "" && contentTextarea.value.trim() !== "") {
                                                                    submitButton.disabled = false;
                                                                } else {
                                                                    submitButton.disabled = true;
                                                                }
                                                            }

                                                            titleInput.addEventListener("input", checkInputs);
                                                            contentTextarea.addEventListener("input", checkInputs);
                                                        });
        </script>
    </body>

</html>