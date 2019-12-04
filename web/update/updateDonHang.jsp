<%-- 
    Document   : updateDonHang
    Created on : Oct 25, 2019, 10:14:59 PM
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
        <form action="updateDonHang">
            <table border="1" cellspacing="0">
                <tr>
                    <td>Mã Đơn Hàng</td>
                    <td>Mã Khách Hàng</td>
                    <td>Thời Gian Đặt</td>
                    <td>Thời Gian Giao</td>
                    <td>Địa Chỉ</td>
                    <td>Người Nhận</td>
                    <td>Tình Trạng</td>
                    <td>Ghi Chú</td>
                </tr>

                <c:forEach var="u" items="${update}">
                    <tr>
                        <td><input type="text" name="maDonHang" value="${u.maDonHang}"/></td>
                        <td><input type="text" name="maKhachHang" value="${u.maKhachHang}" /></td>
                        <td><input type="text" name="thoiGianDat" value="${u.thoiGianDat}" /></td>
                        <td><input type="text" name="thoiGianGiao" value="${u.thoiGianGiao}" /></td>
                        <td><input type="text" name="diaChi" value="${u.diaChi}" /></td>
                        <td><input type="text" name="nguoiNhan" value="${u.nguoiNhan}" /></td>
                        <td><input type="text" name="tinhTrang" value="${u.tinhTrang}" /></td>
                        <td><input type="text" name="ghiChu" value="${u.ghiChu}" /></td>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <input type="submit" value="Update" name="update" />
        </form>
    </body>
</html>
