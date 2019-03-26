<%-- 
    Document   : viewOrders
    Created on : Mar 26, 2019, 11:17:13 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="model.*"%>
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
    <body class="landing-page">
        <%--
                <%
                    ArrayList<Receipt> re = (ArrayList<Receipt>) request.getAttribute("pay");
                    String message = "";
                    for (Receipt r : re) {
                        if (r.isIsAccept() == true) {
                            message = "Đã xác nhận";
                        } else {
                            message = "Đang chờ xác nhận";
                        }


                    <%
                        }
                    %>
                %> --%>


        <jsp:include page="_menu.jsp"></jsp:include>
            <div class="wrapper">
                <section class="section section-lg">
                    <img src="assets/img/path4.png" class="path">
                    <img src="assets/img/path4.png" class="path">
                    <div class="col-md-12">
                        <div class="card card-chart card-plain">
                            <div class="card-header">
                                <div class="row offset-3">
                                    <div class="col-lg-4 text-left">
                                        <hr class="line-primary">
                                        <h5 class="card-category">Display page</h5>
                                        <h2 class="card-title">Your orders</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="container">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-12 text-right">
                                            <form method="get" action="viewOrders">
                                                <input type="hidden" name="userid" value="${loginedUser.getUserID()}"/>
                                            <input class ="btn btn-info btn-lg btn-huge" type="submit" value="Click vào để hiện/reload hóa đơn"/>
                                        </form>
                                        <c:if test="${not empty pay}">
                                            <table class="table">
                                                <h1 class="text-left">Các đơn hàng đã thanh toán</h1>
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Tổng Giá</th>
                                                        <th>Tổng số vé</th>
                                                        <th>Trạng thái</th>
                                                        <th class="text-right">Lựa chọn</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${pay}" var="r">
                                                        <c:choose>
                                                            <c:when test="${r.isIsAccept()==true}">
                                                                <c:set var="message" value="Đã xác nhận"></c:set>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:set var="message" value="Đang chờ xác nhận"></c:set>
                                                            </c:otherwise>
                                                        </c:choose>

                                                        <tr>
                                                            <td scope="row">${r.getReceiptID()}</td>
                                                            <td>${r.getTotalprice()}</td>
                                                            <td>${r.getTotalticket()}</td>
                                                            <td>${message}</td>


                                                            <td>

                                                                <form method="post" action="cancelorder">
                                                                    <input type="hidden" name="receiptid" value=${r.getReceiptID()}>
                                                                    <input type ="hidden" name="matchid" value=${r.getMatchID()}>
                                                                    <input type ="submit" value="Huỷ" class="btn btn-danger btn-sm btn-round float-right">
                                                                </form>
                                                            </td>
                                                        </c:forEach>
                                                </tbody>
                                            </table>
                                        </c:if>
                                        <c:if test="${not empty unpay}">
                                            <div class="container">
                                                <table class="table">
                                                    <h1 class="text-left">Các đơn hàng chưa thanh toán</h1>
                                                    <thead>
                                                        <tr>
                                                            <th >ID</th>
                                                            <th >Tổng Giá</th>
                                                            <th >Tổng số vé</th>
                                                            <th colspan="2">Lựa chọn</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${unpay}" var ="p">
                                                            <tr>
                                                                <td scope="row">${p.receiptID}</td>
                                                                <td>${p.totalprice}</td>
                                                                <td>${p.totalticket}</td>
                                                                <td class="text-right col-1">
                                                                    <form action="checkout">
                                                                        <input type="hidden" name="receiptid" value="${p.receiptID}">
                                                                        <input type="hidden" name="totalprice" value="${p.totalprice}">
                                                                        <input type="hidden" name="userid" value="${p.userID}">
                                                                        <input type="hidden" name="matchid" value="${p.matchID}">
                                                                        <input type="submit" value="Thanh toán" class="btn btn-info btn-sm btn-round">
                                                                    </form>
                                                                </td>
                                                                <td class="text-right col-1">
                                                                    <form method="post" action="cancelorder">
                                                                        <input type="hidden" name="receiptid" value="${p.receiptID}">
                                                                        <input type ="hidden" name="matchid" value="${p.matchID}">
                                                                        <input class="btn btn-danger btn-sm btn-round float-right" type ="submit" value="Hủy">
                                                                    </form>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
          <br/><br/><br/><br/>  <br/><br/><br/><br/>  <br/><br/><br/><br/>     <br/><br/>                             
        <jsp:include page="_footer.jsp"></jsp:include>
        </div>


        <%--
        <div class="wrapper">


            <h1> </h1>
            <table>
                <thead>
                    <tr>
                        <th >ID</th>
                        <th >Tổng Giá</th>
                        <th >Tổng số vé</th>
                        <th> Trạng thái</th>
                        <th> Lựa chọn</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${pay}" var="r">
                        <c:choose>
                            <c:when test="${r.isIsAccept()==true}">
                                <c:set var="message" value="Đã xác nhận"></c:set>
                            </c:when>
                            <c:otherwise>
                                <c:set var="message" value="Đang chờ xác nhận"></c:set>
                            </c:otherwise>
                        </c:choose>

                        <tr  align = "center">
                            <th scope="row">${r.getReceiptID()}</th>
                            <td>${r.getTotalprice()}</td>
                            <td>${r.getTotalticket()}</td>
                            <td>${message}></td>


                            <td>

                                <form method="post" action="cancelorder">
                                    <input type="hidden" name="receiptid" value=${r.getReceiptID()}>
                                    <input type ="hidden" name="matchid" value=${r.getMatchID()}>
                                    <input type ="submit" value="Huỷ">
                                </form>
                            </td>
                        </c:forEach>



                </tbody>
            </table>

            <h1> Các đơn hàng chưa thanh toán</h1>

            <table>
                <thead>
                    <tr>
                        <th >ID</th>
                        <th >Tổng Giá</th>
                        <th >Tổng số vé</th>
                        <th>Lựa chọn</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${unpay}" var ="p">
                        <tr  align = "center">
                            <th scope="row">${p.receiptID}</th>
                            <td>${p.totalprice}</td>
                            <td>${p.totalticket}</td>
                            <td>
                                <form action="checkout">
                                    <input type="hidden" name="receiptid" value="${p.receiptID}">
                                    <input type="hidden" name="totalprice" value="${p.totalprice}">
                                    <input type="hidden" name="userid" value="${p.userID}">
                                    <input type="hidden" name="matchid" value="${p.matchID}">
                                    <input type="submit" value="Thanh toán">
                                </form>

                            </td>
                            <td>

                                <form method="post" action="cancelorder">
                                    <input type="hidden" name="receiptid" value="${p.receiptID}">
                                    <input type ="hidden" name="matchid" value="${p.matchID}">
                                    <input type ="submit" value="Huỷ">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        
        
        --%>
        
        <!-- Core -->
        <script src="assets/js/core/jquery.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <!-- Theme JS -->

        <script src="assets/js/blk-design-system.min.js"></script>
    </body>
</html>
