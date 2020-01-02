
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>DEFINE ASSET</title>
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
                        <h1 class="align-self-center mx-1">DEFINE ASSET</h1>	
                    </div>		
                </div>
            </div>
        </header>
    <section id="asset">
    <div class="message p-4 height-max">
        <div class="container">    
            <form action="asset" method="post">     
                <div class="row px-3">
                    <div class="col-6 mx-auto my-3">
                        <h6>Asset Name</h6>
                        <input type="text" name="assetName" id="assetName" class="form-control form-control-lg" required>
                    </div>
                </div>       
                <div class="row px-3 justify-content-center">
                    <div class="col-3 my-3">
                        <div id="elect" class="form-check">
                            <h6>Is Electronic ?</h6>
                            <label for="checkYes" class="col-4 mx-auto">
                                <input type="radio" name="isElectronic" id="checkYes" value='yes'onclick="showHideDiv()" checked>Yes
                            </label>
                            <label for="checkNo" class="col-4 mx-auto">
                                <input type="radio" name="isElectronic" id="checkNo" value='no' onclick="showHideDiv()">No
                            </label>
                        </div>
                    </div>
                    <div class="col-3 my-3">
                        <div id='serial-main' class="form-check">
                            <h6>Serial Maintained ?  </h6>  
                            <label for="checkYes" class="col-4 mx-auto">
                                <input type="radio" name="serialMain" id="checkYes1" value='yes' onclick="showHideDiv()" checked>Yes
                            </label>
                            <label for="checkNo" class="col-4 mx-auto">
                                <input type="radio" name="serialMain" id="checkNo1" value='no' onclick="showHideDiv()">No
                            </label> 
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col my-3 text-center">
                        <button type="submit" name="dAsset" class="btn msg-btn">DEFINE</button>
                    </div>
                </div>
            </form>
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
    <script>
        let serialMain = document.getElementById('serial-main');
        let serialNum = document.getElementById('serialNum');
        serialMain.style.display='none';
        serialNum.style.display = 'none';
        function showHideDiv(){
           let checkYes = document.getElementById('checkYes').checked;
           let checkNo = document.getElementById('checkNo').checked;
           serialMain.style.display = checkNo ? 'block' : 'none';
       }      
     </script>
</body>
</html>
