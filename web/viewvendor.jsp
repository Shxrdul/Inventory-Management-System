<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>VIENDOR DETAILS</title>
         <!--Bootstrap CSS-->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!--main CSS-->
        <link rel="stylesheet" href="css/main.css"> 
        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <header class="header" id="header">
            <div class="container"> 
                <div class="d-flex justify-content-center py-5"> 
                    <div class="col-sm-6 col-lg-12 text-center my-3">
                        <h1 class="align-self-center mx-1">VENDOR DETAILS</h1>	
                    </div>		
                </div>
            </div>
        </header>
        <div class="message p-4 height-max">
            <div class="container">
                <table id="dtBasicExample" class="table table-hover table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>NAME</th>
                            <th>ADDRESS</th>
                            <th>CONTACT</th>
                            <th>EMAIL</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try{
                                Class.forName("oracle.jdbc.driver.OracleDriver");
                                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
                                PreparedStatement ps = con.prepareStatement("select * from vendor");
                                ResultSet rs = ps.executeQuery();
                                while(rs.next()){ 
//                                PreparedStatement cs = con.prepareStatement("select count(*) as cnt from location where floorno="+rs.getString("floorno"));
//                                ResultSet rcs = cs.executeQuery();
//                                rcs.next(); 
                        %>
                        <tr>
                            <td><%= rs.getString("id")%></td> 
                            <td><%= rs.getString("name")%></td> 
                            <td><%= rs.getString("address")%></td>
                            <td><%= rs.getString("contact")%></td>
                            <td><%= rs.getString("email")%></td>
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
