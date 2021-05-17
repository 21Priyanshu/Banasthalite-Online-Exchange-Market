<%-- 
    Document   : rent
    Created on : 17 May, 2021, 9:29:50 PM
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
    <body><%
         int id = Integer.parseInt(request.getParameter("rent"));
                   //String u = session.getAttribute("userId").toString();
                    try {
                        DbConnection obj=new DbConnection();
                        PreparedStatement ps=obj.c.prepareStatement("update rent set rissuedate=?,rduedate=?,ritem_available=? where ritemid=?");
                        SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
                        Calendar cal=new GregorianCalendar();
                        Date date=new Date();
                        String issue_date=(sdf.format(cal.getTime()));
                        cal.add(Calendar.DAY_OF_MONTH,15);
                        String due_date=(sdf.format(cal.getTime()));
                       // System.out.println(issue_date);
                       //System.out.println(due_date);
                        ps.setString(1,issue_date);
                        ps.setString(2,due_date);
                       ps.setBoolean(3, false);
                       ps.setInt(4,id);
                       int i=ps.executeUpdate();
//                       System.out.println("Successfully changed");
                        
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
