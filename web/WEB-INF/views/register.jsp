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
           <p style="color:red">${errorString}</p>
        <c:set var = "errorString" value = "${errorString}"/>
        <form method="POST"  action="${pageContext.request.contextPath}/register"  >
           
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
            </c:choose>
            
           

       

            <input type="submit" value="Done">
        </form>
    </body>
</html>
