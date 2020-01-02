<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<%String elect = null;%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MOVE ASSET</title>
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
                        <h1 class="align-self-center mx-1">MOVE ASSET</h1>	
                    </div>		
                </div>
            </div>
        </header>
    <div class="height-max">
    <form action='moveInt' method="post">
    <div class="container">
        <div class="row px-3 justify-content-center">
            <div class="col-4 my-3">
                <h6>Asset</h6>
                <select class="form-control" name="assetList" id="assetList" required>
                    <option value="" disabled selected>Select Asset</option>
                    <%
                        try{
                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
                            PreparedStatement ps = con.prepareStatement("select * from asset_alloc");
                            ResultSet rs = ps.executeQuery();
                    %>
                    <%  while(rs.next()){ 
                        PreparedStatement cs = con.prepareStatement("select name from master_asset where id="+rs.getString("assetid"));
                        ResultSet rcs = cs.executeQuery();
                        rcs.next();   
                        PreparedStatement xs = con.prepareStatement("select locname from location where locid="+rs.getString("locid"));
                        ResultSet rxs = xs.executeQuery();
                        rxs.next();
                    %>
                    <option value="<%= rs.getString("poid")%>,<%= rs.getString("serialid")%>,<%= rs.getString("locid")%>" ><%= rxs.getString("locname")+": "+rcs.getString("name")+" ("+rs.getString("quantity")+") - " +rs.getString("serialid") %></option>
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
            <div class="col-1 my-auto">
                <button type="button"  id='btn1' onclick='display(event)' class="btn msg-btn">Next</button>
            </div>
        </div>
    </div>
    <div class="container" id='container' style="display: none;">
        <div class="row px-3 justify-content-center">
            <div class="col-4 my-3" id="locListDiv" >
                <h6>To Tocation</h6>
                <select class="form-control" name="locList" id='locList' required>
                    <option value="" disabled selected>Select Location</option>
                    <%
                        try{
                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
                            PreparedStatement ps = con.prepareStatement("select * from location ");
                            ResultSet rs = ps.executeQuery();
                    %>
                    <%  while(rs.next()){ %>
                    <option value="<%= rs.getString("locid")%>" ><%= rs.getString("locname")%></option>
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
                
<!--            <div class="col-4 mx-auto my-3" id="serialDiv" ">
                <input type="text" name="serial" id='serial' class="form-control form-control-lg" placeholder="Serial" >
            </div>-->
        <div class="row px-3 justify-content-center">   
            <div class="col-4 my-3" id="quantityDiv">
                <h6>Quantity</h6>
                <input type="text" name="quantity" id='quantity' class="form-control form-control-lg" required>
            </div>
        </div>
        <div class="row px-3 justify-content-center">
            <div class="my-auto">
                <button type="submit"  id='btn2'  class="btn msg-btn">Done</button>
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
        function display(event){
            event.preventDefault();
                document.getElementById('btn1').disabled=true;
                let asset = document.getElementById("assetList");
                let poid = asset.options[asset.selectedIndex].value;
                let serial = document.getElementById("serial");
                let container = document.getElementById("container");
                container.style.display="block";   
                
                
        
        }

    </script>

    </body>
</html>
