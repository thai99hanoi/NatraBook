<%-- 
    Document   : tacgiaAll
    Created on : Oct 28, 2019, 1:55:11 PM
    Author     : thai9
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> </title>
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
        <div class="container-fluid fixed-top" style="padding: 0% 10%; background-color: white">
            <nav class="navbar navbar-expand-sm navbar-light" style="padding-right: 20px;padding-left: 20px">
                <a class="navbar-brand" href="./">
                    <h1>
                        NatraQuiCe Book	
                    </h1>

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
                                <a class="nav-link" href="KhachHang">Welcome ${sessionScope.login.username}</a>
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
                            <button type="submit" value="search" name="submit">Tìm</button>
                        </form>
                    </ul>
                </div>
            </nav>
        </div>

        <div class="container-fluid" style="padding: 6% 10%">
            <div id="carouselFadeExampleIndicators" class="carousel slide carousel-fade" data-ride="carousel">
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item active">
                        <img style="width: 100%;height: 250px" class="d-block w-100" src="Img/demobanner.jpg" data-src="holder.js/900x400?theme=social" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img style="width: 100%;height: 250px" class="d-block w-100" src="Img/demobanner1.jpg" data-src="holder.js/900x400?theme=industrial" alt="Second slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselFadeExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselFadeExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>


        <hr>

        <div class="container-fluid" style="padding: 5% 10%">
            <div class="row">

                <div class="col-lg-2" style="background-color: white">
                    <h1>
                        Danh Sách Sản Phẩm
                    </h1>
                    <hr>
                    <a href="">
                        <h4>
                            Tất Cả
                        </h4>	
                    </a>
                    <a href="">
                        <h4>
                            Thể Loại
                        </h4>	
                    </a>
                    <a href="AllTacGiaController">
                        <h4>
                            Tác Giả
                        </h4>	
                    </a>

                </div>
                <div class="col-lg-10 pl-5" >
                    <div class="row">


                        <c:forEach var="tg" items="${tacGiaAll}">
                            <div class="col-lg-4 mt-4">
                                <div class="card" style="height: 600px">
                                    <img class="card-img-top" src="${tg.anhTacGia}" alt="Card image cap" style="height: 330px; width: 95%" >
                                    <div class="card-body">
                                        <h4 class="card-title">${tg.tenTacGia}</h4>
                                        <p class="card-text">
                                            ${tg.tomTat}
                                        </p>
                                        <a href="TacGia?tenTacGia=${tg.tenTacGia}" class="btn btn-primary" style="vertical-align: bottom">Xem Ngay</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
<!--            <nav aria-label="..." style="float: right">
                <ul class="pagination">
                    <li class="page-item disabled">
                        <a class="page-link" href="#!" tabindex="-1">Previous</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#!">1</a></li>
                    <li class="page-item active">
                        <a class="page-link" href="#!">2 <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#!">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#!">Next</a>
                    </li>
                </ul>
            </nav>-->
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
                                    <a href="https://www.facebook.com/tairua.69">Tài Hữu</a>
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


