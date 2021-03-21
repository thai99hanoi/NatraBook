<%-- 
    Document   : xacnhandonhang
    Created on : Nov 12, 2019, 10:58:42 AM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Thông Tin Người Nhận </title>
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

       <jsp:include page="navbar.jsp"/>




        <div class="container" style="padding: 10% 10%">
            <div class="jumbotron">
                <h4 class="display-4">Xác Nhận Thông Tin Người Nhận</h4>
            </div>

            <form action="xacnhan">
                <div class="container" style="padding: 13% 15%">
                    <c:forEach var="k" items="${khachhang}">
                        <table class="table table-borderless">
                            <tbody>
                                <tr>
                                    <th>Họ Tên:</th>
                                    <td>${k.hoTen}</td>
                                </tr>
                                <tr>
                                    <th>Giới tính:</th>
                                    <td>${k.gioiTinh}</td>
                                </tr>

                                <tr>
                                    <th>Mã Khách Hàng:</th>
                                    <td>${k.maKhachHang}</td>
                                </tr>
                                <tr>
                                    <th>Email:</th>
                                    <td>${k.email}</td>
                                </tr>
                                <tr>
                                    <th>Địa Chỉ:</th>
                                    <td>${k.diaChi}</td>
                                </tr>
                                <tr>
                                    <th>Số Điện Thoại:</th>
                                    <td>${k.sDT}</td>
                                </tr>
                                </body>
                        </table>
                    </c:forEach>
                    <a href="updatekhmua?user=${sessionScope.login.username}"><input class="btn btn-danger" type="button" name="chínhsua" value="Chỉnh Sửa"></a>
                    <a href="dathang?user=${sessionScope.login.username}"><input class="btn btn-primary" type="button" name="dathang" value="Đặt Hàng"></a>
                </div>
            </form>
        </div>

        <jsp:include page="footer.jsp"/>

    </body>
</html>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>




