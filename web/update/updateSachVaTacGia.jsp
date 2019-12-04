<%-- 
    Document   : updateSachVaTacGia
    Created on : Oct 26, 2019, 3:23:25 PM
    Author     : dell
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="updateSachVaTacGia">
            <table border="1" cellspacing="0">
                <tr>
                    <td>Mã Sách</td>
                    <td>Mã Tác Gỉa</td>
                </tr>

                <c:forEach var="u" items="${update}">
                    <tr>
                        <td><input type="text" name="maSach" value="${u.maSach}"/></td>
                        <td><input type="text" name="maTacGia" value="${u.maTacGia}" /></td>
                    </tr>
                </c:forEach>
            </table>
            <input type="submit" value="Update" name="update" />
        </form>
    </body>
</html>
