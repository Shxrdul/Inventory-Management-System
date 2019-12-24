<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>DISCARD ASSET</title>
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
                        <h1 class="font-weight-bolder align-self-center mx-1">DISCARD ASSET</h1>	
                    </div>		
                </div>
            </div>
        </header>
    <div class="height-max">
    <form action='discard' method="post">
    <div class="container">
        <div class="row px-3 justify-content-center">
            <div class="col-3 my-3">
                <select class="form-control" name="assetList" id="assetList" required>
                    <option value="" disabled selected>Select Asset</option>
                    <%
                        try{
                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
                            
                            PreparedStatement xs = con.prepareStatement("select locid from location where locname ='Storage'");
                            ResultSet rxs = xs.executeQuery();
                            rxs.next();
                            String locid=rxs.getString("locid");
                            PreparedStatement ps = con.prepareStatement("select * from asset_alloc where locid=?");
                            ps.setString(1,locid);
                            ResultSet rs = ps.executeQuery();
                    %>
                    <%  while(rs.next()){ 
                        PreparedStatement cs = con.prepareStatement("select name from master_asset where id="+rs.getString("assetid"));
                        ResultSet rcs = cs.executeQuery();
                        rcs.next();                   
                    %>
                    <option value="<%= rs.getString("poid")%>,<%= rs.getString("serialid")%>,<%= rs.getString("locid")%>" ><%= rs.getString("poid")+" - "+rcs.getString("name")+" ("+rs.getString("quantity")+") - " +rs.getString("serialid") %></option>
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
            <div class="col-1 my-auto">
                <button type="button"  id='btn1' onclick='display(event)' class="btn msg-btn">Next</button>
            </div>
        </div>                  
    </div>
    <div class="container" id='container' style="display: none;">
        
        <div class="row px-3 justify-content-center">   
            <div class="col-4 my-3" id="quantityDiv">
                <input type="text" name="quantity" id='quantity' class="form-control form-control-lg" placeholder="Quantity" required>
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
