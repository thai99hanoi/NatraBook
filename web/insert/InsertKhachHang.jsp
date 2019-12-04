<%-- 
    Document   : InsertKhachHang
    Created on : Oct 23, 2019, 2:29:03 PM
    Author     : Auriat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="insertKhachHang" method="POST">
            <h1>Thêm Khách Hàng</h1>
            <table>
                <tr>
                    <td>Mã Khách Hàng</td>
                    <td><input type="text" name="maKhachHang" value=""></td>
                </tr>
                <tr>
                    <td>Họ Tên</td>
                    <td><input type="text" name="hoTen" value=""></td>
                </tr>
                <tr>
                    <td>Giới Tính</td>
                    <td><input type="text" name="gioiTinh" value=""></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="email" value=""></td>
                </tr>
                  <tr>
                    <td>Địa Chỉ</td>
                    <td><input type="text" name="diaChi" value=""></td>
                </tr>
                  <tr>
                    <td>SĐT</td>
                    <td><input type="text" name="sdt" value=""></td>
                </tr>
                  <tr>
                    <td>Tài Khoản</td>
                    <td><input type="text" name="taiKhoan" value=""></td>
                </tr>
                  <tr>
                    <td>MK</td>
                    <td><input type="password" name="mK" value=""></td>
                </tr>
                  <tr>
                    <td>Ngày Đăng Ký</td>
                    <td><input type="date" name="ngayDK" value=""></td>
                </tr>
                    <tr>
                    <td>Avatar</td>
                    <td><input type="text" name="avarta" value=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="right">
                        <input type="submit" name="insert" value="Insert"></input>
                        <button type="reset" name="reset">Reset</button>
                    </td>
                </tr>
            </table>    
        </form>
    </body>
</html>
