<%-- 
    Document   : adminConfirmAccept
    Created on : Mar 26, 2019, 4:14:12 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>${message}</h1>
        <table class="table">
                            <thead>
                                <tr>
                                    <th class="text-center">Mã hóa đơn</th>
                                    <th>Người đặt hàng</th>
                                    <th>Tổng tiền</th>
                                    <th>Tổng số vé</th>
                                    <th class="text-right">Trạng thái</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="text-center">${receipt.getReceiptID()}</td>
                                <td>${receipt.getUserID()}</td>
                                <td>${receipt.getTotalprice()}</td>
                                <td>${receipt.getTotalticket()}</td>
                                <td class="text-right">Đã giao hàng</td>
                            </tr>
                        </tbody>

                       
                    </table>
                                <a href="index">Home</a>
    </body>
</html>
