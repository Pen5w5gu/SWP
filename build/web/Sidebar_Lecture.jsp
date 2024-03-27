<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
            id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center"
               href="lectureview">
                <div class="sidebar-brand-icon">
                    <i class="fa-solid fa-chalkboard-user"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Project Management</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="lectureview">
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
                    <span>Class</span>
                </a>

                <div id="collapsePages" class="collapse" aria-labelledby="headingPages"
                     data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">List class:</h6>
                        <div class="collapse-divider"></div>
                        <c:choose>
                            <c:when test="${not empty classes}">
                                <c:forEach var="myclass" items="${classes}">
                                    <form id="form_${myclass.class_name}" action="showproject"
                                          method="POST"
                                          onsubmit="return submitForm(${myclass.class_name})">
                                        <a href="#" class="collapse-item"
                                           onclick="document.getElementById('form_${myclass.class_name}').submit();">Class
                                            ${myclass.class_name}</a>
                                        <input type="hidden" name="class_name"
                                               value="${myclass.class_name}">
                                    </form>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <p>No classes available</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">

                <a class="nav-link" href="ImportFile.jsp">
                    <i class="fa-solid fa-file-import"></i>
                    <span>Import file excel</span></a>
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
