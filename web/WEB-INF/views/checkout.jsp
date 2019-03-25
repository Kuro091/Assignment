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
            
        <h1>${message}</h1>
           
                <a href="updatecredit?id=${user.userID}"  type="button">Nạp tiền</a>
            
                <form method="post" action="cancelorder">
                    <input type ="hidden" name="receiptid" value="${receipt.getReceiptID()}" >
                    <input type ="hidden" name="matchid" value="${matchid}" >
                    <input type="submit" value="Hủy">
                </form>
    </body>
</html>
