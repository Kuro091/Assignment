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
    <body class ="profile-page">
        <jsp:include page="_menu.jsp"></jsp:include>
            <br/>
            <div class="page-header">
                <img src="assets/img/dots.png" class="dots">
                <img src="assets/img/path4.png" class="path">
                <div class="container align-items-center">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <h1 class="profile-title text-left">${loginedUser.userName}'s mainpage</h1>
                        <h5 class="text-on-back">Mainpage</h5>
                        <p class="profile-description">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>
                            aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/>
                            aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br/></p>

                    </div>
                    <div class="col-lg-4 col-md-6 ml-auto mr-auto">
                        <div class="card card-coin card-plain">
                            <div class="card-header">
                                <img src="assets/img/credit.png" class="img-center img-fluid rounded-circle">
                                <h4 class="title">Transactions</h4>
                            </div>
                            <div class="card-body align-items-center wrapper">
                                <h3 style="margin-left:15%">Your Credit: ${loginedUser.credit}</h3>
                                <a href=""><h3 style="margin-left:15%"> Click to view your orders </h3></a>
                            </div>
                        </div>
                    </div>
                </div>
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
