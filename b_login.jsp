
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
             if(request.getParameter("btn_submit")!=null){
            String u=request.getParameter("txt_uid");
            String p=request.getParameter("txt_password");
            DbConnection obj=new DbConnection();
            PreparedStatement ps=obj.c.prepareStatement("select * from buyer where uid=? and password=?");
            ps.setString(1, u);
            ps.setString(2, p);
            out.print("hello");
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
//                out.print("Welcome"+u);
//                response.sendRedirect("Index.jsp");
                response.sendRedirect("Buyer.jsp");
            }
            else
                response.sendRedirect("error.jsp");
             }
             
        %>
    </body>
</html>
