<%-- 
    Document   : buyer reg
    Created on : 9 Mar, 2021, 3:19:23 PM
    Author     : HP
--%>
<%@page import="myprojectdb.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            String sname=request.getParameter("sname");
            String bvid=request.getParameter("uid");
            String p=request.getParameter("password");
            String eid=request.getParameter("emailid");
            String course=request.getParameter("course");
            String b=request.getParameter("branch");
            String sem=request.getParameter("sem");
            String hostel=request.getParameter("hostel");
            String rno=request.getParameter("roomno");
            String cno=request.getParameter("contact");
            DbConnection obj=new DbConnection();
            PreparedStatement ps=obj.c.prepareStatement("insert into seller values(?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, sname);
            ps.setString(2, bvid);
            ps.setString(3, p);
            ps.setString(4, eid);
            ps.setString(5, course);
            ps.setString(6, b);
            ps.setString(7, sem);
            ps.setString(8, hostel);
            ps.setString(9, rno);
            ps.setString(10, cno);
            int i=ps.executeUpdate();
            if(i==1)
                out.println("Welcome "+sname);
            else
                response.sendRedirect("error.jsp");
        %>
    </body>
</html>