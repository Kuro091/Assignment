<%-- 
    Document   : updatecredit
    Created on : Mar 20, 2019, 10:59:20 PM
    Author     : User
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <form method="post" action="${pageContext.request.contextPath}/addCredit">
            <section class="section section-lg">
                <section class="section">
                    <img src="../assets/img/path4.png" class="path">
                    <div class="container">
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger"><h4 class="col-5">${errorMessage}</h4></div>
                        </c:if>
                        <div class="row row-grid justify-content-between">
                            <div class="col-md-5 mt-lg-5">
                                <div class="row">
                                    <div class="col-lg-6 col-sm-12 px-2 py-2">
                                        <div class="card card-stats ">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-5 col-md-4">
                                                        <div class="icon-big text-center icon-warning">
                                                            <i class="tim-icons icon-gift-2 text-info"></i>
                                                        </div>
                                                    </div>
                                                    <div class="col-7 col-md-8">
                                                        <div class="numbers">
                                                            <p class="card-title"><input type="text" class="form-control" type="visible" name="creditNew" value="${user.credit}">
                                                            <p>
                                                            <p class="card-category">Nạp số tiền</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-sm-12 px-2 py-2">
                                        <div class="card card-stats ">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-5 col-md-4">
                                                        <div class="icon-big text-center icon-warning">
                                                            <i class="tim-icons icon-credit-card text-success"></i>
                                                        </div>
                                                    </div>
                                                    <div class="col-7 col-md-8">
                                                        <div class="numbers">
                                                            <p class="card-title">${loginedUser.credit}
                                                            <p>
                                                            <p class="card-category">Số tiền hiện có</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="pl-md-5">
                                    <h1>Add
                                        <br/>Credit</h1>
                                    <p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa </p>
                                    <br/>
                                    <p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
                                    <br/>
                                    <input type="hidden" name="userID" value="${loginedUser.userID}">
                                    <input type="hidden" name="username" value="${loginedUser.userName}">
                                    <input class="btn_buy_ticket" type="submit" value = "Nạp tiền">
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </section>

            <%--
<p>Tiền trong tài khoản:${user.credit}</p>
Số tiền muốn nạp:<input name = "money" type="number"></br>
<input type="submit" value = "Nạp tiền">--%>
        </form>

        <jsp:include page="_footer.jsp"></jsp:include>
        <!-- Core -->
        <script src="assets/js/core/jquery.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <!-- Theme JS -->

        <script src="assets/js/blk-design-system.min.js"></script>
    </body>
</html>
