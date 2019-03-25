<%-- 
    Document   : orderstatus
    Created on : Mar 25, 2019, 3:22:08 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xác nhận</title>
    </head>
    <body>
        <h1>Xác nhận đơn hàng</h1>
        <table>
            <tr>
                <th>Mã</th>
                <th>Người đặt hàng</th>
                <th>Tổng tiền</th>
                <th>Tổng số vé</th>
                <th>Trạng thái</th>
            </tr>

            <tbody>
                  <tr>
                        <td>${receipt.getReceiptID()}</td>
                        <td>${user.getUserName()}</td>
                        <td>${receipt.getTotalprice()}</td>
                        <td>${receipt.getTotalticket()}</td>
                        <td>Chờ thanh toán</td>
                    </tr>
            </tbody>
        </table>
        <form method="post" action="checkout">
            
            <input type="hidden" name="receiptid" value="${receipt.getReceiptID()}">
            <input type="hidden" name="totalprice" value="${receipt.getTotalprice()}">
            <input type="hidden" name="username" value="${user.getUserName()}">
            <input type="submit" value="Thanh toán">
        </form>
    </body>
</html>
