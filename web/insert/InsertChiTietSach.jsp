<%-- 
    Document   : InsertChiTietSach
    Created on : Oct 23, 2019, 2:40:45 PM
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
        <form action="insertChiTietSach" method="POST">
            <h1>Thêm Chi Tiết Sách</h1>
            <table>
                <tr>
                    <td>Mã Chi Tiết Sách</td>
                    <td><input type="text" name="maChiTietSach" value=""></td>
                </tr>
                <tr>
                    <td>Mã Sách</td>
                    <td><input type="text" name="maSach" value=""></td>
                </tr>
                <tr>
                    <td>Mã Ngôn Ngữ</td>
                    <td><input type="text" name="maNgonNgu" value=""></td>
                </tr>
                <tr>
                    <td>Tổng Số Trang</td>
                    <td><input type="text" name="tongSoTrang" value=""></td>
                </tr>
                  <tr>
                    <td>Trọng Lượng</td>
                    <td><input type="text" name="trongLuong" value=""></td>
                </tr>
                  <tr>
                    <td>Kích Thước</td>
                    <td><input type="text" name="kichThuoc" value=""></td>
                </tr>
                  <tr>
                    <td>Năm Xuất Bản</td>
                    <td><input type="text" name="namXuatBan" value=""></td>
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
