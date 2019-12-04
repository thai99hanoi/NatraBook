<%-- 
    Document   : menu
    Created on : Oct 28, 2019, 1:19:32 PM
    Author     : D
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Page</title>
    </head>
    <style>
        a{padding:10px;text-decoration: none;}
    </style>
    <body>
        <p>
            <a href="./index.html">Index</a>
            <a href="./sach.jsp">Admin</a>
            <a href="./jspAccount/user.jsp">User</a>    
            <a href="./jspAccount/login.jsp">Login</a>
    <c:if test="${not empty sessionScope.login}">
        Welcome ${sessionScope.login.username}
        <a href="./logout">Log out</a>
    </c:if>
    <p>
        <a href="./InsertKhachHang.jsp">Registration</a>
    </p>
</p>
</body>
</html>
