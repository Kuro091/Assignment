<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
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


    </head>
    <body class="landing-page">

        <br/><br/><br/><br/><br/><br/><br/>
        <jsp:include page="_menu.jsp"></jsp:include>
            <div class="wrapper">
                <div class="page-header">
                    <img src="assets/img/blob.png" class="path">
                    <img src="assets/img/path2.png" class="path2">
                    <img src="assets/img/triunghiuri.png" class="shapes triangle">
                    <img src="assets/img/waves.png" class="shapes wave">
                    <img src="assets/img/patrat.png" class="shapes squares">
                    <img src="assets/img/cercuri.png" class="shapes circle">
                    <div class="container">
                        <h3 class="alert alert-info">${message}</h3>
                    <a href="addCredit"><button class="btn btn-info float-left offset-3">Nạp tiền</button></a>

                    <form method="post" action="cancelorder">
                        <input type ="hidden" name="receiptid" value="${receipt.getReceiptID()}" >
                        <input type ="hidden" name="matchid" value="${matchid}" >
                        <input class="btn btn-danger float-left offset-6" type ="submit" value="Hủy">
                    </form>
                    <a href="index"><button class="btn btn-info float-left offset-12">Homepage</button></a>
                </div>
            </div>
            <jsp:include page="_footer.jsp"></jsp:include>

    </body>
</html>
