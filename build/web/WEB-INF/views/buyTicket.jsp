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

     
        <form method="post" action="orderstatus">
            <input type="hidden" name="matchID" value="${match.getMatchID()}">
            <input type="hidden" name="username" value="${user.getUserName()}">
            <p>Trận đấu:${match.getHost()}  VS  ${match.getGuest()}</p>
            <p>Người mua:${user.getUserName()}</p>
            <p>Tổng tiền trong tài khoản:${user.getCredit()}</p>
            <p>Số lượng vé:${ticket}</p>
            Quanity<input type="number"  name="amount" min="1" max="4"></br>
            <input type="submit" name = "checkout" value="Xác nhận">
        </form>
            
    </body>
</html>
