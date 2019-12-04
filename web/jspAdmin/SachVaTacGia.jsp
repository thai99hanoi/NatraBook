<%-- 
    Document   : SachVaTacGia
    Created on : Oct 23, 2019, 11:08:28 AM
    Author     : Auriat
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sach va Tac Gia</title>
    </head>
    <body>
        <a href="InsertSachVaTacGia.jsp"> <button>Insert</button></a>
        <table border="1" cellspacing="0">
                <tr>
                    <td>Mã Sách</td>
                    <td>Mã Tác Giả</td>
                </tr>
                <c:forEach var="svtg" items="${SachVaTacGia}">
                    <tr>
                        <td>${svtg.maSach}</td>
                        <td>${svtg.maTacGia}</td>
                        <td><a href="updateSachVaTacGia?maSach=${svtg.maSach}"><input type="submit" value="Edit" /></a> <a href="DeleteSach?maSach=${t.maSach}"><input type="submit" value="Delete" /></a></td>
                    </tr>
                </c:forEach>
            </table>
    </body>
</html>
