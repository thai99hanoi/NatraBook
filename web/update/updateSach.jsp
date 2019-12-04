<%-- 
    Document   : updateSach
    Created on : Oct 22, 2019, 2:13:16 PM
    Author     : DATPT
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cập Nhật Sách</title>
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

        <div class="container-fluid fixed-top" style="padding: 0% 10%; background-color: white">
            <nav class="navbar navbar-expand-sm navbar-light" style="padding-right: 20px;padding-left: 20px">
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
                        <li class="nav-item">
                            <a class="nav-link" href="#">Giỏ Hàng</a>
                        </li>

                        <c:if test="${not empty sessionScope.login}">
                            <li class="nav-item">
                                <a class="nav-link" href="sachAdmin">Welcome ${sessionScope.login.username}</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="logout">Logout</a>
                            </li>

                        </c:if>
                        <li class="nav-item">
                            <c:if test="${empty sessionScope.login}">
                                <a class="nav-link" href="login">Login</a>
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
        </div>

        <div class="container" style="padding: 10% 10%">
            <form action="UpdateSach">
                <c:forEach var="u" items="${update}">
                    <table class="table">
                        <tr>
                            <th>
                                Mã Sách
                            </th>
                            <td>
                                <input type="text" name="maSach" value="${u.maSach}"/>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Tên Sách
                            </th>
                            <td>
                                <input type="text" name="tenSach" value="${u.tenSach}" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Mã Loại Sách
                            </th>
                            <td>
                                <input type="text" name="maLoaiSach" value="${u.maLoaiSach}" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Mã NXB
                            </th>
                            <td>
                                <input type="text" name="maNXB" value="${u.maNxb}" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Giá Nhập
                            </th>
                            <td>
                                <input type="text" name="giaNhap" value="${u.giaNhap}" />
                                VNĐ
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Giá Bìa
                            </th>
                            <td>
                                <input type="text" name="giaBia" value="${u.giaBia}" />
                                VNĐ
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Số Lượng
                            </th>
                            <td>
                                <input type="text" name="soLuong" value="${u.soLuong}" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Ghi Chú
                            </th>
                            <td>
                                <input type="text" name="ghiChuSach" value="${u.ghiChuSach}" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Ảnh Sách
                            </th>
                            <td>
                                <input type="text" name="anhSach" value="${u.anhSach}" />
                            </td>
                        </tr>
                        <tr>
                            <td>

                            </td>
                            <td>
                                <input type="submit" value="Cập Nhập" name="update" class="btn-primary" />
                            </td>
                        </tr>
                    </table>
                </c:forEach>
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


