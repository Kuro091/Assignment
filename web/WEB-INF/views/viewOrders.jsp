<%-- 
    Document   : viewOrders
    Created on : Mar 26, 2019, 11:17:13 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="get" action="viewOrders">
            <input type="hidden" name="userid" value="${loginedUser.getUserID()}">
            <input type="submit" value="Hiện hóa đơn">
        </form>
        <h1> Các đơn hàng đã thanh toán</h1>
        <table>
            <thead>
                <tr>
                    <th >ID</th>
                    <th >Tổng Giá</th>
                    <th >Tổng số vé</th>
                    <th> Trạng thái</th>
                    <th> Lựa chọn</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ArrayList<Receipt> re = (ArrayList<Receipt>) request.getAttribute("pay");
                    String message = "";
                    for (Receipt r : re) {
                        if (r.isIsAccept() == true) {
                            message = "Đã xác nhận";
                        } else {
                            message = "Đang chờ xác nhận";
                        }

                %>

                <tr  align = "center">
                    <th scope="row"><%=r.getReceiptID()%></th>
                    <td><%=r.getTotalprice()%></td>
                    <td><%=r.getTotalticket()%></td>
                    <td><%=message%></td>


                    <td>

                        <form method="post" action="cancelorder">
                            <input type="hidden" name="receiptid" value=<%=r.getReceiptID()%>>
                            <input type ="hidden" name="matchid" value=<%=r.getMatchID()%>>
                            <input type ="submit" value="Huỷ">
                        </form>
                    </td>


                    <%
                        }
                    %>
            </tbody>
        </table>

        <h1> Các đơn hàng chưa thanh toán</h1>

        <table>
            <thead>
                <tr>
                    <th >ID</th>
                    <th >Tổng Giá</th>
                    <th >Tổng số vé</th>
                    <th>Lựa chọn</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${unpay}" var ="p">
                    <tr  align = "center">
                        <th scope="row">${p.receiptID}</th>
                        <td>${p.totalprice}</td>
                        <td>${p.totalticket}</td>
                        <td>
                            <form action="checkout">
                                <input type="hidden" name="receiptid" value="${p.receiptID}">
                                <input type="hidden" name="totalprice" value="${p.totalprice}">
                                <input type="hidden" name="userid" value="${p.userID}">
                                <input type="hidden" name="matchid" value="${p.matchID}">
                                <input type="submit" value="Thanh toán">
                            </form>

                        </td>
                        <td>

                            <form method="post" action="cancelorder">
                                <input type="hidden" name="receiptid" value="${p.receiptID}">
                                <input type ="hidden" name="matchid" value="${p.matchID}">
                                <input type ="submit" value="Huỷ">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
