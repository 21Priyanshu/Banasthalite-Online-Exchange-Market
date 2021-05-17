<%-- 
    Document   : buy
    Created on : 20 Apr, 2021, 4:55:28 PM
    Author     : HP
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="myproject.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="buycss.css" type="text/css" rel="stylesheet"> 
        <style></style>

    </head>
    <body>
        <div class="back">
            <div class="container">

                <div class="logo">
                    <div class="logo1">
                        <img src ="images\Banasthali_Vidyapeeth_Logo.png" height=50px width=50px /> 
                        <h1>Banasthalite Online Exchange Market</h1>
                    </div>
                    <h1>Cash on Delivery !!</h1>
                    <h2>Seller Details</h2>
                </div>
                <div class="content">
                    <%
                        int id = Integer.parseInt(request.getParameter("btn_buy"));
                        try {
                            DbConnection obj = new DbConnection();
                            PreparedStatement ps = obj.c.prepareStatement("select * from seller where uid in(select uid from rent where ritemid=?)");
                            ps.setInt(1, id);
                            ResultSet rs = ps.executeQuery();
                    if (rs.next()) {      %>  
                    <div class="form-group1">
                        <div class="head">Name</div>
                        <div class="input1"><% out.print(rs.getString(1)); %></div>
                    </div>
                    <div class="form-group1">
                        <div class="head">User Id</div>
                        <div class="input1"><% out.print(rs.getString(2)); %></div>
                    </div>
                    <div class="form-group1">
                        <div class="head">Email</div>
                        <div class="input1"><% out.print(rs.getString(4)); %></div>
                    </div>
                    <div class="form-group1">
                        <div class="head">Course</div>
                        <div class="input1"><% out.print(rs.getString(5)); %></div>
                    </div>
                    <div class="form-group1">
                        <div class="head">Branch</div>
                        <div class="input1"><% out.print(rs.getString(6)); %></div>
                    </div>
                    <div class="form-group1">
                        <div class="head">Semester</div>
                        <div class="input1"><% out.print(rs.getString(7)); %></div>
                    </div>
                    <div class="form-group1">
                        <div class="head">Hostel</div>
                        <div class="input1"><% out.print(rs.getString(8)); %></div>
                    </div>
                    <div class="form-group1">
                        <div class="head">RoomNo</div>
                        <div class="input1"><% out.print(rs.getString(9)); %></div>
                    </div>
                    <div class="form-group1">
                        <div class="head">Contact</div>
                        <div class="input1"><% out.print(rs.getString(10)); %></div>
                    </div>

                </div>
                <%
                        }
                    } catch (Exception ex) {
                        out.println(ex);
                }%>	
                <div class="foot">
                    Back to
                    <a href="buyer_rent_index.jsp">Buyer Page</a>
                    <a href="MasterpReupdatd.html">Home Page</a>
                </div>


            </div>

        </div>
    </body>
</html>
