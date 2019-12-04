<%-- 
    Document   : registration
    Created on : Oct 28, 2019, 2:05:51 PM
    Author     : D
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <title>Đăng Kí</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" type="image/png" href="../Img/fav.png"/>
    <link rel="stylesheet" type="text/css" href="index.css">
    <script>
        document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>')
    </script>
    <link rel="stylesheet" type="text/css" href="index.css">
    <style>

        .main-head{
            height: 150px;
            background: #FFF;

        }

        .sidenav {
            height: 100%;
            background-color: #000;
            overflow-x: hidden;
            padding-top: 20px;
        }


        .main {
            padding: 0px 10px;
        }

        @media screen and (max-height: 450px) {
            .sidenav {padding-top: 15px;}
        }

        @media screen and (max-width: 450px) {
            .login-form{
                margin-top: 10%;
            }

            .register-form{
                margin-top: 10%;
            }
        }

        @media screen and (min-width: 768px){
            .main{
                margin-left: 40%; 
            }

            .sidenav{
                width: 40%;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
            }

            .login-form{
                margin-top: 40%;
            }

            .register-form{
                margin-top: 20%;
            }
        }


        .login-main-text{
            margin-top: 20%;
            padding: 60px;
            color: #fff;
        }

        .login-main-text h2{
            font-weight: 300;
        }

        .btn-black{
            background-color: #000 !important;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container-fluid fixed-top" style="padding: 0% 10%; background-color: white">
        <nav class="navbar navbar-expand-sm navbar-light" style="padding-right: 20px;padding-left: 20px">
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
                        <a class="nav-link" href="../Sach">Trang Chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#Contact">Liên hệ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../login">Đăng Nhập</a>
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
    <div class="sidenav">
        <div class="login-main-text">
            <h2>NatraQuice<br>Book</h2>
            <p>Đăng Nhập Hoặc Đăng Kí Để Sử Dụng</p>
        </div>
    </div>
    <div class="main">
        <div class="col-md-6 col-sm-12">
            <div class="login-form">
                <form action="../registration" method="get">
                    <div class="form-group">

                        <label>Tài Khoản</label>
                        <input type="text" name="taikhoan" class="form-control" placeholder="Tài Khoản">
                    </div>
                    <div class="form-group">

                        <label>Mật Khẩu</label>
                        <input type="password" name="mk" class="form-control" placeholder="Mật Khẩu">
                    </div>
                    <div class="form-group">

                        <label>Họ Tên</label>
                        <input type="text" name="hoten" class="form-control" placeholder="Họ Tên">
                    </div>
                    <div class="form-group">

                        <label>Giới Tính</label>
                        <p>
                            <input type="radio" name="gender" value="Nam"/>Nam
                            <input type="radio" name="gender" value="Nữ" />Nữ
                        </p>

                    </div>
                    <div class="form-group">

                        <label> Email</label>
                        <input type="text" name="email" class="form-control" placeholder="Email">
                    </div>
                    <div class="form-group">

                        <label>Địa Chỉ</label>
                        <input type="text" name="diachi" class="form-control" placeholder="Địa Chỉ">
                    </div>
                    <div class="form-group">
                        <label>Số Điện Thoại</label>
                        <input type="text" name="sdt" class="form-control" placeholder="Điện Thoại">
                    </div>
                    <button type="submit" value="Submit" name="insert" class="btn btn-black">Đăng Kí</button>
                </form>
            </div>
        </div>
    </div>
</body>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</html>




