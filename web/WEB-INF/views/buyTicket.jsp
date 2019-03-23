<%-- 
    Document   : buyTicket
    Created on : Mar 21, 2019, 12:40:21 AM
    Author     : admin
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%
                    Order order = (Order) request.getAttribute("order");

                %>
        <form action="" method="get">
           <input type="visible" name="matchID" value="<%=order.getMatchID()%>">
            <input type="visible" name="userID" value="<%=order.getUserID()%>">
            
            Amount: <input type="number"  name = "amount"></br>
            <input type="submit" value="Ok"/>
        </form>

        <table>
            <tr>
                <th>Trận đấu</th>

                <th>Số vé</th>
                <th>Tổng giá</th>
            </tr>
            <tbody>

              
                <tr>
                    <td><%=order.getMatchID()%></td>

                    <td><%=order.getTotalticket()%></td>
                    <td><%=order.getTotalprice()%></td>
                </tr>

            </tbody>
        </table>

    </body>
</html>
