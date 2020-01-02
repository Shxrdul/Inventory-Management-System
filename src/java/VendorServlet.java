

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



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/VendorServlet"})
public class VendorServlet extends HttpServlet {


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
        
            String name=request.getParameter("name");
            String contact=request.getParameter("contact");
            String email=request.getParameter("email");
            String address=request.getParameter("address");

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
            PreparedStatement cs = con.prepareStatement("select value from master where attribute ='runvendorid'");
            ResultSet rcs = cs.executeQuery();
            PreparedStatement inc = con.prepareStatement("update master set value= value +1 where attribute='runvendorid'");
            inc.executeUpdate();
            rcs.next();
            String id = rcs.getString("value");   
            PreparedStatement ps=con.prepareStatement("insert into vendor values(?,?,?,?,?)");
            ps.setString(1,id);
            ps.setString(2,name);
            ps.setString(3,address);
            ps.setString(4,contact);
            ps.setString(5,email);
            ps.executeUpdate();

            RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
            rd.include(request,response);

                    out.println("    <script>\n" +
            "        document.getElementById(\"executed\").innerHTML=\"*New Vendor Added\";\n" +
            "    </script>");
            }  
        catch(Exception e)
        {out.println(e);}

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
