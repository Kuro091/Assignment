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
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet">

        <!-- Icons -->
        <link href="assets/css/nucleo-icons.css" rel="stylesheet">
        <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">

        <!-- Theme CSS -->
        <link type="text/css" href="assets/css/blk-design-system.css" rel="stylesheet">
        <link type="text/css" href="assets/css/customcss.css" rel="stylesheet">
    </head>
    <body class="index-page">
        <jsp:include page="_menu.jsp"></jsp:include>
            <br/><br/><br/><br/>
            <div class="container">
                <h2 class="alert alert-success">${message}</h2>
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
            <a href="index"><button class="btn btn-info">Home</button></a>
        </div>
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        <jsp:include page="_footer.jsp"></jsp:include>
        <!-- Core -->
        <script src="assets/js/core/jquery.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <!-- Theme JS -->

        <script src="assets/js/blk-design-system.min.js"></script>
    </body>
</html>
