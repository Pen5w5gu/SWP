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
                        <h1 class="h3 mb-2 text-gray-800">Issues</h1>
                        <p class="mb-4">List of issues</p>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4 ">
                            <div class="card-header d-sm-flex align-items-center justify-content-between mb-4">
                                <div style="align-content: center; display: flex">
                                    <h6 style="padding-right: 15px" class="m-0  font-weight-bold text-primary"><i class="fa-regular fa-circle-dot"></i> 0 Open </h6>

                                    <h6  class="m-0  font-weight-bold text-gray-500"><i class="fa-solid fa-check"></i> 0 Closed  </h6>
                                </div>


                                <a href="Add_Issue.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                                    <i class="fa-solid fa-plus"></i> New issue
                                </a>
                            </div>
                            <div id="actionButtons" style="display:none; margin-left: 20px;">
                                <p id="taskCount">Số lượng issue đã chọn:</p>
                                <div style="display: flex">
                                    <button id="uncheckAllButton" class="d-none d-sm-inline-block btn btn-sm btn-danger shadow-sm ">Deselect all</button>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Mark as
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right animated--fade-in" aria-labelledby="navbarDropdown">

                                            <button id="sendButton" class="dropdown-item" onclick="sendSelectedTasks()">Open</button>
                                            <button id="sendButton" class="dropdown-item" onclick="sendSelectedTasks()">Closed</button>
                                        </div>
                                    </li>
                                </div>

                            </div>
                            <div class="card-body">
                                <form action="comment" method="POST">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%"
                                               cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th> Select</th>
                                                    <th >ID</th>
                                                    <th>Tittle</th>
                                                    <th>Milestone</th>
                                                    <th>Date</th>
                                                    <th>Author</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <ul id="taskList">
                                                <tbody>

                                                    <c:forEach items="${issues}" var="issue" varStatus="loop">
                                                        <tr>
                                                            <td> <input type="checkbox" id="${issue.id_issue}" value="${issue.id_issue}" ></td>
                                                            <td>${loop.index + 1}</td>
                                                            <td>
                                                                <input type="hidden" name="task_id" value="${issue.id_issue}">
                                                                <button type="submit" class="nav-link text-primary" style=" border: none; background-color: transparent; padding: 0; cursor: pointer;" >${issue.title}</button>
                                                            </td>
                                                            <td>
                                                                <%-- Iterate through milestones to find the corresponding milestone name --%>
                                                                <c:forEach items="${milestones}" var="milestone">
                                                                    <c:if test="${milestone.id_milestone == issue.id_milestone}">
                                                                        ${milestone.name_milestone}
                                                                    </c:if>
                                                                </c:forEach>


                                                            </td>
                                                            <td>${issue.date}</td> 
                                                            <c:forEach items="${users}" var="user">
                                                                <c:if test="${user.id_account == issue.id_author}">
                                                                    <td>${user.username}</td>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${issue.isStatus() == 1}">
                                                                <td>Open</td>
                                                            </c:if>
                                                            <c:if test="${issue.isStatus() == 0}">
                                                                <td>Closed</td>
                                                            </c:if>





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
                                                document.addEventListener("DOMContentLoaded", function () {
                                                    // Danh sách để lưu trữ các ID của task đã được chọn
                                                    var selectedTasks = [];

                                                    // Lấy thẻ div cha chứa các button
                                                    var actionButtonsDiv = document.getElementById('actionButtons');

                                                    // Lấy tất cả các checkbox
                                                    var checkboxes = document.querySelectorAll('input[type="checkbox"]');

                                                    // Thêm sự kiện "click" cho mỗi checkbox
                                                    checkboxes.forEach(function (checkbox) {
                                                        checkbox.addEventListener('click', function () {
                                                            // Kiểm tra xem checkbox có được chọn hay không
                                                            if (this.checked) {
                                                                // Nếu được chọn, thêm ID của task vào danh sách
                                                                selectedTasks.push(this.id);
                                                            } else {
                                                                // Nếu không được chọn, loại bỏ ID của task khỏi danh sách
                                                                var index = selectedTasks.indexOf(this.id);
                                                                if (index !== -1) {
                                                                    selectedTasks.splice(index, 1);
                                                                }
                                                            }

                                                            // Hiển thị các button nếu có ít nhất một task được chọn
                                                            displayActionTasks();
                                                        });
                                                    });

                                                    // Hàm để hiển thị số lượng task đã được chọn và các button tương ứng
                                                    function displayActionTasks() {
                                                        var taskCountContainer = document.getElementById('taskCount');
                                                        var uncheckAllButton = document.getElementById('uncheckAllButton');
                                                        var sendButton = document.getElementById('sendButton');

                                                        // Hiển thị số lượng task đã được chọn
                                                        taskCountContainer.textContent = 'Số lượng issue đã chọn: ' + selectedTasks.length;

                                                        // Kiểm tra nếu có ít nhất 1 task được chọn thì hiển thị nút gửi và nút bỏ tích tất cả, ngược lại ẩn nút gửi và nút bỏ tích tất cả
                                                        if (selectedTasks.length > 0) {
                                                            actionButtonsDiv.style.display = 'block';
                                                        } else {
                                                            actionButtonsDiv.style.display = 'none';
                                                        }
                                                    }

                                                    // Hàm để bỏ tích tất cả các task đã chọn
                                                    function uncheckAllTasks() {
                                                        // Lấy danh sách tất cả các ô checkbox trong bảng
                                                        var checkboxes = document.querySelectorAll('#dataTable input[type="checkbox"]');

                                                        // Duyệt qua từng checkbox và bỏ tích
                                                        checkboxes.forEach(function (checkbox) {
                                                            checkbox.checked = false;
                                                        });

                                                        // Xóa danh sách các task đã chọn và cập nhật hiển thị
                                                        selectedTasks = [];
                                                        displayActionTasks();
                                                    }

                                                    // Lấy thẻ button bằng id
                                                    var uncheckAllButton = document.getElementById('uncheckAllButton');

                                                    // Thêm sự kiện "click" cho button
                                                    uncheckAllButton.addEventListener('click', uncheckAllTasks);

                                                    // Hàm để gửi danh sách ID đã chọn đến servlet





                                                });
        </script>
        <script>
            function getSelectedCheckboxValues() {
                // Khởi tạo mảng để lưu trữ các giá trị đã chọn
                var selectedValues = "";

                // Lấy tất cả các checkbox
                var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');

                // Duyệt qua từng checkbox đã chọn và lưu giá trị vào mảng
                checkboxes.forEach(function (checkbox) {
                    selectedValues = selectedValues + "," + checkbox.value;
                });

                // Trả về chuỗi được cách nhau bằng dấu phẩy
                return selectedValues;
            }



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


            function sendSelectedTasks() {
                // Lấy chuỗi giá trị đã chọn
                var selectedValues = getSelectedCheckboxValues();

                // Đường dẫn tới servlet
                var servletURL = 'select_AssignTask';

                // Tạo URL với tham số selectedTasks
                var urlWithParams = servletURL + '?selectedTasks=' + encodeURIComponent(selectedValues);

                // Mở liên kết mới
                window.open(urlWithParams, '_blank');
            }


            function openNewPage() {
                // Đường dẫn tới trang mới
                var newPageURL = 'login.jsp'; // Thay đổi thành URL của trang bạn muốn mở

                // Mở trang mới
                window.location.href = newPageURL;
            }

        </script>
    </body>

</html>