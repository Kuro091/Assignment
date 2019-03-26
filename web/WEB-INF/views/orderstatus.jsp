<%-- 
    Document   : orderStatus
    Created on : Mar 26, 2019, 12:20:51 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet">

        <!-- Icons -->
        <link href="assets/css/nucleo-icons.css" rel="stylesheet">
        <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">

        <!-- Theme CSS -->
        <link type="text/css" href="assets/css/blk-design-system.css" rel="stylesheet">
        <link type="text/css" href="assets/css/customcss.css" rel="stylesheet">
        <style>
        </style>
    </head>
    <body class="landing-page">
        <jsp:include page="_menu.jsp"></jsp:include>

            <div class="wrapper">
                <div class="page-header">
                    <img src="../assets/img/blob.png" class="path">
                    <img src="../assets/img/path2.png" class="path2">
                    <img src="../assets/img/triunghiuri.png" class="shapes triangle">
                    <img src="../assets/img/waves.png" class="shapes wave">
                    <img src="../assets/img/patrat.png" class="shapes squares">
                    <img src="../assets/img/cercuri.png" class="shapes circle">
                    <div class="content-center">
                        <div class="row row-grid justify-content-between align-items-center text-left">
                            <div class="col-lg-6">
                                <h1 class="text-white">Xác nhận đơn hàng</h1>

                            </div>
                        </div>
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
                                <td>${user.getUserName()}</td>
                                <td>${receipt.getTotalprice()}</td>
                                <td>${receipt.getTotalticket()}</td>
                                <td class="text-right">Chờ thanh toán</td>
                            </tr>
                        </tbody>

                        <form method="post" action="checkout">
                            <input type="hidden" name="receiptid" value="${receipt.getReceiptID()}">
                            <input type="hidden" name="totalprice" value="${receipt.getTotalprice()}">
                            <input type="hidden" name="username" value="${user.getUserName()}">
                            <input type="hidden" name="matchid" value="${matchid}">
                        </form>
                    </table>
                    <input type="submit"class="btn_buy_ticket" value="Thanh toán">
                </div>
            </div>

            <jsp:include page="_footer.jsp"></jsp:include>

            <!-- Core -->
            <script src="assets/js/core/jquery.min.js"></script>
            <script src="assets/js/core/popper.min.js"></script>
            <script src="assets/js/core/bootstrap.min.js"></script>

            <!-- Theme JS -->

            <script src="assets/js/blk-design-system.min.js"></script>
    </body>
</html>
