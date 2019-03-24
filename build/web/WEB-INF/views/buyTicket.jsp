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
           
            UserAccount user = (UserAccount)request.getAttribute("user");
            String matchIDStr = request.getParameter("matchID");
            String username = request.getParameter("username");
            
            int matchID = 0;
            int userID = 0;
            try {
                matchID = Integer.parseInt(matchIDStr);
                
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

        %>
        <form method="post" action="checkout">
            Trận đấu:<input type="visible" name="matchname" value="${requestScope.matchname}"></br>
            <input type="hidden" name="matchID" value="<%=matchID%>">
            Người mua:<input type="visible" name="username" value="<%=username%>"></br>
            Tổng tiền trong tài khoản:<input type="visible"  value="<%=user.getCredit()%>"></br>
            Số lượng vé:<input type="number"  name="amount" ></br>
            <input type="submit" name = "checkout" value="Thanh toán">
        </form>
            
    </body>
</html>
