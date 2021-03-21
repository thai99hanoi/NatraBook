<%-- 
    Document   : tacGia
    Created on : Oct 21, 2019, 8:52:53 AM
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
    <c:forEach var="tg" items="${tacGia}">
    <head>
        <title>Tác Giả ${tg.tenTacGia} </title>
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
           <jsp:include page="navbar.jsp"/>
        </div>
        <div class="container" style="padding-top: 10%" >
            


                <div class="row" style="background-color: white; padding-top: 20px">
                    <div class="col-md-5">
                        <img src="${tg.anhTacGia}" width="350" height="450"/>

                    </div>
                    <div class="col-md-6">
                        <h1 style="color: red">
                            ${tg.tenTacGia}
                        </h1>
                        <p>
                            ${tg.ghiChuTG}
                        </p>
                        <p>
                            Nghề Nghiệp:
                            <b>
                                ${tg.ngheNghiep}
                            </b>

                        </p>
                    </div>
                </div>

            </c:forEach>



            <hr>


            <div class="container" >
                <h1>
                    <u style="color: red">Tác Phẩm</u>
                </h1>
                <div class="row">



                    <c:forEach var="tp" items="${tacPham}">
                        <div class="col-lg-4 mt-4">
                            <div style="padding: 50px; border: 1px solid black; height: 580px">
                                <span>
                                    <p>
                                        <a href="detail?tenSach=${tp.tenSach}">
                                            <img style="border: 2px solid black" src="${tp.anhSach}" width="100%" height="320"/>
                                        </a>
                                    </p>
                                    <p>
                                        <a href="detail?tenSach=${tp.tenSach}" style="border: 1px;text-decoration: none;color: red">
                                            <h4 style="color: red; text-align: center">
                                                ${tp.tenSach}
                                            </h4>
                                        </a>
                                    </p>
                                    <p style="text-align: center">
                                        <b>
                                            ${tp.tenTacGia}
                                        </b>
                                    </p>
                                    <p style="text-align: center;vertical-align: bottom">

                                        ${tp.giaBia}
                                    </p>
                                </span>

                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>





            <jsp:include page="footer.jsp"/>
    </body>
</html>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



