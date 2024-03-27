<%-- 
    Document   : Notification
    Created on : Mar 27, 2024, 1:43:02 PM
    Author     : quann
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
</html>
