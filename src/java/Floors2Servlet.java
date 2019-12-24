/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/Floors2Servlet"})
public class Floors2Servlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        PrintWriter out = response.getWriter();
        int count = 0;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");

           
            
            
            String otherlocs=request.getParameter("otherlocs");
            int oloc= Integer.parseInt(otherlocs);
            for(int i=1; i<=oloc; i++){
                
                String ofno = request.getParameter("ofno"+i);
                String oname = request.getParameter("oname"+i);
                
                
                PreparedStatement cs = con.prepareStatement("select value from master where attribute ='runlocid'");
                ResultSet rcs = cs.executeQuery();
                PreparedStatement inc = con.prepareStatement("update master set value=value+1 where attribute='runlocid'");
                inc.executeUpdate();
                String id=null;
                    if(rcs.next()){
                    id = rcs.getString("value");
                } 
                PreparedStatement rins =con.prepareStatement("insert into location values (?,?,?,?)");
                rins.setString(1,id);
                rins.setString(2,ofno);
                rins.setString(3,oname);
                rins.setString(4,"No");
                rins.executeUpdate();
//                out.println("Inserted 1 rec");
                count++;
            }
            
        }
        catch(Exception e)
        { out.println(e);}
        RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
        rd.include(request,response);
         out.println("    <script>\n" +
"        document.getElementById(\"executed\").innerHTML=\"*"+count+" new locations added\";\n" +
"    </script>");
        
        
        
//        out.println("<div class=\"container\">");
//        out.println("<div class=\"row\">");
//        out.println("<div class=\"col my-3 text-center\">");
//        out.println("<h6 class=\"\" id=\"executed\">*"+count+" new locations added</h6>");
//        out.println("</div>");
//        out.println("</div>");
//        out.println("</div>");
//        
//        
        
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
