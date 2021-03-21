<%-- 
    Document   : dathang
    Created on : Nov 12, 2019, 2:23:04 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Đặt Hàng </title>
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
                <h3 class="display-3">Xác Nhận Chi Tiết Đơn Hàng</h3>
            </div>

            <form action="dathang2">
                <c:forEach var="s" items="${sachs}">
                    <table class="table table-borderless">
                        <tbody>
                            <tr>
                                <th>Ảnh Sách:</th>
                                <td>${s.anhSach}</td>
                            </tr>
                            <tr>
                                <th>Tên Sách:</th>
                                <td>${s.tenSach}</td>
                            </tr>
                            <tr>
                                <th>Gía Bìa:</th>
                                <td>${s.giaBia}</td>
                            </tr>
                            </body>
                    </table>
                </c:forEach>
                <c:forEach var="kh" items="${khachhangs}">
                    <table class="table table-borderless">
                        <tbody>
                            <tr>
                                <th>Họ Tên:</th>
                                <td>${kh.hoTen}</td>
                            </tr>
                            <tr>
                                <th>Giới tính:</th>
                                <td>${kh.gioiTinh}</td>
                            </tr>

                            <tr>
                                <th>Mã Khách Hàng:</th>
                                <td>${kh.maKhachHang}</td>
                            </tr>
                            <tr>
                                <th>Email:</th>
                                <td>${kh.email}</td>
                            </tr>
                            <tr>
                                <th>Địa Chỉ:</th>
                                <td>${kh.diaChi}</td>
                            </tr>
                            <tr>
                                <th>Số Điện Thoại:</th>
                                <td>${kh.sDT}</td>
                            </tr>
                            </body>
                    </table>
                </c:forEach>
                <c:forEach var="s" items="${sachs}">
                    <table class="table table-borderless">
                        <tbody>
                            <tr>
                                <th>Gía Bìa</th>
                                <td>${s.giaBia}đ</td>
                            </tr>
                            <tr>
                                <th>Mã Giảm Gía</th>
                                <td>0 đ</td>
                            </tr>
                            <tr>
                                <th>Phí Bọc Sách</th>
                                <td>0 đ</td>
                            </tr>
                            <tr>
                                <th>Phí Gói Qùa</th>
                                <td>0 đ</td>
                            </tr>
                            <tr>
                                <th>Tạm Tính</th>
                                <td>${s.giaBia}</td>
                            </tr>
                            <tr>
                                <th>Điểm Thưởng</th>
                                <td>0 đ</td>
                            </tr>
                            <tr>
                                <th>Tổng Cộng</th>
                                <td>${s.giaBia}</td>
                            </tr>
                            </body>
                    </table>
                </c:forEach>
                <a href="Sach"><input class="btn btn-rounded btn-danger" type="button" name="dathang1" value="Hủy"></a>
                <a href="dathang2?user=${sessionScope.login.username}"><input class="btn btn-rounded btn-primary" type="button" name="dathang1" value="Kết thúc giao dịch"></a>
            </form>

        </div>



        <jsp:include page="footer.jsp"/>



    </body>
</html>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>







