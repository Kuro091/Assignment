<%-- 
    Document   : cancelorder
    Created on : Mar 25, 2019, 8:13:45 PM
    Author     : admin
--%>

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
        <link type="text/css" href="assets/css/blk-design-system.css" rel="stylesheet">
        <link type="text/css" href="assets/css/customcss.css" rel="stylesheet">

    </head>
    <body class="index-page">
        <jsp:include page="_menu.jsp"></jsp:include>
            <br/><br/><br/><br/><br/><br/>
            <div class="container page-header">
                <h1>${message}</h1>
            <a href="index">Back to Home Page</a>
        </div>

        <!--  End Modal -->
        <!-- Core -->
        <jsp:include page="_footer.jsp"></jsp:include>
        <script src="assets/js/core/jquery.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <!-- Theme JS -->

        <script src="assets/js/blk-design-system.min.js"></script>
    </body>
</html>
