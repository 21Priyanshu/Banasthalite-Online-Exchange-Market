<%@page import="myprojectdb.flag"%>
<%@page import="myproject.DbConnection"%>
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
            int sem=Integer.parseInt(request.getParameter("sem"));
            String hostel=request.getParameter("hostel");
            int rno=Integer.parseInt(request.getParameter("roomno"));
            String cno=request.getParameter("contact");
            String question = request.getParameter("question");
            String answer = request.getParameter("answer");       
            DbConnection obj=new DbConnection();
            PreparedStatement ps=obj.c.prepareStatement("insert into seller values(?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, sname);
            ps.setString(2, bvid);
            ps.setString(3, p);
            ps.setString(4, eid);
            ps.setString(5, course);
            ps.setString(6, b);
            ps.setInt(7, sem);
            ps.setString(8, hostel);
            ps.setInt(9, rno);
            ps.setString(10, cno);
            ps.setString(11, question);
            ps.setString(12, answer);
            int i=ps.executeUpdate();
            if(i==1){
                 flag obj1 = new flag();
                    obj1.setflag(1);
                 response.sendRedirect("MasterReupdatd.jsp");
                 return;
            }
            else
                response.sendRedirect("error.jsp");
        %>
    </body>
</html>