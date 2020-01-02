<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<%String elect = null;%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>NEW VENDOR</title>
         <!--Bootstrap CSS-->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!--main CSS-->
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css"> 
    </head>
    <body>
       <header class="header" id="header">
            <div class="container"> 
                <div class="d-flex justify-content-center py-5"> 
                    <div class="col-sm-6 col-lg-12 text-center my-3">
                        <h1 class="align-self-center mx-1">NEW VENDOR</h1>	
                    </div>		
                </div>
            </div>
        </header>
        <div class='height-max'>
        <form action='vendor' method="post">
            <div class="container">
                <div class="row px-3 justify-content-center">
                    <div class="col-6 my-3">
                        <h6>Name</h6>
                        <input type="text" name="name" id="name" class="form-control form-control-lg" required>
                    </div>
                </div>
                <div class="row px-3 justify-content-center">
                    <div class="col-6 my-3">
                        <h6>Contact</h6>
                        <input type="text" name="contact" id="contact" class="form-control form-control-lg" required>
                    </div>
                </div>
                <div class="row px-3 justify-content-center">
                    <div class="col-6 my-3">
                        <h6>Email</h6>
                        <input type="text" name="email" id="email" class="form-control form-control-lg" required>
                    </div>
                </div>
                <div class="row px-3 justify-content-center">
                    <div class="col-6 my-3">
                        <h6>Address</h6>
                        <textarea rows="5" name="address" id="address" class="form-control form-control-lg"></textarea>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-2 my-3 text-center">
                        <button type="submit" name="addVendor" class="btn msg-btn">Add Vendor</button>
                    </div>
                </div>
            </div>                 
        </form>
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
