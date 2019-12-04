<%-- 
    Document   : InsertNgonNgu
    Created on : Oct 23, 2019, 2:43:02 PM
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
        <form action="insertNgonNgu" method="POST">
            <h1>Thêm Ngôn Ngữ</h1>
            <table>
                <tr>
                    <td>Mã Ngôn Ngữ</td>
                    <td><input type="text" name="maNgonNgu" value=""></td>
                </tr>
                <tr>
                    <td>Tên Ngôn Ngữ</td>
                    <td><input type="text" name="tenNgonNgu" value=""></td>
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
