<%-- 
    Document   : adminViewOrder
    Created on : Mar 26, 2019, 3:39:54 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1> Các đơn hàng đã thanh toán</h1>
        <table>
            <thead>
                <tr>
                    <th >ID</th>
                    <th >Chứng minh thư</th>
                    <th >Tổng Giá</th>
                    <th >Tổng số vé</th>

                </tr>
            </thead>
            <tbody>
            <c:forEach items="${pay}" var ="p">
                <tr  align = "center">
                    <th scope="row">${p.receiptID}</th>
                    <td>${p.userID}</td>
                    <td>${p.totalprice}</td>
                    <td>${p.totalticket}</td>
                    <td>
                        <a href="adminAccept?id=${p.receiptID}"><button type="button">Xác nhận đơn hàng</button></a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h1> Các đơn hàng chưa thanh toán</h1>
    <table>
        <thead>
            <tr>
                <th >ID</th>
                <th >Chứng minh thư</th>
                <th >Tổng Giá</th>
                <th >Tổng số vé</th>

            </tr>
        </thead>
        <tbody>
        <c:forEach items="${unpay}" var ="p">
            <tr  align = "center">
                <th scope="row">${p.receiptID}</th>
                <td>${p.userID}</td>
                <td>${p.totalprice}</td>
                <td>${p.totalticket}</td>
                <td>
                    <a href="adminCancelOrder?id=${p.receiptID}"><button type="button">Hủy đơn hàng</button></a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
