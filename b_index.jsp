<%-- 
    Document   : b_index
    Created on : 1 Apr, 2021, 3:54:05 PM
    Author     : HP
--%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="java.util.logging.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="myproject.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buyer Home Page</title>
        <link href="css/sample.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-growl/1.0.0/jquery.bootstrap-growl.min.js" integrity="sha512-pBoUgBw+mK85IYWlMTSeBQ0Djx3u23anXFNQfBiIm2D8MbVT9lr+IxUccP8AMMQ6LCvgnlhUCK3ZCThaBCr8Ng==" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <style>
            .popup{
                position:absolute;
                top:10px;
                z-index:6;

                left:45%;
            }
            .searchcat{
                margin-left:35%;
            }
            .indexbutton{
                margin:15px;
            }
        </style>
    </head>

    <body class="bg">
        <div class="navbar nav">
            <div class="r-navlist nav">
                <div class="ham">
                    <div class="line"></div>
                    <div class="line"></div>
                    <div class="line"></div>
                </div>

                <ul>
                    <li>Banasthalite Online Exchange Market</li>
                </ul>
            </div>
            <form class="form-inline searchcat" action="b_index_category.jsp">
            <input class="form-control mr-sm-2" name="category" type="search" placeholder="Enter a category" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
            <div class="dropdown nav">
                <button >Login
                </button>
                <div class="dropdown-content">
                    <a href="#mymodal" data-toggle="modal">Seller</a>
                </div>
                 <div class="modal" id="mymodal">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <img src ="images\Banasthali_Vidyapeeth_Logo.png" height=40px width=40px /> &nbsp;
                                    <h3 class="text-center">Seller Login</h3>
                                    <button type="button" class="close" data-dismiss="modal"> &times;</button> 
                                </div>
                                <div class="modal-body">
                                    <form action="s login.jsp" >
                                        <div class="form-group row">
                                            <label for="inputPassword" class="col-sm-2 col-form-label"><h6>UserID </h6></label>
                                            <div class="col-sm-10">
                                                <input type="text" name="uid" class="form-control" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputPassword" class="col-sm-2 col-form-label"><h6>Password </h6></label>
                                            <div class="col-sm-10">
                                                <input type="password" name="password" class="form-control" size=40 required/>
                                            </div>
                                        </div>
                                        <div class="modal-footer justify-content-center">
                                            <button type="submit" class="btn btn-primary" > Login</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
        <div class="bg_container">
            <div class="vertical">
                <ul>
                    <li><a href="b_index.jsp">Display Item</a></li>
                    <li><a href="wishlist.jsp">Wishlist</a></li>
                    <li>Profile</li>
                    <li><a href="Logout.jsp">Logout</a></li>
                </ul>
            </div>
            <div class="display" >
                <div class="row row-cols-2 row-cols-xl-4 g-4" >
                    <%
                        try {
                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/priyanshu");
                            Statement stmt1 = conn.createStatement();
                            ResultSet rs = stmt1.executeQuery("select * from item where item_available='True" + "'");
                            while (rs.next()) {%>
                    <div class="col ">
                        <div class="card h-100 mt-2">
                            <%
                                out.print("<img src=" + rs.getString(4) + " width='100%' height='50%' alt='Tulips'/>");
                            %>
                            <div class="card-body">
                                <h5 class="card-title"><% out.print(rs.getString(2)); %></h5>
                                <h6 class="card-text">&#8377 <%out.print(rs.getString(6));%></h6>
                                <p class="card-text"><%out.print(rs.getString(5));%></p> </div>
                            <form>
                            <button class="btn btn-primary card-text indexbutton"  name="btn_wish" value="<%out.print(rs.getString(1));%>">
                                add to wishlist
                            </button>
                            
                            <button class="btn btn-primary card-text" name="btn_buy" value="<%out.print(rs.getString(1));%>">
                                buy
                            </button>
                           </form>
                        </div>
                    </div>
                    <%}%>
                    <%
                        } catch (Exception ex) {
                            out.println(ex);
                        }
                    %> 

                </div>
            </div> 

    </body>
</html>

<!--Wishlist button code-->

<%

    if (request.getParameter("btn_wish") != null) {
        String u = session.getAttribute("userId").toString();
        String primessage = "null";
        int id = Integer.parseInt(request.getParameter("btn_wish"));
        DbConnection obj = new DbConnection();
        try {
            PreparedStatement ps = obj.c.prepareStatement("insert into wishlist values (?,?)");
            ps.setString(1, u);
            ps.setInt(2, id);
            ps.executeUpdate();
            primessage = "Added Succesfully";

            if (primessage != null) {
%>
<div class="popup alert alert-success alert-dismissible fade show" role="alert">
    <strong>Added Successfully!</strong> 
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<% }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
