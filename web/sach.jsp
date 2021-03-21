<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : sach
    Created on : Oct 19, 2019, 11:44:59 AM
    Author     : Thasi_MVP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>NatraQuiCe Book </title>
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

        <jsp:include page="navbar.jsp"/>
        <!--        <div class="container-fluid fixed-top" style="padding: 0% 10%; background-color: white">-->


        <div class="container-fluid" style="padding: 10% 10%">
            <div id="carouselFadeExampleIndicators" class="carousel slide carousel-fade" data-ride="carousel">
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item active">
                        <img style="width: 100%;height: 300px; border: 1px solid #ddd" class="d-block w-100" src="Img/demobanner.jpg" data-src="holder.js/900x400?theme=social" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img style="width: 100%;height: 300px; border: 1px solid #ddd" class="d-block w-100" src="Img/demobanner1.jpg" data-src="holder.js/900x400?theme=industrial" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img style="width: 100%;height: 300px; border: 1px solid #ddd" class="d-block w-100" src="Img/demobanner.jpg" data-src="holder.js/900x400?theme=industrial" alt="Second slide">
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
                <a class="carousel-control-next" href="#carouselFadeExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>


        <hr>

        <div class="container-fluid" style="padding: 3% 10%">
            <div class="row">

                 <jsp:include page="sidebar.jsp"/>
                <div class="col-lg-10 pl-5" >
                    <div class="row">


                        <c:forEach var="t" items="${sach}">
                            <div class="col-lg-4 mb-4">
                                <div style="padding: 50px; border: 1px solid black; height: 650px">
                                    <span>
                                        <p>
                                            <a href="detail?tenSach=${t.tenSach}">
                                                <img style="border: 2px solid black" src="${t.anhSach}" width="100%" height="300"/>
                                            </a>
                                        </p>
                                        <p>
                                            <a href="detail?tenSach=${t.tenSach}" style="border: 1px;text-decoration: none;color: red">
                                                <h4 style="color: red; text-align: center">
                                                    ${t.tenSach}
                                                </h4>
                                            </a>
                                        </p>
                                        <p style="text-align: center">
                                            <b>
                                                ${t.tenTacGia}
                                            </b>
                                        </p>
                                        <p style="text-align: center;vertical-align: bottom">

                                            ${t.giaBia}
                                        </p>

                                        <div class="align-bot">


                                            <p style="text-align: center;vertical-align: bottom">

                                                <a  href="muasach?tenSach=${t.tenSach}"><input class="btn btn-info btn-lg" type="submit" value="Mua ngay"  name="buy"></a>
                                            </p>
                                        </div>
                                    </span>

                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <nav aria-label="..." style="float: right">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="Sach?page=1">1</a></li>
                    <li class="page-item"><a class="page-link" href="Sach?page=2">2</a></li>
                    <li class="page-item"><a class="page-link" href="Sach?page=3">3</a></li>
                    <li class="page-item"><a class="page-link" href="Sach?page=4">4</a></li>
                    <li class="page-item"><a class="page-link" href="Sach?page=5">5</a></li>

                </ul>
            </nav>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>



</html>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


