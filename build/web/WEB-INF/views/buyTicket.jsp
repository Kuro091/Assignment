<%-- 
    Document   : buyTicket
    Created on : Mar 24, 2019, 11:10:06 AM
    Author     : admin
--%>

<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mua vé</title>
    </head>
    <body>

        <form method="post" action="checkout">
            <p>Trận đấu:${requestScope.matchname}</p>
            <input type="hidden" name="matchID" value="${matchID}">
            <input type="hidden" name="username" value="${username}">
            <p>Người mua:${user.getUserName()}</p>
            <p>Tổng tiền trong tài khoản:${user.getCredit()}</p></br>
            Số lượng vé:<input type="number"  name="amount" ></br>
            <input type="submit" name = "checkout" value="Thanh toán">
        </form>

    </body>
</html>
