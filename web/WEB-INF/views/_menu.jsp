<%-- 
    Document   : _menu
    Created on : Mar 18, 2019, 1:01:00 AM
    Author     : Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <a class="navbar-brand" href="${homeRef}">Bóng đá ticket thingy</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
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
                        <a class="nav-link disabled" href="${pageContext.request.contextPath}/viewMatches?p=1">View available matches</a>
                    </li>

                    <c:if test="${loginedUser.getMainRole()=='ADMIN'}">
                        <li class="nav-item">
                            <a class="nav-link disabled" href="${pageContext.request.contextPath}/adminPanel">Admin Panel</a>
                        </li>
                    </c:if>
                    <c:if test="${loginedUser.getMainRole()=='USER'}">
                        <li class="nav-item">
                            <a class="nav-link disabled" href="${pageContext.request.contextPath}/addCredit">Add credit</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="${pageContext.request.contextPath}/viewOrders">View orders</a>
                          
                        </li>
                    </c:if>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="${pageContext.request.contextPath}/logout">Logout</a>
                    </li>
                </c:if>



            </ul>
            <c:if test="${not empty loginedUser}">
                <span class="navbar-text">
                    Current credit: ${loginedUser.getCredit()}
                </span>
            </c:if>
        </div>
    </div>
</nav>
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
