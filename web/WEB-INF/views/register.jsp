<%-- 
    Document   : register
    Created on : Mar 20, 2019, 7:08:20 PM
    Author     : User
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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

    <body class="register-page">
        <jsp:include page="_menu.jsp"></jsp:include>
        
            <div class="wrapper">

                <div class="page-header">
                    <div class="page-header-image"></div>

                    <div class="content">
                        <div class="container">
                        <c:if test="${not empty errorString}">
                            <div class="alert alert-info text-left" role="alert" >${errorString}</div>
                        </c:if>
                        <div class="row">
                            <div class="col-lg-5 col-md-6 offset-lg-0 offset-md-3">
                                <div id="square7" class="square square-7"></div>
                                <div id="square8" class="square square-8"></div>
                                <div class="card card-register">
                                    <div class="card-header">
                                        <img class="card-img" src="assets/img/square1.png" alt="Card image">
                                        <h4 class="card-title">Đăng ký</h4>
                                    </div>
                                    <div class="card-body">
                                        <form class="form" method="POST"  action="${pageContext.request.contextPath}/register">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">
                                                        <i class="tim-icons icon-single-02"></i>
                                                    </div>
                                                </div>
                                                <c:choose>
                                                    <c:when test="${not empty errorString}">
                                                        <input class="form-control" type="text" value="" name="userID" placeholder="Chứng minh nhân dân"><br/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input class="form-control" type="text" value="${user.userID}" name="userID" placeholder="Chứng minh nhân dân"><br/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">
                                                        <i class="tim-icons icon-email-85"></i>
                                                    </div>
                                                </div>
                                                <input class="form-control" type="text" value="${user.userName}" name="username" placeholder="Full Name (username)"><br/>
                                            </div>


                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">
                                                        <i class="tim-icons icon-tablet-2"></i>
                                                    </div>
                                                </div>
                                                <c:choose>
                                                    <c:when test="${not empty errorString}">
                                                        <input class="form-control" type="text" value="" name="phone" placeholder="Điện thoại"></input><br/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input class="form-control" type="text" value="${customer.phone}" name="phone" placeholder="Điện thoại"></input><br/>
                                                    </c:otherwise>
                                                </c:choose><br/>
                                            </div>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">
                                                        <i class="tim-icons icon-lock-circle"></i>
                                                    </div>
                                                </div>
                                                <input class="form-control" type="password" value="${user.password}" name="password" placeholder="Password">
                                            </div>
                                            <div class="form-check text-left">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox">
                                                    <span class="form-check-sign"></span>
                                                    Đồng ý tới 
                                                    <a href="javascript:void(0)">điều khoản</a> không?
                                                </label>
                                            </div>
                                            <br/>
                                            <input type="submit" class="btn btn-info btn-round btn-lg" value="Đăng ký">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="register-bg"></div>
                        <div id="square1" class="square square-1"></div>
                        <div id="square2" class="square square-2"></div>
                        <div id="square3" class="square square-3"></div>
                        <div id="square4" class="square square-4"></div>
                        <div id="square5" class="square square-5"></div>
                        <div id="square6" class="square square-6"></div>
                    </div>
                </div>
            </div>

        </div>

        <%--
<c:choose>
<c:when test="${not empty errorString}">
CMND: <input type="text" value="" name="id"></input><br/>
</c:when>
<c:otherwise>
CMND: <input type="text" value="${user.userID}" name="id"></input><br/>
</c:otherwise>
</c:choose>

        Name: <input type="text" value="${user.userName}" name="username"></input><br/>
        Password: <input type="text" value="${user.password}" name="password"></input><br/>



        <c:choose>
            <c:when test="${not empty errorString}">
                Phone: <input type="text" value="" name="phone"></input><br/>
            </c:when>
            <c:otherwise>
                Phone: <input type="text" value="${customer.phone}" name="phone"></input><br/>
            </c:otherwise>
        </c:choose> --%>





        <input type="submit" value="Done">

        <!-- Core -->
        <script src="assets/js/core/jquery.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <!-- Theme JS -->

        <script src="assets/js/blk-design-system.min.js"></script>
    </form>
</body>
</html>
