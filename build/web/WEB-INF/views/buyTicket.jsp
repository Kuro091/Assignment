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

        <%
            Receipt receipt = (Receipt) request.getAttribute("receipt");
            String matchIDStr = request.getParameter("matchID");
            int matchID = 0;
            try {
                matchID = Integer.parseInt(matchIDStr);

            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

        %>
        <form method="post">
            <input type="visible" name="matchID" value="<%=matchID%>">
            <input type="visible" name="username" value="<%=receipt.getUserID()%>"></br>
            <input type="number"  name="amount" ></br>
            <input type="submit" name = "checkout" value="Thanh toán">
        </form>
    </body>
</html>
