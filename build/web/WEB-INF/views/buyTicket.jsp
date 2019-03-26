<%-- 
    Document   : buyTicket
    Created on : Mar 24, 2019, 11:10:06 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        #myselect {
            display:inline-block; overflow:hidden; border:solid black 1px;
        }

        #myselect > select {
            padding:10px;
            margin:-5px -20px -5px -5px;
            align-content: center;
        }

        #myselect > select > option:hover {
            box-shadow: 0 0 10px 100px #4A8CF7 inset; color: white;
        }
    </style>
</head>
<body class="index-page">

    <jsp:include page="_menu.jsp"></jsp:include>
        <br/><br/><br/><br/>

        <div class="container">
        <c:if test="${not empty message}">
            <h6 class="alert alert-danger text-center">${message}</h6>
        </c:if>
        <form method="post" action="${pageContext.request.contextPath}/buyTicket">
            <h1 class="alert alert-info text-center">Chọn số vé bạn muốn mua cho trận đấu này</h1>
            <table class="table">
                <thead>
                    <tr>
                        <th class="text-center"></th>
                        <th>Thông tin</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                <input type="hidden" name="matchID" value="${match.getMatchID()}">
                <input type="hidden" name="username" value="${user.getUserName()}">
                <input type="hidden" name="ticketLeft" value="${ticket}">
                <td class="text-justify">Trận đấu</td>
                <td class="text-justify "><span class="badge badge-info"><b><h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <img src="${match.getFlag(match.getHost())}" height="10" alt="">${match.getHost()} 
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <img src="${match.getFlag(match.getGuest())}" height="10" alt="">${match.getGuest()}
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5></b></span></td>
                </tr>
                <tr>
                    <td class="text-justify">Người mua</td>
                    <td class="text-justify "><span class="badge badge-success">${user.getUserName()}</span></td>
                </tr>
                <tr>
                    <td class="text-justify">Tổng tiền trong tài khoản</td>
                    <td class="text-justify"><span class="badge badge-danger">${user.getCredit()}</span></td>
                </tr>
                <tr>
                    <td class="text-justify">Số lượng vé còn lại</td>
                    <td class="text-justify"><span class="badge badge-danger">${ticket}</span></td>
                </tr>
                <tr>
                    <td class="text-justify"><b>Số lượng vé cần mua (Max 4 vé)</b></td>

                    <td class="text-justify">
                        <span class="badge badge-info"><b>Click vào số để thay đổi số lượng vé:</b></span>
                        <div id="myselect">
                            <select name="amount">
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
