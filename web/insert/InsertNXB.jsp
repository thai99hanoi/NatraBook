<%-- 
    Document   : InsertNXB
    Created on : Oct 23, 2019, 1:51:29 PM
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
        <form action="insertNXB" method="POST">
            <h1>Thêm NXB</h1>
            <table>
                <tr>
                    <td>Mã NXB</td>
                    <td><input type="text" name="maNXB" value=""></td>
                </tr>
                <tr>
                    <td>Tên NXB</td>
                    <td><input type="text" name="tenNXB" value=""></td>
                </tr>
                <tr>
                    <td>Địa Chỉ</td>
                    <td><input type="text" name="diaChi" value=""></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="email" value=""></td>
                </tr>
                  <tr>
                    <td>SĐT</td>
                    <td><input type="text" name="sdt" value=""></td>
                </tr>                 
                <tr>
                    <td colspan="2" align="right">
                        <input type="submit" name="insert" value="Insert"></input>
                        <button type="reset" name="reset">Reset</button>
                    </td>
                </tr>
        </form>
    </body>
</html>
