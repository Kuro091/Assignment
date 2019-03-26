<%-- 
    Document   : errorPage
    Created on : Mar 27, 2019, 5:13:36 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
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

        <br/><br/><br/><br/><br/><br/><br/>
        <jsp:include page="_menu.jsp"></jsp:include>
            <div class="wrapper page-header">
                <div class="container">
                    <h1 class="alert alert-info">Sorry an exception occurred!</h1>
                    <div class="text-muted">Here are some details:</div>
                        <table class="table">
                            <tr valign = "top">
                                <td width = "40%"><b>Error:</b></td>
                                <td>${pageContext.exception}</td>
                        </tr>

                        <tr valign = "top">
                            <td><b>URI:</b></td>
                            <td>${pageContext.errorData.requestURI}</td>
                        </tr>

                        <tr valign = "top">
                            <td><b>Status code:</b></td>
                            <td>${pageContext.errorData.statusCode}</td>
                        </tr>

                        <tr valign = "top">
                            <td><b>Stack trace:</b></td>
                            <td>
                        <c:forEach var = "trace" 
                                   items = "${pageContext.exception.stackTrace}">
                            <p>${trace}</p>
                        </c:forEach>
                        </td>
                        </tr>
                    </table>
            </div>
        </div>
        <jsp:include page="_footer.jsp"></jsp:include>

    </body>
</html>
