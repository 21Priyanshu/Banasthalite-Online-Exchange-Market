<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="css/sample.css" rel="stylesheet">
    </head>
    <body class="bg">
        <div class="navbar nav">
            <div class="r-navlist nav">
                <div class="ham">
                    <div class="line"></div>
                    <div class="line"></div>
                    <div class="line"></div>
                </div>
               
                <ul>
                    <li>Banasthalite Online Exchange Market</li>
                </ul>
            </div>
            <div class="dropdown nav">
                <button >Login
                </button>
                <div class="dropdown-content">
                  <a href="#">Admin</a>
                  <a href="#">Buyer</a>
                  <a href="#">Seller</a>
                </div>
              </div>
        </div>
        <div class="bg_container">
         <div class="vertical">
                    <ul>
                        <li><a href="AddItem.jsp">Add Item</a></li>
                        <li>Display Item</li>
                        <li>Profile</li>
                        <li>Logout</li>
                    </ul>
         </div>
      
        <div class="display" >
           
               <%
try{
    {
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/priyanshu");
    Statement stmt1=conn.createStatement();
    ResultSet rs=stmt1.executeQuery("select * from item");
    while(rs.next()){%>
    <div class="container">
        <div class="item"><%
           out.print("<img src="+rs.getString(5)+" width='100%' height='200px' alt='Tulips'/>");
           out.print("<p>"+rs.getString(2) +"<p>"); 
           out.print("<p>"+rs.getString(1) +"</p>");
           out.print("<p>"+rs.getString(4) +"</p>");
           out.print("</div");
            }
            out.print("</div>");
    }
}
  catch(Exception ex){
          out.println(ex);
            }
%> 
            
        </div>
        </div>   
    </body>
</html>