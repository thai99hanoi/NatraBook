<%-- 
    Document   : updateNXB
    Created on : Oct 25, 2019, 10:09:04 PM
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
        <form action="updateNXB">
            <table border="1" cellspacing="0">
                <tr>
                    <td>Mã Nhà Xuất Bản</td>
                    <td>Tên Nhà Xuất Bản</td>
                    <td>Địa Chỉ</td>
                    <td>Email</td>
                    <td>Số Điện Thoại</td>
                </tr>

                <c:forEach var="u" items="${update}">
                    <tr>
                        <td><input type="text" name="maNXB" value="${u.maNXB}"/></td>
                        <td><input type="text" name="tenNXB" value="${u.tenNXB}" /></td>
                        <td><input type="text" name="diaChi" value="${u.diaChi}" /></td>
                        <td><input type="text" name="email" value="${u.email}" /></td>
                        <td><input type="text" name="sDT" value="${u.sDT}" /></td>
                    </tr>
                </c:forEach>
            </table>
            <input type="submit" value="Update" name="update" />
        </form>
    </body>
</html>
