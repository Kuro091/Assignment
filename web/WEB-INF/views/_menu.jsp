<%-- 
    Document   : _menu
    Created on : Mar 18, 2019, 1:01:00 AM
    Author     : Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link type="text/css" href="assets/css/blk-design-system.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg fixed-top navbar-transparent" id="navbar">
            <div class="container">
                <c:choose>
                    <c:when test="${empty loginedUser}">
                        <c:set var="homeRef" value="home"></c:set>
                    </c:when>
                    <c:otherwise>
                        <c:set var="homeRef" value="index"></c:set>
                    </c:otherwise>
                </c:choose>
                <a class="navbar-brand" href="${pageContext.request.contextPath}">Bóng đá ticket thingy</a>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="<c:out value="${homeRef}"></c:out>">Home</a>
                        </li>



                        <c:if test="${empty loginedUser}">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/login">Login</a>
                            </li>
                        </c:if>



                        <c:if test="${not empty loginedUser}">
                            <li class="nav-item">
                                <a class="nav-link disabled" href="${pageContext.request.contextPath}/viewMatches">View available matches</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" href="${pageContext.request.contextPath}/logout">Logout</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>








        <!-- Core -->
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/popper/popper.min.js"></script>
        <script src="assets/vendor/bootstrap/bootstrap.min.js"></script>

        <!-- Theme JS -->
        <script src="assets/js/blk-design-system.min.js"></script>
        <script>
            window.addEventListener('scroll', function (e) {
                var nav = document.getElementById('navbar');
                if (document.documentElement.scrollTop || document.body.scrollTop > window.innerHeight) {
                    nav.classList.remove('navbar-transparent');
                    nav.classList.add('bg-info');
                } else {
                    nav.classList.remove('bg-info');
                    nav.classList.add('navbar-transparent');

                }
            });
        </script>
    </body>
</html>
