<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
try{
    {
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/priyanshu");
    Statement stmt1=conn.createStatement();
    ResultSet rs=stmt1.executeQuery("select * from item");
    while(rs.next()){
           out.println("<div>");
           out.print("<img src="+rs.getString(5)+" width='102' height='76' alt='Tulips'/>");
           out.print("<p>"+rs.getString(2) +"<p>"); 
           out.print("<p>"+rs.getString(1) +"</p>");
           out.print("<p>"+rs.getString(4) +"</p>");
          
            out.print("</div>");
            }

        out.println("</body></html>");

    }
}
  catch(Exception ex){
          out.println(ex);
            }
%> 
    </body>
</html>
