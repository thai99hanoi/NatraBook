<%-- 
    Document   : sidebar
    Created on : Mar 21, 2021, 10:10:20 PM
    Author     : DATPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <div class="col-lg-2" style="background-color: white">
                    <h1>
                        Danh Sách Sản Phẩm
                    </h1>
                    <hr>
                    <button type="button" class="btn btn-primary btn-sm w-100 bg-light border-0 text-dark p-1">
                        Tất Cả
                    </button>
                    <div class="dropdown w-100 bg-light" >
                        <button class="btn dropdown-toggle btn-sm w-100 bg-light" style="border-color: white; color: black"
                                type="button" id="dropdownMenu1" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                            Thể Loại
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                            <c:forEach var="tl" items="${TheLoai}">
                                <a class="dropdown-item" href="sotl?tenLoaiSach=${tl.tenLoaiSach}">
                                    ${tl.tenLoaiSach}
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary btn-sm w-100 bg-light" style="border-color: white">
                        <a href="allAuth" style="color: black">
                            Tác Giả
                        </a>

                    </button>

                </div>
    </body>
</html>
