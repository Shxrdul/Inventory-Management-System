import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
                    throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String n=request.getParameter("username");
        String p=request.getParameter("userpass");
        int status = LoginDao.validate(n, p);
        if(status == -1){
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
            rd.include(request,response);
            
                     out.println("    <script>\n" +
"        document.getElementById(\"executed\").innerHTML=\"*incorrect Username or password\";\n" +
"    </script>");
        
//            out.println("<div class=\"container\">");
//            out.println("<div class=\"row\">");
//            out.println("<div class=\"col my-3 text-center\">");
//            out.println("<h6 class=\"\" id=\"invalid\">*incorrect Username or password</h6>");
//            out.println("</div>");
//            out.println("</div>");
//            out.println("</div>");   
        }
        else if(status == 1){
            RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
            rd.forward(request,response);
        }
        else if(status == 2){
            RequestDispatcher rd=request.getRequestDispatcher("Supervisor.jsp");
            rd.forward(request,response);
        }
        else if(status == 3){
            RequestDispatcher rd=request.getRequestDispatcher("User.jsp");
            rd.forward(request,response);
        }
        out.close();
    }
}
