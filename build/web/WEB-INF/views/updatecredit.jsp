<%-- 
    Document   : updatecredit
    Created on : Mar 20, 2019, 10:59:20 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nạp tiền</title>
    </head>
    <body>
        <form method="post" action="updatecredit">
            <input type="hidden" name="username" value="${user.getUserName()}">
            <input type="hidden" name="credit" value="${user.getCredit()}">
            <p>Tiền trong tài khoản:${user.getCredit()}</p>
            Số tiền muốn nạp:<input name = "money" type="number"></br>
            <input type="submit" value = "Nạp tiền">
        </form>
    </body>
</html>
