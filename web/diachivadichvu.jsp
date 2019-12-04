<%-- 
    Document   : diachivadichvu
    Created on : Nov 11, 2019, 10:36:48 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>NatraQuiCe Book </title>
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
        
        
        <c:if test="${empty sessionScope.login}">
            <c:redirect url="login"></c:redirect>
        </c:if>

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
                            <a class="nav-link" href="infor?user=${sessionScope.login.username}">Chào ${sessionScope.login.username}</a>
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




        <div class="container" style="padding: 10% 10%">
            <div class="jumbotron">
                <h1 class="display-3">Chỉnh Sửa Thông Tin Đặt Hàng</h1>
            </div>
            <form action="updatekhmua">
                <table class="table">
                    <c:forEach var="u" items="${update}">
                        <tr>
                            <th>Mã Khách Hàng</th>
                            <td><input type="text" name="maKhachHang" value="${u.maKhachHang}" /></td>
                        </tr>
                        <tr>
                            <th>Họ Tên</th>
                            <td><input type="text" name="hoTen" value="${u.hoTen}" /></td>
                        </tr>
                        <tr>
                            <th>Giới Tính</th>
                            <td><input type="text" name="gioiTinh" value="${u.gioiTinh}" /></td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td><input type="text" name="email" value="${u.email}" /></td>
                        </tr>
                        <tr>
                            <th>Địa Chỉ</th>
                            <td><input type="text" name="diaChi" value="${u.diaChi}" /></td>
                        </tr>
                        <tr>
                            <th>Số Điện Thoại</th>
                            <td><input type="text" name="sDT" value="${u.sDT}" /></td>
                        </tr>
                    </c:forEach>

                </table>
                <input class="btn btn-primary" type="submit" name="save" value="Lưu">
            </form>
        </div>
                        
        <div id="Contact" class="container-fluid" style="padding: 6% 10%;padding-bottom: 0px">


            <footer class="page-footer font-small blue pt-4">
                <div class="container-fluid text-center text-md-left">
                    <div class="row">
                        <div class="col-md-6 mt-md-0 mt-3">
                            <h5 class="text-uppercase">NaTraQuiCe BookStore</h5>
                            <p> DID YOU KNOW:</P>
                            <P>
                                NaTraQuiCe stand for Navi- Astralis- Liquid- ENCE
                            </p>
                        </div>
                        <hr class="clearfix w-100 d-md-none pb-3">

                        <!-- Grid column -->
                        <div class="col-md-3 mb-md-0 mb-3">

                            <!-- Links -->
                            <h5 class="text-uppercase">Special Thank To</h5>

                            <ul class="list-unstyled">
                                <li>
                                    <a href="https://www.facebook.com/Tildnight415"> Đạt Phùng</a>
                                </li>
                                <li>
                                    <a href="https://www.facebook.com/nguyenduong.phong.92">Phong Nguyễn</a>
                                </li>
                                <li>
                                    <a href="https://www.facebook.com/tairua.69">Tài Nguyễn</a>
                                </li>
                                <li>
                                    <a href="https://www.facebook.com/duong.nguyenthai.35728">Dương Nguyễn</a>
                                </li>
                                <li>
                                    <a href="https://www.facebook.com/thai.trinhnam">Thái Trịnh</a>
                                </li>

                            </ul>

                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-3 mb-md-0 mb-3">

                            <!-- Links -->
                            <h5 class="text-uppercase">NaTraQuiCe Team</h5>

                            <ul class="list-unstyled">
                                <li>
                                    <a href="#!">Til_Dn1ght</a>
                                </li>
                                <li>
                                    <a href="#!">Pyzz1sk_Boy</a>
                                </li>
                                <li>
                                    <a href="#!">Auriatzz</a>
                                </li>
                                <li>
                                    <a href="#!">lagger_CongtuVanDon_9xCute</a>
                                </li>
                                <li>
                                    <a href="#!">Thasi_MVP</a>
                                </li>
                            </ul>

                        </div>

                    </div>


                </div>
                <div class="footer-copyright text-center py-3">© 2019 Copyright:
                    <a href="https://www.facebook.com/thai.trinhnam"> NaTraQuiCe Book Store</a>
                </div>
            </footer>
        </div>

    </body>
</html>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


