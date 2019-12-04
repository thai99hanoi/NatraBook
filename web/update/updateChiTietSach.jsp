<%-- 
    Document   : updateChiTietSach
    Created on : Oct 26, 2019, 9:24:01 AM
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
        <form action="updateChiTietSach">
            <table border="1" cellspacing="0">
                <tr>
                    <td>Mã Chi Tiết Sách</td>
                    <td>Mã Sách</td>
                    <td>Mã Ngôn Ngữ</td>
                    <td>Tổng Số Trang</td>
                    <td>Trọng Lượng</td>
                    <td>Kích Thước</td>
                    <td>Năm Xuất Bản</td>
                </tr>

                <c:forEach var="u" items="${update}">
                    <tr>
                        <td><input type="text" name="maChiTietSach" value="${u.maChiTietSach}"/></td>
                        <td><input type="text" name="maSach" value="${u.maSach}" /></td>
                        <td><input type="text" name="maNgonNgu" value="${u.maNgonNgu}" /></td>
                        <td><input type="text" name="tongSoTrang" value="${u.tongSoTrang}" /></td>
                        <td><input type="text" name="trongLuong" value="${u.trongLuong}" /></td>
                        <td><input type="text" name="kichThuoc" value="${u.kichThuoc}" /></td>
                        <td><input type="text" name="namXuatBan" value="${u.namXuatBan}" /></td>
                    </tr>
                </c:forEach>
            </table>
            <input type="submit" value="Update" name="update" />
        </form>
    </body>
</html>
