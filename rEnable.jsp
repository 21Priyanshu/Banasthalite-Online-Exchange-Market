<%-- 
    Document   : Enable
    Created on : May 13, 2021, 3:24:27 PM
    Author     : Lenovo
--%>

<%@page import="myproject.DbConnection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           int item_id=Integer.parseInt(request.getParameter("enable"));
           DbConnection obj = new DbConnection();
          Statement stmt = obj.c.createStatement();
           stmt.executeUpdate("update rent set ritem_available='false' where ritemid=" + item_id);
//           stmt.executeUpdate();
           response.sendRedirect("rindex.jsp");
       %>
    </body>
</html>
