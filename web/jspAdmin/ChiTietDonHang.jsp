<%-- 
    Document   : ChiTietDonHang
    Created on : Oct 22, 2019, 8:33:26 AM
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
        <title>Thể Loại</title>
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




        <jsp:include page="navbar.jsp"/>

        <div class="container-fluid" style="padding: 10% 10%; padding-bottom: 0%">
            <table class="table">
                <tr>
                    <th><a href="./insert/InsertChiTietDonHang.jsp"> <button class="btn btn-primary">Thêm Chi Tiết Đơn</button></a></th>
                </tr>
            </table>
            <hr>

        </div>


        <div class="container-fluid" style="padding: 2% 10%;text-align: center;vertical-align: central;text-justify: auto">

            <table border="1" cellspacing="10px" class="table">
                <thead class="thead-dark">
                    <tr>
                        <th>Mã Sách</th>
                        <th>Mã Đơn Hàng</th>
                        <th>Số Lượng</th>
                        <th>Đơn Giá</th>
                        <th></th>

                    </tr>
                </thead>
                <c:forEach var="c" items="${chiTietDonHang}">
                    <tr>
                        <td>${c.maSach}</td>
                        <td>${c.maDonHang}</td>
                        <td>${c.soLuong}</td>
                        <td>${c.donGia}</td>

                        <td>
                            <a href="updateChiTietDonHang?maSach=${c.maSach}"><input type="submit" class="btn btn-info" value="Sửa"/></a> 
                            <a href="DeleteChiTietDonHang?maSach=${t.maSach}"><input type="submit" class="btn btn-danger" value="Xóa"/></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>


        <jsp:include page="footer.jsp"/>

    </body>



</html>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

