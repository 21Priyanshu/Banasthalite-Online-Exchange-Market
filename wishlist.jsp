<%-- 
    Document   : b_index
    Created on : 1 Apr, 2021, 3:54:05 PM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>wishlist</title>
        <link href="css/sample.css" rel="stylesheet">
    </head>
    <body>
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
                  <a href="#">Seller</a>
                </div>
              </div>
        </div>
        <div class="bg_container">
         <div class="vertical">
                    <ul>
                        <li><a href="b_index.jsp">Display Item</li>
                        <li><a href="wishlist.jsp">Wishlist</a></li>
                        <li>Profile</li>
                        <li>Logout</li>
                    </ul>
         </div>
        <div class="display" >
            <%
                   String u=session.getAttribute("userId").toString();
                try{
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/project");
                    Statement stmt1=conn.createStatement();
                    ResultSet rs=stmt1.executeQuery("select * from item where itemid in(select itemid from wishlist where uid='"+u+"')");
                    while(rs.next()){%>
                        <div class="container">
                        <div class="item">
                            <div class="img">
                            <%
                           out.print("<img src="+rs.getString(4)+" width='100%' height='100%' alt='Tulips'/>");
                           %>
                            </div>
                            <div>
                            <%
                           out.print("<p>"+rs.getString(2) +"<p>"); 
                           out.print("<p>"+rs.getString(6) +"</p>");
                           out.print("<p>"+rs.getString(5) +"</p>");
                            %>
                            </div>
                            
                    <%}%>
        </div>
            </div>
            <%
    }
  catch(Exception ex){
          out.println(ex);
            }
%> 
            
        </div>
        </div>   
    </body>
</html>
