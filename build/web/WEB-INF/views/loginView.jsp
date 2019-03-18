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

    <body>
        <jsp:include page="_menu.jsp"></jsp:include>   
        <jsp:include page="_header.jsp"></jsp:include> 
            
<br/><br/>
        <div class="container">
            <h3>Login Page</h3>
            <p style="color: red;">${errorMessage}</p>
        
            <form method="POST" action="${pageContext.request.contextPath}/login">
                <input type="hidden" name="redirectId" value="${param.redirectId}" />
                <div class="form-group">
                    <label for="username">Username: </label>
                    <input type="text" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Enter email" name="userName" value= "${user.userName}">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" placeholder="Password" name="password" value= "${user.password}">
                </div>

                <input type="submit" value= "Submit" class="btn btn-primary"/>
                <a href="${pageContext.request.contextPath}/">Cancel</a>
            </form>
        </div>
        <!-- Core -->
        <script src="assets/js/core/jquery.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <!-- Theme JS -->

        <script src="assets/js/blk-design-system.min.js"></script>
    </body>
</html>
