<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>VIEW ASSSET</title>
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
                        <h1 class="font-weight-bolder align-self-center mx-1">VIEW ASSETS</h1>	
                    </div>		
                </div>
            </div>
        </header>
        <div class="p-4 height-max">
            <div class="row justify-content-center my-4">
                <table id="dtBasicExample" class="table table-hover table-bordered justify-content-center" cellspacing="0">
                    <thead>
                        <tr>
                            <th>PO ID</th>
                            <th>PO SERIAL</th>
                            <th>ASSET</th>
                            <th>MAKE</th>
                            <th>MODEL</th>
                            <th>QUANTITY</th>
                            <th>VENDOR</th>
                            <th>CATEGORY</th>
                            <th>WARRANTY</th>
                            <th>START DATE</th>
                            <th>END DATE</th>        
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try{
                                Class.forName("oracle.jdbc.driver.OracleDriver");
                                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
                                PreparedStatement ps = con.prepareStatement("select * from poasset");
                                ResultSet rs = ps.executeQuery();
                                while(rs.next()){ 
//                                PreparedStatement cs = con.prepareStatement("select locname from location where locid="+rs.getString("locid"));
//                                ResultSet rcs = cs.executeQuery();
//                                rcs.next(); 
                                PreparedStatement ds = con.prepareStatement("select name from master_asset where id="+rs.getString("assetid"));
                                ResultSet rds = ds.executeQuery();
                                rds.next();
//                                PreparedStatement xs = con.prepareStatement("select poname from poasset where poid="+rs.getString("poid"));
//                                ResultSet rxs = xs.executeQuery();
//                                rxs.next();
                        %>
                            <td><%= rs.getString("poid")%></td>
                            <td><%= rs.getString("poser")%></td>
                            <td><%= rs.getString("assetid")%> - <%= rds.getString("name")%></td>
                            <td><%= rs.getString("make")%></td>
                            <td><%= rs.getString("model")%></td>
                            <td><%= rs.getString("quantity")%></td>
                            <td><%= rs.getString("vendor")%></td>
                            <td><%= rs.getString("category")%></td>
                            <td><%= rs.getString("warstatus")%></td>
                            <td><%= rs.getString("startdate")%></td>
                            <td><%= rs.getString("enddate")%></td>                           
                        </tr>
                        <%       } 
                            }
                            catch(Exception e)
                            {
                                 out.println(e);
                            }
                        %>  
                    </tbody>
                </table>
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
        <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
        <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
            <script>
            $(document).ready(function () {
                $('#dtBasicExample').DataTable();
                $('.dataTables_length').addClass('bs-select');
            });
        </script>
    </body>
</html>
