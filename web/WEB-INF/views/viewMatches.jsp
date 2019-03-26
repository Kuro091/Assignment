<%-- 
    Document   : Matches
    Created on : Mar 18, 2019, 9:51:56 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.Match"%>
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
    <body class="index-page">
        <div class="container">
            <jsp:include page="_menu.jsp"></jsp:include>
                <br/><br/><br/>

                <h1>Hello ${loginedUser.userName}</h1>

            <h1>Các trận đấu sắp diễn ra </h1>

            <!--TEST FUNC 
            <table>
                <tr>
                    <th>Ngày</th>
                    <th>Giờ thi đấu</th>
                    <th>Trận đấu</th>
                    <th>Địa điểm</th>
                </tr>

                <tbody>
            <%-- <c:forEach items="${matches}" var="m">
                <tr>
                    <td>${m.getDateString()}</td>
                    <td>${m.getTime()}</td>
                    <td>${m.getHost()} - ${m.getGuest()}</td>
                    <td>${m.getStadium()}</td>
                </tr>
            </c:forEach> --%>
        </tbody>
    </table>

    ------------------------------------------->

            <c:forEach items="${matches}" var="m">
                <form action="${pageContext.request.contextPath}/buyTicket">
                    <div class="box_team">
                        <div class="header_box_team">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="info_start">
                                        <h3>${m.getHost()} - ${m.getGuest()}</h3>

                                        <span class="time_match_index">
                                            ${m.getTimeString()} ngày ${m.getDateString()}
                                        </span>

                                        <span class="place_match">${m.getStadium()}</span>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-6">
                                    <div class="match_box">
                                        <table>
                                            <tr class="row">
                                                <td class="col-md-5"><img
                                                        src="${m.getFlag(m.getHost())}"
                                                        height="60" alt="">
                                                    <p>${m.getHost()}</p></td>
                                                <td class="col-md-2" style="color:white"><h2>vs</h2></td>
                                                <td class="col-md-5"><img
                                                        src="${m.getFlag(m.getGuest())}"
                                                        height="60" alt="">
                                                    <p>${m.getGuest()}</p></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="bottom_btn">
                            <input type="hidden" name="matchID" value="${m.matchID}">
                            <input type="hidden" name="username" value="${loginedUser.userName}">
                            <input type="submit" class="btn_buy_ticket" value="MUA VÉ" onclick="">
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </form>
            </c:forEach>

            <nav aria-label="">
                <ul class="pagination justify-content-center">
                    <c:forEach var = "i" begin = "1" end = "${noOfPages}">
                        <li class="page-item" value="${i}">
                            <a class="page-link" href="${pageContext.request.contextPath}/viewMatches?p=${i}">${i}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>



            <!-- Core -->
            <script src="assets/js/core/jquery.min.js"></script>
            <script src="assets/js/core/popper.min.js"></script>
            <script src="assets/js/core/bootstrap.min.js"></script>
            <script>
                // Get the container element
                $(document).ready(function () {
                    $(".pagination li").each(function () {
                        if ($(this).attr('value') == ${currentPage}) {
                            console.log($('li'));
                            $(this).addClass("active");
                        }
                    });
                });
            </script>
            <!-- Theme JS -->

            <script src="assets/js/blk-design-system.min.js"></script>
        </div>
        <jsp:include page="_footer.jsp"></jsp:include>
    </body>
</html>
