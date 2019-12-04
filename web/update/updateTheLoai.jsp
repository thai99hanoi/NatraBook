<%-- 
    Document   : updateTheLoai
    Created on : Oct 26, 2019, 7:41:31 PM
    Author     : dell
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
        <title>JSP Page</title>
    </head>
    <body>
        <form action="updateTheLoai">
            <table border="1" cellspacing="0">
                <tr>
                    <td>Mã Loại Sách</td>
                    <td>Tên Loại Sách</td>
                </tr>

                <c:forEach var="u" items="${update}">
                    <tr>
                        <td><input type="text" name="maLoaiSach" value="${u.maLoaiSach}"/></td>
                        <td><input type="text" name="tenLoaiSach" value="${u.tenLoaiSach}" /></td>
                    </tr>
                </c:forEach>
            </table>
            <input type="submit" value="Update" name="update" />
        </form>
    </body>
</html>
