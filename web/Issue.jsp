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
                                    <a href="issues" class="m-0 " style="padding-right: 15px"><i class="fa-regular fa-circle-dot"></i> 0 Open </a>
                                    <a href="closedissues" class="m-0 "><i class="fa-solid fa-check"></i> 0 Closed  </a>
                                </div>

                                <a href="Add_Issue.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" >
                                    <i class="fa-solid fa-plus"></i> New issue
                                </a>
                            </div>

                            <div style="display: block; padding:0px 20px; "  >
                                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                    <div style="display: flex; align-items: center;">
                                        <input type="checkbox" id="selectAllCheckbox" style="margin-right: 5px;" class="d-none d-sm-inline-block btn-check" />
                                        <p class="m-0 " id="taskCount" style="">Select all</p>
                                    </div>

                                    <div style="display: none; height: 20px" id="actionButtons">
                                        <div class="py-3 d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold text-primary">Mark as</h6>
                                            <div class="dropdown no-arrow"> 
                                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                     aria-labelledby="dropdownMenuLink">
                                                    <div class="dropdown-header">Dropdown Header:</div>
                                                    <a class="dropdown-item" onclick="OpenIssue()">Open</a>
                                                    <a class="dropdown-item" onclick="CloseIssue()">Closed</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>


                            <div class="card-body">


                                <form action="comment" method="POST">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%"
                                               cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th style="width: 50px">Select</th>
                                                    <th>ID</th>
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
                                                            <td>${issue.id_issue}</td>
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
                                                        // Lấy href từ URL hiện tại
                                                        var currentHref = window.location.href;

                                                        // Lấy danh sách các thẻ <a> trong <div> có inline style "align-content: center; display: flex"
                                                        var flexDiv = document.querySelector('div[style="align-content: center; display: flex"]');
                                                        var navLinks = flexDiv.querySelectorAll('a');

                                                        // Lặp qua từng thẻ <a> trong danh sách
                                                        navLinks.forEach(function (navLink) {
                                                            // Lấy href của từng thẻ <a>
                                                            var href = navLink.getAttribute('href');

                                                            // Kiểm tra xem href của thẻ <a> có kết thúc bằng href từ URL không
                                                            if (currentHref.endsWith(href)) {
                                                                // Thêm class "font-weight-bold" vào thẻ <a> chỉ khi href trùng khớp
                                                                navLink.classList.add('font-weight-bold');
                                                            }
                                                        });
        </script>


        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Danh sách để lưu trữ các ID của task đã được chọn
                var selectedTasks = [];

                // Lấy thẻ div cha chứa các button
                var actionButtonsDiv = document.getElementById('actionButtons');

                // Lấy tất cả các checkbox
                var checkboxes = document.querySelectorAll('div.card-body input[type="checkbox"]');

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

                        // Hiển thị số lượng task đã được chọn và các button tương ứng
                        displayActionTasks();
                    });
                });

                // Hàm để hiển thị số lượng task đã được chọn và các button tương ứng
                function displayActionTasks() {
                    var taskCountContainer = document.getElementById('taskCount');
                    var uncheckAllButton = document.getElementById('uncheckAllButton');
                    var sendButton = document.getElementById('sendButton');
                    var selectAllCheckbox = document.getElementById('selectAllCheckbox');

                    // Kiểm tra nếu có ít nhất 1 task được chọn thì hiển thị nút gửi và nút bỏ tích tất cả, ngược lại ẩn nút gửi và nút bỏ tích tất cả
                    if (selectedTasks.length > 0) {
                        taskCountContainer.textContent = selectedTasks.length + ' selected';
                        actionButtonsDiv.style.display = 'block';
                        selectAllCheckbox.checked = true; // Tự động tích checkbox
                    } else {
                        taskCountContainer.textContent = 'Select all';
                        actionButtonsDiv.style.display = 'none';
                        selectAllCheckbox.checked = false; // Bỏ tích checkbox nếu không có task nào được chọn
                    }
                }

                // Hàm để chọn tất cả các task
                function checkAllTasks() {
                    // Lấy danh sách tất cả các ô checkbox trong bảng
                    var checkboxes = document.querySelectorAll('div.card-body input[type="checkbox"]');

                    // Duyệt qua từng checkbox và tích
                    checkboxes.forEach(function (checkbox) {
                        checkbox.checked = true;
                    });

                    // Cập nhật danh sách các task đã chọn và hiển thị
                    selectedTasks = Array.from(checkboxes).map(function (checkbox) {
                        return checkbox.id;
                    });
                    displayActionTasks();
                }

                // Hàm để bỏ tích tất cả các task đã chọn
                function uncheckAllTasks() {
                    // Lấy danh sách tất cả các ô checkbox trong bảng
                    var checkboxes = document.querySelectorAll('div.card-body input[type="checkbox"]');

                    // Duyệt qua từng checkbox và bỏ tích
                    checkboxes.forEach(function (checkbox) {
                        checkbox.checked = false;
                    });

                    // Xóa danh sách các task đã chọn và cập nhật hiển thị
                    selectedTasks = [];
                    displayActionTasks();
                }

                // Lắng nghe sự kiện khi checkbox "selectAllCheckbox" thay đổi trạng thái
                var selectAllCheckbox = document.getElementById('selectAllCheckbox');
                selectAllCheckbox.addEventListener('change', function () {
                    if (this.checked) {
                        checkAllTasks(); // Nếu checkbox được chọn, chọn tất cả các checkbox khác
                    } else {
                        uncheckAllTasks(); // Nếu checkbox không được chọn, bỏ tích tất cả các checkbox khác
                    }
                });
            });

            function getSelectedCheckboxValues() {
                // Khởi tạo mảng để lưu trữ các giá trị đã chọn
                var selectedValues = [];

                // Lấy tất cả các checkbox đã được chọn
                var checkboxes = document.querySelectorAll('div.card-body input[type="checkbox"]:checked');

                // Duyệt qua từng checkbox đã chọn và lưu giá trị vào mảng
                checkboxes.forEach(function (checkbox) {
                    selectedValues.push(checkbox.value);
                });

                // Trả về mảng các giá trị đã chọn
                return selectedValues;
            }


            function OpenIssue() {
                // Lấy chuỗi giá trị đã chọn
                var selectedValues = getSelectedCheckboxValues();

                // Đường dẫn tới servlet
                var servletURL = 'changestatusissues';

                // Tạo URL với tham số selectedTasks
                var urlWithParams = servletURL + '?issueIDs=' + selectedValues + '&status=' + 1;

                // Mở liên kết mới
                window.open(urlWithParams);
            }

            function CloseIssue() {
                // Lấy chuỗi giá trị đã chọn
                var selectedValues = getSelectedCheckboxValues();

                // Đường dẫn tới servlet
                var servletURL = 'changestatusissues';

                // Tạo URL với tham số selectedTasks
                var urlWithParams = servletURL + '?issueIDs=' + selectedValues + '&status=' + 0;


                // Mở liên kết mới
                window.open(urlWithParams);
            }
            z


        </script>
    </body>

</html>