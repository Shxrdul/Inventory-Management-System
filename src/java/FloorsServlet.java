/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/FloorsServlet"})
public class FloorsServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        PrintWriter out = response.getWriter();
        int count = 0;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");

            String floors=request.getParameter("floors");
//            out.println(floors);
            int flr= Integer.parseInt(floors);
            PreparedStatement ps=con.prepareStatement("update master set value=? where attribute=?");
            ps.setString(1,floors);
            ps.setString(2,"floors");
            ps.executeUpdate();
                  
            for(int i=0; i<=flr; i++){
                
                String fno = request.getParameter("fno"+i);
                
                String rcnt = request.getParameter("rcnt"+i);
                int r = Integer.parseInt(rcnt);
                
                for(int j=1; j<=r; j++){
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
                    rins.setString(2,fno);
                    rins.setString(3,"R"+i+"0"+j);
                    rins.setString(4,"Yes");
                    rins.executeUpdate();
//                    out.println("Inserted 1 rec");
                    count++;
                }
                
                String hcnt = request.getParameter("hcnt"+i);
                int h = Integer.parseInt(hcnt);
                for(int j=1; j<=h; j++){
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
                    rins.setString(2,fno);
                    rins.setString(3,"H"+i+j);
                    rins.setString(4,"No");
                    rins.executeUpdate();
//                    out.println("Inserted 1 rec");
                    count++;
                }
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
        
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
