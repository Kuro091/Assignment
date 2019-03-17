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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${not empty loginedUser}">
            <a href="${pageContext.request.contextPath}/viewMatches">
                View Matches
            </a>
            ||
            <a href="${pageContext.request.contextPath}/manageUsers">
                Manage users' Order
            </a>
        </c:if>
        ||
        <a href="${pageContext.request.contextPath}/login">
            Login
        </a>
        ||
        <a href="${pageContext.request.contextPath}/logout">
            Logout
        </a>
    </body>
</html>
