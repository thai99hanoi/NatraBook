<%-- 
    Document   : InsertTheLoai
    Created on : Oct 23, 2019, 2:38:14 PM
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
        <form action="insertTheLoaiController" method="POST">
            <h1>Thêm Thể Loại</h1>
            <table>
                <tr>
                    <td>Mã Loại Sách</td>
                    <td><input type="text" name="maLoaiSach" value=""></td>
                </tr>
                <tr>
                    <td>Tên Loại Sách</td>
                    <td><input type="text" name="tenLoaiSach" value=""></td>
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
