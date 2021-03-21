<%-- 
    Document   : navbar
    Created on : Mar 21, 2021, 9:24:19 PM
    Author     : DATPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nav Bar</title>
         <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" type="image/png" href="Img/fav.png"/>
        <link rel="stylesheet" type="text/css" href="index.css">
        <script>
            document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>')
        </script>
        <link rel="stylesheet" type="text/css" href="index.css">
    </head>
    <body>
         <nav class="navbar navbar-expand-sm navbar-light fixed-top container-fluid" style="padding-right: 16%;padding-left: 16%">
                <a class="navbar-brand" href="./">
                    <img src="Img/logo_last.png" width="100" height="60" alt="Natra" class="d-inline-block align-top"/>
                    <h6 style="padding-bottom: 0px">
                        NatraQuiCe Book
                    </h6>
                </a>


                <!-- Right -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Navbar links -->
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="Sach">Trang Chủ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#Contact">Liên hệ</a>
                        </li>
                        <c:if test="${not empty sessionScope.login}">
                            <li class="nav-item">
                                <a class="nav-link" href="infor?user=${sessionScope.login.username}">Chào <strong>${sessionScope.login.displayName}</strong> </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="logout">Đăng Xuất</a>
                            </li>

                        </c:if>
                        <li class="nav-item">
                            <c:if test="${empty sessionScope.login}">
                                <a class="nav-link" href="login">Đăng Nhập</a>
                            </c:if>
                        </li>
                    </ul>
                    <ul class="navbar-nav ml-auto">
                        <form class="mr-auto form-inline" action="Sach">
                            <input class="form-control mr-sm-2" type="text" placeholder="Tìm Kiếm"  name="search" value="${param.search}" >
                            <button class="btn blue-gradient btn-rounded" type="submit" value="search" name="submit">Tìm</button>
                        </form>
                    </ul>
                </div>
            </nav>
    </body>
</html>
