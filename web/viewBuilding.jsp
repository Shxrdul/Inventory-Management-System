<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>VIEW BUILDING</title>
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
                        <h1 class="align-self-center mx-1">VIEW BUILDING</h1>	
                    </div>		
                </div>
            </div>
        </header>
        <div class="message p-4 height-max">
            <div class="container">
                <table id="dtBasicExample" class="table table-hover table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>FLOOR</th>
                            <th>ID</th>
                            <th>LOCATION</th>
                            <th>ROOM TYPE</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try{
                                Class.forName("oracle.jdbc.driver.OracleDriver");
                                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
                                PreparedStatement ps = con.prepareStatement("select * from location");
                                ResultSet rs = ps.executeQuery();
                                while(rs.next()){ 
//                                PreparedStatement cs = con.prepareStatement("select count(*) as cnt from location where floorno="+rs.getString("floorno"));
//                                ResultSet rcs = cs.executeQuery();
//                                rcs.next(); 
                        %>
                        <tr>
                            <td><%= rs.getString("floorno")%></td> 
                            <td><%= rs.getString("locid")%></td> 
                            <td><%= rs.getString("locname")%></td>
                            <td><%= rs.getString("roomtype")%></td>                
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
                <br><br>
                <div class="col my-auto">
                    <button type="button" id='btn1' data-toggle="modal" data-target="#myModal" class="btn msg-btn">Add other Locations</button>

                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog modal-lg">
                          <div class="modal-content">
                            <div class="modal-header ">
                              <h4 class="modal-title">Add other Locations</h4>
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                              
                            </div>
                            <form action="floors2" method="post">
                                <div class="modal-body">
                                    <div class="col-3 my-3">
                                        <input type="text" name="otherlocs" id='otherLocCnt' class="form-control form-control-lg" placeholder="No. of Locations" required>
                                    </div>
                                    <div class="col my-auto">
                                        <button type="button" id='btn2' class="btn msg-btn">Next</button>
                                    </div>                 
                                    <div id="oTable"></div>
                                    <div class="col my-auto" id="done" style="display: none;">
                                        <button type="submit" id='btn3' class="btn msg-btn">Done</button>
                                    </div>
                                </div>        
                            </form>
                          </div>
                        </div>
                    </div>
                </div>
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
            let otherLoc = document.getElementById('btn2');
            otherLoc.addEventListener('click',function (){
                row=Number(document.getElementById('otherLocCnt').value);
                document.getElementById('otherLocCnt').readOnly=true;
                document.getElementById('btn2').disabled=true;
                console.log(row);

                flrcnt=3;
                let select = document.createElement('select');
                select.className="form-control";
                select.name="ofno0";
                for(let i=0;i<=flrcnt;i++){
                    let option = document.createElement('option');
                    if(i===0){
                        option.value="GRND";
                        option.innerHTML="GRND";
                    }else{
                        option.value=i;
                        option.innerHTML=i;
                    }
                    select.appendChild(option);
                }


                let table = document.createElement('table');
                table.className = 'table';
                table.style.width = 'auto';
                let thead=document.createElement('thead');
                thead.className = 'thead-inverse';
                thead.innerHTML='<td>Floor No.</td><td>Name</td>';
                table.appendChild(thead);
                
                for(let i=1;i<=row;i++){
                    let select = document.createElement('select');
                    select.className="form-control";
                    select.name="ofno"+i;
                    for(let i=0;i<=flrcnt;i++){
                        let option = document.createElement('option');
                        if(i===0){
                            option.value="GRND";
                            option.innerHTML="GRND";
                        }else{
                            option.value=i;
                            option.innerHTML=i;
                        }
                        select.appendChild(option);
                    }




                    let tr=document.createElement('tr');
                    let td1=document.createElement('td');
                    td1.appendChild(select);
                    tr.appendChild(td1);
                    let td2=document.createElement('td');
                    td2.innerHTML='<input name="oname'+i+'" type="text" class="col form-control"  required/>';
                    tr.appendChild(td2);

                    table.appendChild(tr);
                    console.log(tr);
                }

                let oTable = document.getElementById('oTable');
                oTable.innerHTML = '';
                oTable.appendChild(table);
                document.getElementById('done').style.display="block";
            });
        </script>
    </body>
</html>
