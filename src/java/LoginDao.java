import java.sql.*;

public class LoginDao {

public static int validate(String name,String pass){
int status = -1;
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");

    PreparedStatement ps=con.prepareStatement("select * from userreg where name=? and pass=?");
    ps.setString(1,name);
    ps.setString(2,pass);

    ResultSet rs=ps.executeQuery();
    if(rs.next()) {
            int type=rs.getInt("roleid");
            return type;    
    }
}  
catch(Exception e)
{System.out.println(e);}
return status;
}
}