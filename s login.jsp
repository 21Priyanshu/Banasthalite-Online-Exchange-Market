<%-- 
    Document   : s login.jsp
    Created on : 21 Mar, 2021, 2:21:28 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
            PreparedStatement ps=obj.c.prepareStatement("select * from seller where uid=? and "+"password=?");
            ps.setString(1, u);
            ps.setString(2, p);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                out.println("Welcome "+rs.getString(1));
                response.sendRedirect("Index.jsp");
                session.setAttribute("userId", u);
            }
            else
                response.sendRedirect("error.jsp");
        %>
    </body>
</html>
