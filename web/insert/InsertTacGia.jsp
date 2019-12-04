<%-- 
    Document   : InsertTacGia
    Created on : Oct 23, 2019, 3:01:01 PM
    Author     : Auriat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Thêm Tác Giả</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" type="text/css" href="index.css">
        <script>
            document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>')
        </script>
        <link rel="stylesheet" type="text/css" href="index.css">
    </head>
    <body>

        <nav class="navbar navbar-expand-sm navbar-light fixed-top container-fluid" style="padding-right: 16%;padding-left: 16%">
            <a class="navbar-brand" href="./">
                <img src="../Img/logo_last.png" width="100" height="60" alt="Natra" class="d-inline-block align-top"/>
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
                            <a class="nav-link" href="sachAdmin">Chào ${sessionScope.login.username}</a>
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
        <div class="container" style="padding-top: 10%">
            <form action="insertTacGia" method="POST">
                <table class="table  dark">
                    <tr>
                        <td>Mã Tác Giả</td>
                        <td><input type="text" name="maTacGia" value=""></td>
                    </tr>
                    <tr>
                        <td>Tên Tác Giả</td>
                        <td><input type="text" name="tenTacGia" value=""></td>
                    </tr>
                    <tr>
                        <td>Nghề Nghiệp</td>
                        <td><input type="text" name="ngheNghiep" value=""></td>
                    </tr>
                    <tr>
                        <td>Ghi Chú Tác Giả</td>
                        <td><input type="text" name="ghiChuTacGia" value=""></td>
                    </tr>
                    <tr>
                        <td>Ảnh Tác Giả</td>
                        <td><input type="text" name="anhTacGia" value=""></td>
                    </tr>

                    <tr>
                        <td>
                            <input class="btn btn-primary" type="submit" name="insert" value="Insert"></input>
                            <button class="btn btn-danger" type="reset" name="reset">Reset</button>
                        </td>

                    </tr>
            </form>
        </div>

    </body>
</html>



<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
