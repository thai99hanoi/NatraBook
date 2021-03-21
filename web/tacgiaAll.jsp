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
            <jsp:include page="navbar.jsp"/>
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

                <jsp:include page="sidebar.jsp"/>
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

        <jsp:include page="footer.jsp"/>


    </body>



</html>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


