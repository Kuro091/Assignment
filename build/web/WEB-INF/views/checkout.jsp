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
            
            <h1>${requestScope.message}</h1>
            <form method="post" action="updatecredit">
                <input value="${user.getUserName()}" name="username" type="hidden">
                <input type="submit" value="Nạp tiền">
            </form>
            
                <form method="post" action="">
                    <input type ="hidden" name="receiptid" value="${receipt.getReceiptID()}" >
                    <input type="submit" value="Hủy">
                </form>
    </body>
</html>
