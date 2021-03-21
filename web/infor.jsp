<%-- 
    Document   : infor
    Created on : Nov 11, 2019, 11:37:18 AM
    Author     : DATPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông Tin Cá Nhân</title>
        <title> </title>
        <meta charset="utf-8">
        <link rel="shortcut icon" type="image/png" href="Img/fav.png"/>
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
           <jsp:include page="navbar.jsp"/>
        </div>
        <div class="container" style="padding: 13% 15%">
            <c:forEach var="k" items="${infor}">
                <table class="table table-borderless">
                    <tbody>
                        <tr style="padding: 20px; margin: 20px">
                            <td><img class="rounded-circle" src="Img/cloudy.jpg" alt="Circle image" style="width: 200px; height: 200px"></td>
                        <td>
                            <h3 style="vertical-align: central">
                                ${k.hoTen}
                            </h3>
                            <p>${k.taiKhoan}</p>
                            
                        </td>
                    </tr>
                    <tr>
                        <th>Mã Khách Hàng:</th>
                        <td>${k.maKhachHang}</td>
                    </tr>
                    <tr>
                        <th>Giới Tính:</th>
                        <td>${k.gioiTinh}</td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td>${k.email}</td>
                    </tr>
                    <tr>
                        <th>Địa Chỉ</th>
                        <td>${k.diaChi}</td>
                    </tr>
                    <tr>
                        <th>Số Điện Thoại</th>
                        <td>${k.sDT}</td>
                    </tr>
                    <tr>
                        <th>Ngày Đăng Kí</th>
                        <td>${k.ngayDK}</td>
                    </tr>
                    </tbody>
                </table>
            </c:forEach>
        </div>
                            
       <jsp:include page="footer.jsp"/>
    </body>
</html>






