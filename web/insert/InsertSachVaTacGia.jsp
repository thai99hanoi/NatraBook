<%-- 
    Document   : InsertSachvaTacGia
    Created on : Oct 23, 2019, 2:59:43 PM
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
        <form action="insertSachVaTacGia" method="POST">
            <h1>Thêm Sách và Tác Giả</h1>
            <table>
                <tr>
                    <td>Mã Sách</td>
                    <td><input type="text" name="maSach" value=""></td>
                </tr>
                <tr>
                    <td>Mã Tác Giả</td>
                    <td><input type="text" name="maTacGia" value=""></td>
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
