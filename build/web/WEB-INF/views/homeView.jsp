<%-- 
    Document   : homeView
    Created on : Mar 18, 2019, 12:36:01 AM
    Author     : Asus
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
        <style>
        </style>
    </head>
    <body class="index-page">

        <jsp:include page="_menu.jsp"></jsp:include>
            <div class="squares square1"></div>
            <div class="squares square3"></div>
            <div class="squares square4"></div>
            <div class="squares square5"></div>
            <div class="squares square6"></div>
            <div class="squares square7 offset-7"></div>
        <jsp:include page="_header.jsp"></jsp:include> 


            <div class ="">
                <img src="assets/img/path1.png" class="path">
                <div class="container">
                    <div class="section row">
                        <div class="col-xs-3 offset-3">
                            <button class="btn btn-lg btn-success btn-huge" data-toggle="modal" data-target="#myModal2">
                                Login
                            </button>
                        </div>
                        <div class="col-xs-3 offset-1">
                            <a href="register">
                                <button class="btn btn-lg btn-success btn-huge" data-toggle="modal" data-target="#"  >
                                    Register
                                </button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Form Modal -->
            <div class="modal fade modal-black" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header justify-content-center">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                <i class="tim-icons icon-simple-remove text-white"></i>
                            </button>
                            <div class="text-muted text-center ml-auto mr-auto">
                                <h3 class="mb-0">Sign in</h3>
                            </div>
                        </div>
                        <div class="modal-body">
                            <div class="text-center text-muted mb-4 mt-3">
                                <small>Put in your credentials</small>
                            </div>


                            <form role="form" method="POST" action="${pageContext.request.contextPath}/login">
                            <div class="form-group mb-3">
                                <div class="input-group input-group-alternative">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="tim-icons icon-email-85"></i>
                                        </span>
                                    </div>
                                    <input class="form-control" placeholder="Username" type="username" name="userName">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group input-group-alternative">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="tim-icons icon-key-25"></i>
                                        </span>
                                    </div>
                                    <input class="form-control" placeholder="Password" type="password" name="password">
                                </div>
                            </div>
                            <div class="form-check mt-3">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox" checked>
                                    <span class="form-check-sign"></span>
                                    Remember me!
                                </label>
                            </div>


                            <div class="text-center">
                                <input type="submit" value ="Sign in" class="btn btn-primary my-4"></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="_footer.jsp"></jsp:include>


        <!--  End Modal -->
        <!-- Core -->
        <script src="assets/js/core/jquery.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <!-- Theme JS -->

        <script src="assets/js/blk-design-system.min.js"></script>
    </body>

</html>
