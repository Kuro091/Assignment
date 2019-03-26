<%-- 
    Document   : adminViewOrder
    Created on : Mar 26, 2019, 3:39:54 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <jsp:include page="_menu.jsp"></jsp:include>
            <div class="wrapper">
                <section class="section section-lg">
                <c:if test="${not empty message}">
                    <h2 class="alert alert-info">${message}</h2>
                </c:if>
                <img src="assets/img/path4.png" class="path">
                <img src="assets/img/path4.png" class="path">
                <div class="col-md-12">
                    <div class="card card-chart card-plain">
                        <div class="card-header">
                            <div class="row offset-3">
                                <div class="col-lg-4 text-left">
                                    <hr class="line-primary">
                                    <h5 class="card-category">Mangage</h5>
                                    <h2 class="card-title">Users' orders</h2>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-lg-12 text-right">
                                        <c:if test="${not empty pay}">
                                            <div class="container">
                                                <table class="table">
                                                    <h1 class="text-left">Các đơn hàng đã thanh toán</h1>
                                                    <thead>
                                                        <tr>
                                                            <th >ID</th>
                                                            <th >Chứng minh thư</th>
                                                            <th >Tổng Giá</th>
                                                            <th >Tổng số vé</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${pay}" var ="p">
                                                            <tr>
                                                                <td scope="row">${p.receiptID}</td>
                                                                <td>${p.userID}</td>
                                                                <td>${p.totalprice}</td>
                                                                <td>${p.totalticket}</td>
                                                                <td>
                                                                    <a href="adminAccept?id=${p.receiptID}"><button type="button" class="btn btn-info">Xác nhận đơn hàng</button></a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </c:if>
                                        <br/><br/><br/>
                                        <c:if test="${not empty unpay}">
                                            <div class="container">
                                                <table class="table">
                                                    <h1 class="text-left">Các đơn hàng chưa thanh toán</h1>
                                                    <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Chứng minh thư</th>
                                                            <th>Tổng Giá</th>
                                                            <th>Tổng số vé</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${unpay}" var ="p">
                                                            <tr  align = "center">
                                                                <td scope="row">${p.receiptID}</td>
                                                                <td>${p.userID}</td>
                                                                <td>${p.totalprice}</td>
                                                                <td>${p.totalticket}</td>
                                                                <td>
                                                                    <a href="adminCancelOrder?id=${p.receiptID}"><button type="button" class="btn btn-danger">Hủy đơn hàng</button></a>
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

            <%--
            <h1> Các đơn hàng đã thanh toán</h1>
            <table>
                <thead>
                    <tr>
                        <th >ID</th>
                        <th >Chứng minh thư</th>
                        <th >Tổng Giá</th>
                        <th >Tổng số vé</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${pay}" var ="p">
                        <tr>
                            <th scope="row">${p.receiptID}</th>
                            <td>${p.userID}</td>
                            <td>${p.totalprice}</td>
                            <td>${p.totalticket}</td>
                            <td>
                                <a href="adminAccept?id=${p.receiptID}"><button type="button">Xác nhận đơn hàng</button></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <h1> Các đơn hàng chưa thanh toán</h1>
            <table>
                <thead>
                    <tr>
                        <th >ID</th>
                        <th >Chứng minh thư</th>
                        <th >Tổng Giá</th>
                        <th >Tổng số vé</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${unpay}" var ="p">
                        <tr  align = "center">
                            <th scope="row">${p.receiptID}</th>
                            <td>${p.userID}</td>
                            <td>${p.totalprice}</td>
                            <td>${p.totalticket}</td>
                            <td>
                                <a href="adminCancelOrder?id=${p.receiptID}"><button type="button">Hủy đơn hàng</button></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table> --%>
            <br/><br/><br/><br/>  <br/><br/><br/><br/>  <br/><br/><br/><br/>     <br/><br/> 
            <jsp:include page="_footer.jsp"></jsp:include>
        </div>
        <!-- Core -->
        <script src="assets/js/core/jquery.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <!-- Theme JS -->

        <script src="assets/js/blk-design-system.min.js"></script>
    </body>
</html>
