<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
        id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center"
           href="Homepagestudent.jsp">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fa-solid fa-graduation-cap"></i>
            </div>
            <div class="sidebar-brand-text mx-3">Project Management</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
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
                                    <form id="form_${project.project_name}" action="showprojectstudent" method="POST" onsubmit="return submitForm('${project.project_name}')">
                                        <div class="project-item">
                                            <input type="hidden" name  ="ID_project" value="${project.id_Project}" />
                                            <a href="#" class="collapse-item" onclick="document.getElementById('form_${project.project_name}').submit();">Project ${project.project_name}</a>
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

        <li class="nav-item">
            <a class="nav-link " href="task">
                <i class="fa-solid fa-list-check"></i>
                <span>Task</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="milestone">
                <i class="fa-solid fa-chart-bar"></i>
                <span>Milestone</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="issues">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Issues</span></a>
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
    <script>
        // Lấy href từ URL hiện tại
        var currentHref = window.location.href;

// Lấy danh sách các thẻ <a> trong các thẻ <li> có class "nav-item"
        var navLinks = document.querySelectorAll('.nav-item .nav-link');

// Lặp qua từng thẻ <a> trong danh sách
        navLinks.forEach(function (navLink) {
            // Lấy href của từng thẻ <a>
            var href = navLink.getAttribute('href');

            // Kiểm tra xem href của thẻ <a> có bằng với href từ URL không
            if (currentHref.endsWith(href)) {
                // Nếu có, thêm class "active" vào thẻ <li> chứa thẻ <a> đó
                navLink.parentNode.classList.add('active');
            }
        });

    </script>

</html>
