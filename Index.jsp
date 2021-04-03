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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    
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
                  <a href="#">Buyer</a>
                </div>
              </div>
        </div>
        <div class="bg_container">
         <div class="vertical">
                    <ul>
                        <li><a href="AddItem.jsp">Add Item</a></li>
                        <li>Display Item</li>
                        <li>Profile</li>
                        <li><a href="Logout.jsp">Logout</a></li>
                    </ul>
         </div>
        <div class="display" >
            <div class="row row-cols-2 row-cols-xl-4 g-4" >
     <%
                   String u=session.getAttribute("userId").toString();
                try{
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/priyanshu");
                    Statement stmt1=conn.createStatement();
                    ResultSet rs=stmt1.executeQuery("select * from item1 where uid='"+u+"'");
                    while(rs.next()){%>
  <div class="col ">
    <div class="card h-100 mt-2">
        <% 
                           out.print("<img src="+rs.getString(4)+" width='' height='50%' alt='Tulips'/>");
       %>
        <div class="card-body">
        <h5 class="card-title"><% out.print(rs.getString(2)); %></h5>
        <p class="card-text"><%out.print(rs.getString(5));%></p> </div>
        <form action="delete">
                        <button name="delete" value="<%out.print(rs.getString(1));%>">
                            Delete
                        </button>
                    </form>
    </div>
  </div>
  <%
             }
                }
  catch(Exception ex){
          out.println(ex);
            }%>
</div>    
            
        </div>
        </div>   
    </body>
</html>
