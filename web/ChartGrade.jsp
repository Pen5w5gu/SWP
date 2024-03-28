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
        <link href="css/custom.css" rel="stylesheet">

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
                        <p class="mb-4"> back to task</p>
                        <h1 class="h3 mb-2 text-gray-800">Project in (name_class)</h1>


                        <!-- Card -->
                        <div style="display: flex;">
                            <div class="card shadow mb-4 " style="margin-right: 5Rem;">
                                <div class="card-header d-sm-flex align-items-center justify-content-between mb-4">
                                    <h6 class="m-0  font-weight-bold text-primary">List Project</h6>
                                </div>
                                <div class="card-body">
                                    <form action="comment" method="POST">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%"
                                                   cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th >ID ${session.getRole_project()}</th>
                                                        <th>Task name</th>
                                                        <th>Milestone</th>
                                                        <th>Task description</th>
                                                        <th>Start_date</th>
                                                        <th>End_Date</th>
                                                        <th>Action</th>
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
                                                                <td> <i class="fa-solid fa-trash-can" onclick="Delete(${task.idTask})"></i></td>
                                                                <td>${taskIDs}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </ul>
                                            </table>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="col-xl-4 col-lg-5">
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">Donut Chart</h6>
                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body">
                                        <div class="chart-pie pt-4">
                                            <canvas id="myPieChart"></canvas>
                                        </div>
                                        <hr>
                                        Sửa ở 
                                        <code>/js/demo/chart-pie.js</code> nhá cu.
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="button-flex">
                            <button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm " style="padding: 5px 20px;" id="sendButton" onclick="SentData()"">Submit</button>
                        </div>

                        <script>

                            function SentData() {
                                var taskIDs = "${taskIDs}";
                                var checkedIDs = []; // Mảng chứa ID của các tài khoản đã được chọn

                                // Lặp qua tất cả các checkbox đã được chọn
                                var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
                                checkboxes.forEach(function (checkbox) {
                                    // Thêm giá trị của checkbox (ID của tài khoản) vào mảng checkedIDs
                                    checkedIDs.push(checkbox.value);
                                });
                                if (checkboxes.length === 0) {
                                    // Hiển thị thông báo nếu không có checkbox nào được chọn
                                    alert("Vui lòng chọn một sinh viên.");
                                    return; // Dừng hàm
                                }

                                // Tạo URL với tham số taskIDs và checkedIDs
                                var urlWithParams = 'assign_task?taskIDs=' + encodeURIComponent(taskIDs) + '&checkedIDs=' + encodeURIComponent(checkedIDs.join(','));

                                // Chuyển hướng đến URL mới
                                window.location.href = urlWithParams;



                            }








                        </script>
                        <!-- End Card -->
                        <script>
                            function Delete(idTask) {
                                var taskIDs = "${taskIDs}";

                                // Loại bỏ dấu phẩy ở đầu chuỗi (nếu có)
                                if (taskIDs.charAt(0) === ',') {
                                    taskIDs = taskIDs.substring(1);
                                }

                                // Chuyển đổi chuỗi thành mảng các chuỗi
                                var taskIDsArray = taskIDs.split(',');

                                // Tạo một mảng mới không chứa phần tử có giá trị là idTask
                                var newTaskIDsArray = [];
                                for (var i = 0; i < taskIDsArray.length; i++) {
                                    if (taskIDsArray[i] !== idTask.toString()) {
                                        newTaskIDsArray.push(taskIDsArray[i]);
                                    }
                                }

                                // Chuyển đổi mảng mới thành chuỗi
                                var newTaskIDs = newTaskIDsArray.join(',');

                                // Đường dẫn tới servlet
                                var servletURL = 'select_AssignTask';

                                // Tạo URL với tham số selectedTasks
                                var urlWithParams = servletURL + '?selectedTasks=' + encodeURIComponent(newTaskIDs);

                                // Mở liên kết mới
                                window.location.href = urlWithParams;
                            }

                        </script>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->
                <%@ include file="Footer.jsp" %>
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

        <!-- Page level plugins -->
        <script src="vendor/chart.js/Chart.min.js"></script>
        <!-- Page level custom scripts -->

        <script src="js/demo/datatables-demo.js"></script>
        <script src="js/demo/chart-pie.js"></script>

        <script>
                            $(document).ready(function () {
                                $('#dataTable1').DataTable();
                            });
        </script>

        <script>
            $(document).ready(function () {
                // Xử lý sự kiện khi checkbox được chọn hoặc bỏ chọn
                $('input[type="checkbox"]').change(function () {
                    var isChecked = $(this).is(":checked");

                    // Kiểm tra nếu checkbox hiện tại được chọn
                    if (isChecked) {
                        // Chuyển tất cả các checkbox khác trong bảng thành readonly
                        $(this).closest('table').find('input[type="checkbox"]').not($(this)).prop('disabled', true);
                    } else {
                        // Nếu checkbox hiện tại không được chọn
                        // Bỏ readonly cho tất cả các checkbox khác trong bảng
                        $(this).closest('table').find('input[type="checkbox"]').prop('disabled', false);
                    }

                    // Làm mờ các hàng khác trong bảng
                    $(this).closest('tr').siblings().toggleClass('disabled', isChecked);
                });
            });

        </script>
    </body>

</html>