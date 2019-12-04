<%-- 
    Document   : updateTacGia
    Created on : Oct 26, 2019, 3:38:49 PM
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
        <form action="updateTacGia">
            <table border="1" cellspacing="0">
                <tr>
                    <td>Mã Tác Gỉa</td>
                    <td>Tên Tác Gỉa</td>
                    <td>Nghề Nghiệp</td>
                    <td>Ghi Chú Tác Gỉa</td>
                    <td>Ảnh Tác Gỉa</td>
                </tr>

                <c:forEach var="u" items="${update}">
                    <tr>
                        <td><input type="text" name="maTacGia" value="${u.maTacGia}"/></td>
                        <td><input type="text" name="tenTacGia" value="${u.tenTacGia}" /></td>
                        <td><input type="text" name="ngheNghiep" value="${u.ngheNghiep}" /></td>
                        <td><input type="text" name="ghiChuTacGia" value="${u.ghiChuTacGia}" /></td>
                        <td><input type="text" name="anhTacGia" value="${u.anhTacGia}" /></td>
                    </tr>
                </c:forEach>
            </table>
            <input type="submit" value="Update" name="update" />
        </form>
    </body>
</html>
