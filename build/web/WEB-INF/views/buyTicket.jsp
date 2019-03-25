<%-- 
    Document   : buyTicket
    Created on : Mar 24, 2019, 11:10:06 AM
    Author     : admin
--%>

<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<body class="index-page">

    <jsp:include page="_menu.jsp"></jsp:include>
        <br/><br/><br/><br/>

        <div class="container">

            <form method="post" action="${pageContext.request.contextPath}/buyTicket">
            <table class="table">
                <thead>
                    <tr>
                        <th class="text-center"></th>
                        <th class="text-center">Thông tin</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                <input type="hidden" name="matchID" value="${match.getMatchID()}">
                <input type="hidden" name="username" value="${user.getUserName()}">
                <td class="text-justify">Trận đấu</td>
                <td class="text-center"><span class="badge badge-info"><b><h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${match.getHost()}  VS  ${match.getGuest()}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5></b></span></td>
                </tr>
                <tr>
                    <td class="text-justify">Người mua</td>
                    <td><span class="badge badge-success">${user.getUserName()}</span></td>
                </tr>
                <tr>
                    <td class="text-justify">Tổng tiền trong tài khoản</td>
                    <td><span class="badge badge-danger">${user.getCredit()}</span></td>
                </tr>
                <tr>
                    <td class="text-justify">Số lượng vé còn lại</td>
                    <td><span class="badge badge-danger">${ticket}</span></td>
                </tr>
                <tr>
                    <td class="text-justify"><b>Số lượng vé cần mua (Max 4 vé)</b></td>

                    <td> <div class="form-group">
                            <select type="number"  name="amount" multiple class="form-control">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                            </select>
                        </div></td>

                </tr>
                </tbody>
            </table>
            <input type="submit" style="margin-bottom: 10%"class="btn_buy_ticket" name="checkout" value="Xác nhận" onclick="">

        </form>

        <!--
    <form method="post" action="orderstatus">
        <input type="hidden" name="matchID" value="${match.getMatchID()}">
        <input type="hidden" name="username" value="${user.getUserName()}">
        <p>Trận đấu:${match.getHost()}  VS  ${match.getGuest()}</p>
        <p>Người mua:${user.getUserName()}</p>
        <p>Tổng tiền trong tài khoản:${user.getCredit()}</p>
        <p>Số lượng vé:${ticket}</p>
        Quanity<input type="number"  name="amount" min="1" max="4"></br>
        <input type="submit" name = "checkout" value="Xác nhận">
    </form> -->
    </div>
    <jsp:include page="_footer.jsp"></jsp:include>


    <!--  End Modal -->
    <!-- Core -->
    <script src="assets/js/core/jquery.min.js"></script>
    <script src="assets/js/core/popper.min.js"></script>
    <script src="assets/js/core/bootstrap.min.js"></script>

    <!-- Theme JS -->

    <script src="assets/js/blk-design-system.min.js"></script>
</body>
</html>
