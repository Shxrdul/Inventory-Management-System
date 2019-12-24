<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<%String elect = null;%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ADD ASSET</title>
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
                        <h1 class="font-weight-bolder align-self-center mx-1">ADD ASSET</h1>	
                    </div>		
                </div>
            </div>
        </header>
        <div class='height-max'>
        <form action='add' method="post">
            <div class="container">
                <div class="row px-3 justify-content-center">
                    <div class="col-3 my-3">
                        <input type="text" name="poser" id="poser" class="form-control form-control-lg" placeholder="PO Serial" required>
                    </div>
<!--                    <div class="col-3 my-auto">
                         <input type="text" name="poname" id="poname" class="form-control form-control-lg" placeholder="PO Name" required>
                    </div>-->

                    <div class="col-3 my-3">
                        <select class="form-control" name="assetList" id='assetList'>
                            <option value="" disabled selected>Select Asset</option>
                            <%
                                try{
                                    Class.forName("oracle.jdbc.driver.OracleDriver");
                                    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
                                    PreparedStatement ps = con.prepareStatement("select * from master_asset");
                                    ResultSet rs = ps.executeQuery();
                            %>
                            <%  while(rs.next()){ %>
                            <option value="<%= rs.getString("id")%>" ><%= rs.getString("id")+" - "+rs.getString("name")%></option>
                            <% } %>
                            <%
                                }
                                catch(Exception e)
                                {
                                     out.println(e);
                                }
                            %>
                        </select>   
                    </div>
                </div>
                <div class="row px-3 justify-content-center">
                        
                    <div class="col-3 my-auto">
                         <select class="form-control" name="catList" id='catList'>
                            <option value="" disabled selected>Select Category</option>
                            <option value="capital">Capital</option>
                            <option value="revenue">Revenue</option>
                            <option value="N/A">N/A</option>
                        </select>
                    </div>

                    <div class="col-3 my-3">
                        <input type="text" name="make" id="make" class="form-control form-control-lg" placeholder="Make" required>
                    </div>
                </div>
                <div class="row px-3 justify-content-center">
                    <div class="col-3 my-auto">
                         <input type="text" name="model" id="model" class="form-control form-control-lg" placeholder="Model" required>
                    </div>

                    <div class="col-3 my-3">
                        <input type="text" name="quantity" id="quantity" class="form-control form-control-lg" placeholder="Quantity" required>
                    </div>
                </div>
                <div class="row px-3 justify-content-center">
                    <div class="col-3 my-auto">
                         <input type="text" name="vendor" id="vendor" class="form-control form-control-lg" placeholder="Vendor" required>
                    </div>
                    <div class="col-3 my-3">
                        <select class="form-control" name="warranty" id='warranty'>
                            <option value="" disabled selected>Status?</option>
                            <option value="In Warranty">In Warranty</option>
                            <option value="In AMC">In AMC</option>
                            <option value="Out of Warranty">Out of Warranty</option>
                            <option value="Out of Warranty">N/A</option>
                        </select>
                    </div>
<!--                    <div class="col-3 my-auto">
                         <select class="form-control" name="amc" id='amc'>
                            <option value="" disabled selected>In AMC ?</option>
                            <option value="yes">Yes</option>
                            <option value="no">No</option>
                            <option value="N/A">N/A</option>
                        </select>
                    </div>-->
                </div>
                <div class="row justify-content-center" id="date"">
                    <div class="col-3 my-3">
                        <input class="form-control" type="date" name='startdate' placeholder="Start Date" >
                    </div>
                    <div class="col-3 my-auto">
                         <input class="form-control" type="date" name='enddate' placeholder="End Date" >
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-2 my-3 text-center">
                        <button type="submit" name="addAsset" class="btn msg-btn">Add Asset</button>
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
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                
               date.style.display='none';
                
                
                
            });
            let warranty = document.getElementById('warranty');
            let amc = document.getElementById('amc');
            let date = document.getElementById('date');

            warranty.addEventListener('click',function(){
                if(warranty.options[warranty.selectedIndex].value === 'In Warranty'){
                    date.style.display='block';
                } else if(warranty.options[warranty.selectedIndex].value === 'In AMC'){
                    date.style.display='block';
                } else {
                    date.style.display='none';
                }
            });
        </script>
    </body>
</html>
