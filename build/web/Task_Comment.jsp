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
        <link href="css/comment.css" rel="stylesheet">

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
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Task</h1>


                        <!-- DataTales Example -->
                        <div class="card shadow mb-4 ">
                            <div class="card-header d-sm-flex align-items-center justify-content-between mb-4">
                                <h6 class="m-0 font-weight-bold text-primary">Comment in task ${task.taskName}</h6>
                                <h1>${roleProject}</h1>
                                <c:if test="${session.getRole_project() == 'TL'}">
                                    <a href="task" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                                        <i class="fa-solid fa-chevron-left"></i> Back to list task
                                    </a>
                                </c:if>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <form action="comment" method="POST">
                                        <table class="table table-bordered"  width="100%"
                                               cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Task name</th>
                                                    <th>Milestone</th>
                                                    <th>Task description</th>
                                                    <th>Start_date</th>
                                                    <th>End_Date</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <tr>
                                                    <td>${tasks.idTask + 1}</td>
                                                    <td>
                                                        <p class="nav-link font-weight-bold text-primary">${task.taskName}</p>
                                                    </td>
                                                    <td>
                                                        <c:if test="${milestone.id_milestone == task.idMilestone}">
                                                            ${milestone.name_milestone}
                                                        </c:if>
                                                    </td>
                                                    <td>${task.taskDescription}</td>
                                                    <td>${task.startDate}</td>
                                                    <td>${task.endDate}</td>

                                                    <td>
                                                        <%-- Display task type --%>
                                                        <c:choose>
                                                            <c:when test="${session.getRole_project() == 'TL'}">
                                                                <%-- Dropdown selection for TL to choose new task type --%>
                                                                <select class="form-control bg-light border-0 small" name="taskType" id="taskType_${loop.index}" onchange = "Sendata(${task.idTask}, this.value)">
                                                                    <c:forEach items="${tasktypes}" var="tasktypeText">
                                                                        <option value="${tasktypeText.taskType_Id}" >${tasktypeText.taskType_Name}</option>
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
                                            </tbody>

                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="card shadow mb-4 ">
                            <div class="card-header d-sm-flex align-items-center justify-content-between mb-4">
                                <h6 class="m-0 font-weight-bold text-primary">Comment</h6>
                            </div>
                            <div class="container bootdey">
                                <div class="col-md-12 bootstrap snippets">
                                    <div class="panel">
                                        <form action="add_comment">
                                            <div class="panel-body">
                                                <input type="hidden" name="task_id" value="${task.idTask}"/>
                                                <textarea class="form-control" name="comment" rows="2" placeholder="What are you thinking?"></textarea>
                                                <div class="mar-top clearfix">
                                                    <button class="btn btn-sm btn-primary pull-right" type="submit"><i class="fa fa-pencil fa-fw"></i> Share</button>
                                                    <a class="btn btn-trans btn-icon" href="#"><i class="fa-solid fa-camera"></i></a>
                                                    <a class="btn btn-trans btn-icon" href="#"><i class="fa-solid fa-video"></i></a>
                                                    <a class="btn btn-trans btn-icon" href="#"><i class="fa-solid fa-file"></i></a>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="panel">
                                        <div class="panel-body">
                                            <!-- Newsfeed Content -->
                                            <!--===================================================-->
                                            <c:forEach items="${comments}" var="comment">
                                                <div class="media-block">
                                                    <a class="media-left" style="padding-right: 10px" href="#"><img class="img-circle img-sm" alt="Profile Picture" src="img/undraw_profile.svg"></a>
                                                    <div class="media-body ">
                                                        <form action="edit_comment">
                                                            <div class="mar-btm d-sm-flex align-items-center justify-content-between mb-4">
                                                                <a href="#" class="btn-link text-semibold media-heading box-inline">${comment.id_Account}</a>
                                                                <!-- Nút dropdown -->

                                                                <c:if test="${session.getId_account() == comment.id_Account}">
                                                                    <div id="dropdownContainer" class="dropdown pull-right">
                                                                        <button id="dropdownButton" class="btn btn-default dropdown-toggle form-control bg-light border-0 small" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                            <i class="fa fa-ellipsis-h"></i>
                                                                        </button>
                                                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                                                                            <a class="dropdown-item" href="#" onclick="enableEdit()">Edit</a>
                                                                            <a class="dropdown-item" href="#" onclick="deleteComment(${comment.id_comment})">Delete</a>
                                                                        </div>
                                                                    </div>
                                                                </c:if>
                                                                <!-- End nút dropdown -->

                                                            </div>

                                                            <div style="position: relative;">
                                                                <input type="hidden" name="id_comment" value="${comment.id_comment}"/>
                                                                <textarea class="form-control form-control-sm border-0" id="myInput" wrap="soft" maxlength="250" readonly style="overflow-wrap: break-word; height: auto; resize: none;">${comment.comment_description}</textarea>
                                                                <div id="charCount" style="position: absolute; bottom: 5px; right: 5px; font-size: 10px; display: none;"></div>
                                                            </div>
                                                        </form>


                                                        <div class="pad-ver">
                                                            <div class="btn-group">
                                                                <a class="btn btn-sm btn-default btn-hover-success" href="#"><i class="fa fa-thumbs-up"></i></a>
                                                                <a class="btn btn-sm btn-default btn-hover-danger" href="#"><i class="fa fa-thumbs-down"></i></a>
                                                            </div>
                                                            <a class="btn btn-sm btn-default btn-hover-primary" href="#">Comment</a>
                                                        </div>
                                                        <hr>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <!--===================================================-->
                                            <!-- End Newsfeed Content -->
                                        </div>
                                    </div>

                                </div>
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

        <script>
                                                                                function Sendata(taskId, newTaskTypeId) {
                                                                                    // Tạo một đối tượng XMLHttpRequest
                                                                                    var xhr = new XMLHttpRequest();

                                                                                    // Thiết lập phương thức và URL cho servlet
                                                                                    xhr.open("POST", "change_status", true);
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
        <script>
            function deleteComment(commentId) {
                var confirmation = confirm("Are you sure you want to delete this comment?");
                if (confirmation) {
                    // Gửi yêu cầu AJAX đến servlet delete_comment
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "delete_comment", true);
                    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                            // Xử lý phản hồi từ servlet (nếu cần)
                            console.log(xhr.responseText); // In phản hồi từ servlet ra console log
                            // Ví dụ: Reload trang sau khi xóa bình luận
                            window.location.reload();
                        }
                    };
                    // Gửi dữ liệu bình luận ID như là một tham số POST
                    xhr.send("comment_id=" + commentId);
                }
            }


            // Hàm để cập nhật số ký tự còn lại
            function updateCharCount() {
                var maxLength = 250; // Độ dài tối đa của textarea
                var currentLength = document.getElementById("myInput").value.length; // Độ dài hiện tại của nội dung textarea
                var remaining = maxLength - currentLength; // Số ký tự còn lại

                document.getElementById("charCount").innerText = remaining + "/250";
            }

            // Gọi hàm cập nhật lần đầu
            updateCharCount();

            // Thêm sự kiện onchange vào textarea để cập nhật số ký tự khi nội dung thay đổi
            document.getElementById("myInput").addEventListener("input", updateCharCount);

            function enableEdit() {
                document.getElementById("myInput").readOnly = false;
                document.getElementById("dropdownButton").innerHTML = "Save"; // Thay đổi nội dung của nút thành "Save"
                document.getElementById("dropdownButton").setAttribute("onclick", "saveChanges()"); // Thêm sự kiện onclick mới cho nút
                document.getElementById("charCount").style.display = "block"; // Hiển thị charCount
                document.getElementById("myInput").classList.remove("border-0"); // Xóa lớp CSS "border-0"
            }

            function saveChanges() {
                var id_comment_element = document.getElementsByName("id_comment")[0]; // Lấy phần tử input hidden cho id_comment
                var task_id_element = document.getElementsByName("task_id")[0]; // Lấy phần tử input hidden cho task_id
                if (id_comment_element && task_id_element) {
                    var id_comment = id_comment_element.value;
                    var task_id = task_id_element.value;
                    var editedComment = document.getElementById("myInput").value;
                    // Thực hiện các hành động khi người dùng nhấp vào "Save" ở đây
                    document.getElementById("myInput").readOnly = true;
                    document.getElementById("dropdownButton").innerHTML = '<i class="fa fa-ellipsis-h"></i>'; // Thay đổi lại nội dung của nút thành icon "..." ban đầu
                    document.getElementById("dropdownButton").setAttribute("onclick", ""); // Xóa sự kiện onclick của nút
                    document.getElementById("charCount").style.display = "none"; // Ẩn charCount
                    document.getElementById("myInput").classList.add("border-0"); // Thêm lớp CSS "border-0"
                    // Chuyển hướng tới URL edit_comment với tham số id_comment, task_id, và giá trị đã chỉnh sửa
                    window.location.href = "edit_comment?idcomment=" + id_comment + "&task_id=" + task_id + "&comment=" + editedComment;
                } else {
                    console.error("Element with name 'id_comment' or 'task_id' not found or has no value.");
                }
            }


        </script>


        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/datatables-demo.js"></script>

    </body>

</html>