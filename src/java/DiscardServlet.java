
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


@WebServlet(urlPatterns = {"/DiscardServlet"})
public class DiscardServlet extends HttpServlet {

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
        

        String arr=request.getParameter("assetList");

        
        String[] values = arr.split(","); 
        
        String poid =  values[0];
        String serialid = values[1];
        String locid = values[2]; 
            //Storage always


        String quantity =request.getParameter("quantity");
        
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
//            PreparedStatement ps = con.prepareStatement("select * from poasset where poid=?");
//            ps.setString(1,poid);
//            ResultSet rs = ps.executeQuery();
//            rs.next();
//            String poser = rs.getString("poser");
//            String assetid = rs.getString("assetid");
            
//            PreparedStatement cs = con.prepareStatement("select locid from location where locname ='Storage'");
//            ResultSet rcs = cs.executeQuery();
//            rcs.next();
//            String locid=rcs.getString("locid");
            
            
//            PreparedStatement ds = con.prepareStatement("select * from asset_alloc where poid=?");
//            ds.setString(1,poid);
//            ResultSet rds = ds.executeQuery();
//            rds.next();
//            
//            if(quantity.equals(rds.getString("quantity")))
//            {
//                PreparedStatement xs = con.prepareStatement("delete from asset_alloc where poid=? and locid=? ");
//                xs.setString(1,poid);
//                xs.setString(2,locid);
//                xs.executeUpdate();
//            }
//            else
//            {
//                PreparedStatement xs = con.prepareStatement("update asset_alloc set quantity = quantity - "+Integer.parseInt(quantity) +" where poid=?");
//                xs.setString(1,poid);
//                xs.executeQuery();            
//            }
            
            
            
            
            
            PreparedStatement ds = con.prepareStatement("select * from asset_alloc where poid=? and serialid=? and locid=?");
            ds.setString(1,poid);
            ds.setString(2,serialid);
            ds.setString(3,locid);
            ResultSet rds = ds.executeQuery();
            rds.next();
            String poser = rds.getString("poser");
            String assetid = rds.getString("assetid");
            
            if(quantity.equals(rds.getString("quantity")))
            {
                PreparedStatement xs = con.prepareStatement("delete from asset_alloc where poid=? and serialid=? and locid=?");
                xs.setString(1,poid);
                xs.setString(2,serialid);
                xs.setString(3,locid);
                xs.executeUpdate();
            }
            else
            {
                PreparedStatement xs = con.prepareStatement("update asset_alloc set quantity = quantity - "+Integer.parseInt(quantity) +" where poid=? and serialid=? and locid=?");
                xs.setString(1,poid);
                xs.setString(2,serialid);
                xs.setString(3,locid);
                xs.executeQuery();            
            }
            
            
            
            PreparedStatement ps = con.prepareStatement("select * from asset_discard where poid=? and serialid=?");
            ps.setString(1,poid);
            ps.setString(2,serialid);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                PreparedStatement cs = con.prepareStatement("update asset_discard set quantity = quantity + "+Integer.parseInt(quantity) +" where poid=? and serialid=?");
                cs.setString(1,poid);
                cs.setString(2,serialid);
                cs.executeQuery(); 
            }
            else{
                PreparedStatement cs = con.prepareStatement("insert into asset_discard values (?,?,?,?,?)");
                cs.setString(1,poid);
                cs.setString(2,poser);
                cs.setString(3,assetid);
                cs.setString(4,quantity);
                cs.setString(5,serialid);
                cs.executeUpdate();
                
                }
    
            
            
            
            
            
            
            
           
            }
        catch(Exception e)
        { out.println(e);}
         RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
        rd.include(request,response);
         out.println("    <script>\n" +
"        document.getElementById(\"executed\").innerHTML=\"*Asset Discarded\";\n" +
"    </script>");
        
//        out.println("<div class=\"container\">");
//        out.println("<div class=\"row\">");
//        out.println("<div class=\"col my-3 text-center\">");
//        out.println("<h6 class=\"\" id=\"executed\">*Asset Discarded</h6>");
//        out.println("</div>");
//        out.println("</div>");
//        out.println("</div>");  
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
