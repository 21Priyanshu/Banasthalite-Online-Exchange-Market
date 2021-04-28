<%-- 
    Document   : b login
    Created on : 9 Mar, 2021, 3:56:23 PM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<%@page import="myproject.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            
            String u=request.getParameter("uid");
            String p=request.getParameter("password");
            DbConnection obj=new DbConnection();
            PreparedStatement ps=obj.c.prepareStatement("select * from buyer where uid=? and "+"password=?");
            ps.setString(1, u);
            ps.setString(2, p);
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                
                session.setAttribute("userId", u);
                String loginmessage = "Removed from your wishlist!";
                session.setAttribute("message", loginmessage);
                response.sendRedirect("b_index4.jsp");
                
            }
            else
                response.sendRedirect("error.jsp");
            
        %>
    </body>
</html>
