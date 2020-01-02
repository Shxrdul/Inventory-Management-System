<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LOGIN</title>
         <!--Bootstrap CSS-->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!--main CSS-->
        <link rel="stylesheet" href="css/main.css">
    </head>
    <body>
        <header class="header" id="header">
            <div class="container"> 
                <div class="d-flex justify-content-center py-5"> 
                    <div class="col-sm-6 col-lg-12 text-center my-3">
                        <h1 class="align-self-center mx-1">LOGIN</h1>	
                    </div>		
                </div>
            </div>
        </header>
<!--        <form action="servlet1" method="post">
            Name:<input type="text" name="username"/><br/><br/>
            Password:<input type="password" name="userpass"/><br/><br/>
        <input type="submit" value="login"/>
        </form>-->
        
        <section id="message">
            <div class="message p-4 height-max">
                <div class="container">
                <form action="login" method="post">
                    <div class="row px-3">
                        <div class="col-6 mx-auto my-3">
                            <h6>Username</h6>
                            <input type="text" id="name" name="username" class="form-control form-control-lg" required>
                        </div>
                    </div>
                        <div class="col-6 mx-auto my-3">
                            <h6>Password</h6>
                            <input type="password" id="pass" name="userpass" class="form-control form-control-lg" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col my-3 text-center">
                            <button type="submit" name="LOGIN" class="btn msg-btn">LOGIN</button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
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



