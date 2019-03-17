<%-- 
    Document   : home_authorized
    Created on : Mar 18, 2019, 1:07:13 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="_menu.jsp"></jsp:include>
        <h1>${loginedUser.userName}</h1>
    </body>
</html>
