<%-- 
    Document   : checkout
    Created on : Mar 24, 2019, 1:17:44 PM
    Author     : admin
--%>
<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán</title>
    </head>
    <body>
        <%
            Receipt receipt = (Receipt)request.getAttribute("receipt");
            UserAccount user = (UserAccount)request.getAttribute("user");
            %>
            
            <h1>${requestScope.message}</h1>
            <table>
                <tr>
                    <th>Người mua</th>
                    <th>Tổng tiền</th>
                    <th>Tổng vé</th>
                    <th> Tiền sau khi thanh toán</th>
                </tr>

                <tbody>
            
                <tr>
                    <td><%=user.getUserName()%></td>
                    <td>${requestScope.totalprice}</td>
                    <td>${requestScope.totalticket}</td>
                    <td><%=user.getCredit()%></td>
                    
                </tr>
            
        </tbody>
    </table>
    </body>
</html>
