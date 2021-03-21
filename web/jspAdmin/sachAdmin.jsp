<%-- 
    Document   : sachAdmin
    Created on : Oct 22, 2019, 8:14:15 AM
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
        <title>Quản Lý Trang </title>
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
                    <th><a href="./insert/InsertSach.jsp"> <button class="btn btn-primary">Thêm Sách</button></a></th>
                    <th><a href="tacgiaAdmin"><button class="btn btn-primary">Tác Giả</button></a></th>
                    <th><a href="theloai"><button class="btn btn-primary">Thể Loại</button></a></th>
                    <th><a href="chitietsach"><button class="btn btn-primary">Chi Tiết Sách</button></a></th>
                    <th><a href="ngonngu"> <button class="btn btn-primary">Ngôn Ngữ</button></a></th>
                    <th><a href="KhachHang"> <button class="btn btn-primary">Khách Hàng</button></a></th>
                    <th><a href="DonHang"> <button class="btn btn-primary">Đơn Hàng</button></a></th>
                    <th><a href="NXB"> <button class="btn btn-primary">Nhà XB</button></a></th>
                    <th><a href="ChiTietDonHang"> <button class="btn btn-primary">Chi Tiết Đơn Hàng</button></a></th>
                </tr>
            </table>
            <hr>
            
        </div>


        <div class="container-fluid" style="padding: 2% 10%;text-align: center;vertical-align: central;text-justify: auto">

            <table border="1" cellspacing="10px" class="table">
                <thead class="thead-dark">
                    <tr>
                        <th>Mã Sách</th>
                        <th>Ảnh Sách</th>
                        <th>Tên Sách</th>
                        <th>Mã Loại Sách</th>
                        <th>Mã NXB</th>
                        <th>Giá Nhập</th>
                        <th>Giá Bìa</th>
                        <th>Số Lượng</th>
                        <th>Ghi Chú</th>
                        <th></th>

                    </tr>
                </thead>
                <c:forEach var="t" items="${sachAdmin}">
                    <tr>
                        <td>${t.maSach}</td>
                        <td><img src="${t.anhSach}" width="200" height="300"/></td>
                        <td>${t.tenSach}</td>
                        <td>${t.maLoaiSach}</td>
                        <td>${t.maNxb}</td>
                        <td>${t.giaNhap}</td>
                        <td>${t.giaBia}</td>
                        <td>${t.soLuong}</td>
                        <td>${t.ghiChuSach}</td>

                        <td>
                            <a href="UpdateSach?maSach=${t.maSach}"><input type="submit" class="btn btn-info" value="Sửa"/></a> 
                            <a href="DeleteSach?maSach=${t.maSach}"><input type="submit" class="btn btn-danger" value="Xóa"/></a>
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


