<%-- 
    Document   : Topbar_Search
    Created on : Mar 27, 2024, 2:23:01 PM
    Author     : quann
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <form action="searchclass"
          class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
        <div class="input-group">
            <input type="text" required="" class="form-control bg-light border-0 small"
                   name="class" aria-label="Search" aria-describedby="basic-addon2"
                   placeholder="Tìm kiếm tên lớp...">
            <div class="input-group-append">
                <button class="btn btn-primary" type="submit">
                    <i class="fas fa-search fa-sm"></i>
                </button>
            </div>
        </div>
    </form>
</html>
