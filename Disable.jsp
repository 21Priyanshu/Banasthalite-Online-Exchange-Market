<%-- 
    Document   : Disable
    Created on : May 13, 2021, 3:35:54 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.Statement"%>
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
           int item_id=Integer.parseInt(request.getParameter("disable"));
           DbConnection obj = new DbConnection();
          Statement stmt = obj.c.createStatement();
           stmt.executeUpdate("update item set item_available='true' where itemid=" + item_id);
//           stmt.executeUpdate();
           response.sendRedirect("Index.jsp");
       %>
    </body>
</html>
