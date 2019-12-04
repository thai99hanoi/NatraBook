<%-- 
    Document   : updateNgonNgu
    Created on : Oct 26, 2019, 9:54:21 AM
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
        <form action="updateNgonNgu">
            <table border="1" cellspacing="0">
                <tr>
                    <td>Mã Ngôn Ngữ</td>
                    <td>Tên Ngôn Ngữ</td>
                </tr>

                <c:forEach var="u" items="${update}">
                    <tr>
                        <td><input type="text" name="maNgonNgu" value="${u.maNgonNgu}"/></td>
                        <td><input type="text" name="tenNgonNgu" value="${u.tenNgonNgu}"/></td>
                    </tr>
                </c:forEach>
            </table>
            <input type="submit" value="Update" name="update" />
        </form>
    </body>
</html>
