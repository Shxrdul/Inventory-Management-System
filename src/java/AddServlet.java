

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


@WebServlet(urlPatterns = {"/AddServlet"})
public class AddServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
        SimpleDateFormat sdf = new SimpleDateFormat("mm/dd/yyyy");
        
            String poser=request.getParameter("poser");
            String asset=request.getParameter("assetList");
            String cat=request.getParameter("catList");
            String make=request.getParameter("make");
            String model=request.getParameter("model");
            String quantity=request.getParameter("quantity");
            String vendor=request.getParameter("vendor");
            String warranty=request.getParameter("warranty");
            String startdate=request.getParameter("startdate");
            String enddate=request.getParameter("enddate");
            
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
            PreparedStatement ms = con.prepareStatement("select * from master_asset where id =?");
            ms.setString(1,asset);
            ResultSet rms = ms.executeQuery();
            rms.next();
            
            
            if(rms.getString("electronic").equals("yes") || rms.getString("serialmaint").equals("yes") ){
                
            PreparedStatement cs = con.prepareStatement("select value from master where attribute ='runpoid'");
            ResultSet rcs = cs.executeQuery();
            PreparedStatement inc = con.prepareStatement("update master set value=value+1 where attribute='runpoid'");
            inc.executeUpdate();
            String id=null;
            if(rcs.next()){
            id = rcs.getString("value");
            }
            
            
            int quant = Integer.parseInt(quantity);
            
            for(int i=1; i<=quant ; i++){
            
            
            PreparedStatement ns = con.prepareStatement("select value from master where attribute ='runserialid'");
            ResultSet rns = ns.executeQuery();
            PreparedStatement ninc = con.prepareStatement("update master set value=value+1 where attribute='runserialid'");
            ninc.executeUpdate();
            String serialid=null;
            if(rns.next()){
            serialid = rns.getString("value");
            }
            
            PreparedStatement ps=con.prepareStatement("insert into poasset values(?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1,id);
            ps.setString(2,poser);
            ps.setString(3,asset);
            ps.setString(4,make);
            ps.setString(5,model);
            ps.setString(6,"1");
            ps.setString(7,vendor);
            ps.setString(8,cat);
            ps.setString(9,warranty);
            ps.setString(10,startdate);
            ps.setString(11,enddate);
            ps.setString(12,serialid);
            ps.executeUpdate();
            
            
            PreparedStatement xs = con.prepareStatement("select locid from location where locname ='Storage'");
            ResultSet rxs = xs.executeQuery();
            String locid=null;
            if(rxs.next()){
            locid = rxs.getString("locid");
            }
            

                
            PreparedStatement ds=con.prepareStatement("insert into asset_alloc values(?,?,?,?,?,?)");
            ds.setString(1,id);
            ds.setString(2,poser);
            ds.setString(3,locid);
            ds.setString(4,asset);
            ds.setString(5,"1");
            ds.setString(6,serialid);
            ds.executeUpdate();
            }
            
            
            
            

            RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
            rd.include(request,response);
            out.println("<div class=\"container\">");
            out.println("<div class=\"row\">");
            out.println("<div class=\"col my-3 text-center\">");
            out.println("<h6 class=\"\" id=\"executed\">*New Asset Recorded</h6>");
            out.println("</div>");
            out.println("</div>");
            out.println("</div>");   
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
            }
            else{
            PreparedStatement cs = con.prepareStatement("select value from master where attribute ='runpoid'");
            ResultSet rcs = cs.executeQuery();
            PreparedStatement inc = con.prepareStatement("update master set value=value+1 where attribute='runpoid'");
            inc.executeUpdate();
            String id=null;
            if(rcs.next()){
            id = rcs.getString("value");
            }
            
            PreparedStatement ns = con.prepareStatement("select value from master where attribute ='runserialid'");
            ResultSet rns = ns.executeQuery();
            PreparedStatement ninc = con.prepareStatement("update master set value=value+1 where attribute='runserialid'");
            ninc.executeUpdate();
            String serialid=null;
            if(rns.next()){
            serialid = rns.getString("value");
            }
            
            
            
            PreparedStatement ps=con.prepareStatement("insert into poasset values(?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1,id);
            ps.setString(2,poser);
            ps.setString(3,asset);
            ps.setString(4,make);
            ps.setString(5,model);
            ps.setString(6,quantity);
            ps.setString(7,vendor);
            ps.setString(8,cat);
            ps.setString(9,warranty);
            ps.setString(10,startdate);
            ps.setString(11,enddate);
            ps.setString(12,serialid);
            ps.executeUpdate();
            
            
            PreparedStatement xs = con.prepareStatement("select locid from location where locname ='Storage'");
            ResultSet rxs = xs.executeQuery();
            String locid=null;
            if(rxs.next()){
            locid = rxs.getString("locid");
            }
            PreparedStatement ds=con.prepareStatement("insert into asset_alloc values(?,?,?,?,?,?)");
            ds.setString(1,id);
            ds.setString(2,poser);
            ds.setString(3,locid);
            ds.setString(4,asset);
            ds.setString(5,quantity);
            ds.setString(6,"N/A");
            ds.executeUpdate();
            RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
            rd.include(request,response);
                    out.println("    <script>\n" +
"        document.getElementById(\"executed\").innerHTML=\"*New Asset Recorded\";\n" +
"    </script>");
            
            
//            out.println("<div class=\"container\">");
//            out.println("<div class=\"row\">");
//            out.println("<div class=\"col my-3 text-center\">");
//            out.println("<h6 class=\"\" id=\"executed\">*New Asset Recorded</h6>");
//            out.println("</div>");
//            out.println("</div>");
//            out.println("</div>");   
//                
            }
            
            
            
            
            
            


            
            
            
        }
        catch(Exception e)
        { out.println(e);}

        

        
       
        
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
