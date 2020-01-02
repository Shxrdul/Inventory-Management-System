<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PANEL</title>
         <!--Bootstrap CSS-->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!--main CSS-->
        <link rel="stylesheet" href="css/main.css">
        <!--Font-awesome-->
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">

    </head>
    <body>
       <header class="header" id="header">
        <div class="container"> 
            <div class="d-flex justify-content-center py-5"> 
                <div class="col-sm-6 col-lg-3 text-center my-3">
                    <h1 class="align-self-center mx-1">SUPERVISOR</h1>	
                </div>		
            </div>
        </div>
    </header>
    <div class="container height-max" >
        <div class="row p-4">
            <a class=" col-12 col-md-3 p-4" href="move.jsp">
                <div class="check-card justify-content-center text-center p-2">
                    <div class="check-icon p-2 rounded-circle">
                        <i class="far fa-flag"></i>
                    </div>
                    <h6 class="font-weight-bold my-3" style="color:white">MOVE ASSET</h6>
                    <div class="brand-underline"></div>
                </div>
            </a>
            <a class=" col-12 col-md-3 p-4" href="viewBuilding.jsp">
                <div class="check-card justify-content-center text-center p-2">
                    <div class="check-icon p-2 rounded-circle">
                        <i class="far fa-flag"></i>
                    </div>
                    <h6 class="font-weight-bold my-3" style="color:white">VIEW BUILDING</h6>
                    <div class="brand-underline"></div>
                </div>
            </a>
            <a class=" col-12 col-md-3 p-4" href="viewAsset.jsp">
                <div class="check-card justify-content-center text-center p-2">
                    <div class="check-icon p-2 rounded-circle">
                        <i class="far fa-flag"></i>
                    </div>
                    <h6 class="font-weight-bold my-3" style="color:white">VIEW ASSETS</h6>
                    <div class="brand-underline"></div>
                </div>
            </a>
            <a class=" col-12 col-md-3 p-4" href="allocation.jsp">
                <div class="check-card justify-content-center text-center p-2">
                    <div class="check-icon p-2 rounded-circle">
                        <i class="far fa-flag"></i>
                    </div>
                    <h6 class="font-weight-bold my-3" style="color:white">ALLOCATION</h6>
                    <div class="brand-underline"></div>
                </div>
            </a>
        </div>
    </div>
        <footer class="footer py-3">
            <div class="footer-text col-12 d-flex justify-content-center my-2">
                    DEVELOPED FOR
            </div>
            <div class="footer-text col-12 d-flex justify-content-center my-2">
                    INDIAN OIL CORPOROTION 2019
            </div>
	</footer>
    </body>
</html>
