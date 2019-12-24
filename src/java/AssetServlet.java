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

/**
 *
 * @author Shardul
 */
@WebServlet(urlPatterns = {"/asset"})
public class AssetServlet extends HttpServlet {

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
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String name=request.getParameter("assetName");
        String elect=request.getParameter("isElectronic");
        String maint=request.getParameter("serialMain");
        
        try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
        
        PreparedStatement xs = con.prepareStatement("select * from master_asset where name =?");
        xs.setString(1,name);
        ResultSet rxs = xs.executeQuery();
        String locid=null;
        if(rxs.next()){
        RequestDispatcher rd=request.getRequestDispatcher("asset.jsp");
        rd.include(request,response);
        out.println("<div class=\"container\">");
        out.println("<div class=\"row\">");
        out.println("<div class=\"col my-3 text-center\">");
        out.println("<h6 class=\"\" id=\"executed\">*Asset Already Defined</h6>");
        out.println("</div>");
        out.println("</div>");
        out.println("</div>");   
        }
        else{
            
  
        PreparedStatement cs = con.prepareStatement("select value from master where attribute ='runassetid'");
        ResultSet rcs = cs.executeQuery();
        PreparedStatement inc = con.prepareStatement("update master set value= value +1 where attribute='runassetid'");
        inc.executeUpdate();
        rcs.next();
        String id = rcs.getString("value");   
        PreparedStatement ps=con.prepareStatement("insert into master_asset values(?,?,?,?)");
        ps.setString(1,id);
        ps.setString(2,name);
        ps.setString(3,elect);
        ps.setString(4,maint);
        ps.executeUpdate();
        
        RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
        rd.include(request,response);
        
        out.println("    <script>\n" +
"        document.getElementById(\"executed\").innerHTML=\"*New Asset Inserted\";\n" +
"    </script>");
        
        
//        out.println("<div class=\"container\">");
//        out.println("<div class=\"row\">");
//        out.println("<div class=\"col my-3 text-center\">");
//        out.println("<h6 class=\"\" id=\"executed\">*New Asset Inserted</h6>");
//        out.println("</div>");
//        out.println("</div>");
//        out.println("</div>");  
//        
        }       
        }  
        catch(Exception e)
        {out.println(e);}
        
 
  
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
