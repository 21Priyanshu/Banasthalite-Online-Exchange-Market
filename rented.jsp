<%-- 
    Document   : rented
    Created on : 17 May, 2021, 9:33:34 PM
    Author     : HP
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="myproject.DbConnection"%>
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
         int id = Integer.parseInt(request.getParameter("rented"));
                   //String u = session.getAttribute("userId").toString();
                    try {
                        DbConnection obj=new DbConnection();
                        PreparedStatement ps=obj.c.prepareStatement("update rent set rissuedate=?,rduedate=?,ritem_available=? where ritemid=?");
                      
                        ps.setString(1,null);
                        ps.setString(2,null);
                       ps.setBoolean(3, true);
                       ps.setInt(4,id);
                       int i=ps.executeUpdate();
                       System.out.println("Successfully changed");
                        
                       if(i==1)
                        response.sendRedirect("rindex.jsp");
                       else
                       response.sendRedirect("error.jsp");
                     
                        
                     }
                        
                     catch (Exception ex)
                    {
                        out.println(ex);
                    }
             %>       
    </body>
</html>
