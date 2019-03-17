<%-- 
    Document   : loginView
    Created on : Mar 18, 2019, 12:35:28 AM
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
            <h3>Login Page</h3>
            <p style="color: red;">${errorMessage}</p>
        <form method="POST" action="${pageContext.request.contextPath}/login">
            <input type="hidden" name="redirectId" value="${param.redirectId}" />
            <table border="0">
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="userName" value= "${user.userName}" /> </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" value= "${user.password}" /> </td>
                </tr>

                <tr>
                    <td colspan ="2">
                        <input type="submit" value= "Submit" />
                        <a href="${pageContext.request.contextPath}/">Cancel</a>
                    </td>
                </tr>
            </table>
        </form>
        <h1>Hello World!</h1>
    </body>
</html>
