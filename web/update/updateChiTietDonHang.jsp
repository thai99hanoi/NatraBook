<%-- 
    Document   : updateChiTietDonHang
    Created on : Oct 25, 2019, 10:18:07 PM
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
        <form action="updateChiTietDonHang">
            <table border="1" cellspacing="0">
                <tr>
                    <td>Mã Sách</td>
                    <td>Mã Đơn Hàng</td>
                    <td>Số Lượng</td>
                    <td>Đơn Gía</td>
                </tr>

                <c:forEach var="u" items="${update}">
                    <tr>
                        <td><input type="text" name="maSach" value="${u.maSach}"/></td>
                        <td><input type="text" name="maDonHang" value="${u.maDonHang}" /></td>
                        <td><input type="text" name="soLuong" value="${u.soLuong}" /></td>
                        <td><input type="text" name="donGia" value="${u.donGia}" /></td>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <input type="submit" value="Update" name="update" />
        </form>
    </body>
</html>
