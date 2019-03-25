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

    <body class="register-page">
        <jsp:include page="_menu.jsp"></jsp:include>   
        <jsp:include page="_header.jsp"></jsp:include> 

            <div class="page-header">
                <div class="container">
                    <br/><br/>
                    <h3>Login Page</h3>
                    <div class="alert-danger"><p style="color: red;">${errorMessage}</p></div>
                <div class="col-lg-5 col-md-6 offset-lg-0 offset-md-3">
                    <div id="square7" class="square square-7"></div>
                    <div id="square8" class="square square-8"></div>
                </div>
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
                <div class="register-bg"></div>
                <div id="square1" class="square square-1"></div>
                <div id="square2" class="square square-2"></div>
                <div id="square3" class="square square-3"></div>
                <div id="square4" class="square square-4"></div>
                <div id="square5" class="square square-5"></div>
                <div id="square6" class="square square-6"></div>
            </div>
        </div>

        <jsp:include page="_footer.jsp"></jsp:include>
        <!-- Core -->
        <script src="assets/js/core/jquery.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <!-- Theme JS -->

        <script src="assets/js/blk-design-system.min.js"></script>
    </body>
</html>
