<%-- 
    Document   : detailSach
    Created on : Oct 19, 2019, 1:12:07 PM
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


    <c:forEach var="ts" items="${detailSach}">

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta name="apple-mobile-web-app-capable" content="yes">
            <meta content="text/html; charset=utf-8" http-equiv="content-type">
            <link rel="shortcut icon" type="image/png" href="Img/fav.png"/>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <link rel="stylesheet" href="index.css">
            <title>${ts.tenSach}</title>
        </head>



        <body style="overflow-x: hidden; font-family: Poppins">
            <div class="container-fluid fixed-top" style="padding: 0% 10%; background-color: white">
                <nav class="navbar navbar-expand-sm navbar-light" style="padding-right: 20px;padding-left: 20px">
                    <a class="navbar-brand" href="#">
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
                                <a class="nav-link" href="#">Liên hệ</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Giỏ Hàng</a>
                            </li>
                            <c:if test="${not empty sessionScope.login}">
                                <li class="nav-item">
                                    <a class="nav-link" href="KhachHang">Welcome ${sessionScope.login.username}</a>
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
                                <button class="btn" type="submit" value="search" name="submit">Tìm</button>
                            </form>
                        </ul>
                    </div>
                </nav>
            </div>

            <div class="container-fluid" style="padding-top: 8%" >
                <div class="container">

                    <div class="row mt-4">
                        <div class="col-md-4">
                            <img src="${ts.anhSach}" width="100%" height="550"/>

                        </div>
                        <div class="col-md-4">
                            <h1 style="font-size: 70px;font-family: Lobster; color: red">
                                <b>
                                    ${ts.tenSach}
                                </b>

                            </h1>
                            <h3 style="font-family: initial">
                                Tác giả:
                                <a href="TacGia?tenTacGia=${ts.tenTacGia}">
                                    ${ts.tenTacGia}
                                </a>

                            </h3>
                            <h3 style="font-family: initial">
                                Nhà xuất bản: 
                                ${ts.tenNXB}
                            </h3>
                            <hr>
                            <h2 style="text-decoration: underline;color: Red;padding: 5px">
                                Thông Tin Chi Tiết: 
                            </h2>
                            <h5 style="font-family: sans-serif">
                                Tổng Số Trang:
                                ${ts.tongSoTrang}
                            </h5>
                            <h5 style="font-family: sans-serif">
                                Mã Sách:
                                ${ts.maSach}

                            </h5>
                            <h5 style="font-family: sans-serif">
                                Nhà Xuất Bản:
                                ${ts.tenNXB}

                            </h5>
                            <h5 style="font-family: sans-serif">
                                Trọng Lượng:
                                ${ts.trongLuong}
                                gram

                            </h5>
                            <h5 style="font-family: sans-serif">
                                Mã Sản Phẩm:
                                ${ts.maChiTiet}


                            </h5>
                            <h5 style="font-family: sans-serif">
                                Tác Giả:
                                ${ts.tenTacGia}


                            </h5>
                            <h5 style="font-family: sans-serif">
                                Ngôn Ngữ:
                                ${ts.ngonNgu}

                            </h5>
                        </div>
                        <div class="col-md-4" style="padding: 5px; font-family: monospace ">
                            <h5 style="text-align: right">
                                Chi Tiết Đơn Hàng:

                            </h5>
                            <hr>
                            <h6 style="text-align: right">
                                Giá Bán: 
                                ${ts.giaBia}
                            </h6>
                            <div class="pt-4 d-flex justify-content-end">
                                <a  href="muasach?tenSach=${ts.tenSach}"><input class="btn btn-info btn-lg" type="submit" value="Mua ngay"  name="buy"></a>
                            </div>



                        </div>
                    </div>
                    <hr>
                    <div class="row">


                        <div class="row mt-4">
                            <hr>
                            <div>
                                <h1 style="color: Red; font-size: 50px;text-decoration: underline;padding: 20px">
                                    Thông Tin Sách:
                                </h1>
                                <span style="font-size: 20px;padding: 20px">
                                    ${ts.ghiChu}
                                </span>
                            </div>
                            <hr>

                        </div>

                        <div class="row mt-4" style="float: left;;padding-bottom: 100px" >
                            <hr>
                            <div style="margin: 20px">
                                <h3 style="color: Red; font-size: 50px;text-decoration: underline;padding: 20px">
                                    Chi Tiết Sản Phẩm:
                                </h3>
                                <div class="col-md-6">


                                    <div class="row" style="font-family: monospace">

                                        Giá Bìa:
                                        ${ts.giaBia}
                                    </div>
                                    <div class="row" style="font-family: monospace">

                                        Tổng Số Trang:
                                        ${ts.tongSoTrang}
                                    </div>
                                    <div class="row" style="font-family: monospace">

                                        Trọng Lượng:
                                        ${ts.trongLuong}
                                        gram
                                    </div>
                                    <div class="row" style="font-family: monospace">

                                        Năm Xuất Bản:
                                        ${ts.namXB}
                                    </div>
                                </div>
                                <div class="col-md-6">


                                    <div class="row" style="font-family: monospace">
                                        Mã Sản Phẩm:
                                        ${ts.maChiTiet}
                                    </div>
                                    <div class="row" style="font-family: monospace">

                                        Nhà Xuất Bản:
                                        ${ts.tenNXB}
                                    </div>
                                    <div class="row" style="font-family: monospace">

                                        Ngôn Ngữ:
                                        ${ts.ngonNgu}
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:forEach>
                </div>


            </div>
        </div>
    </div>
    <div class="row">
        <hr>


        <div class="container-fluid" style="padding: 6% 10%;padding-bottom: 0px">


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
    </div>


</body>
</html>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

