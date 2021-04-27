<%-- 
    Document   : b_index
    Created on : 1 Apr, 2021, 3:54:05 PM
    Author     : HP
--%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.io.PrintWriter"%>
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
        <title>Buyer Home Page</title>
       <link href="css/sample.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">-->
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
            .vertical{
                display: none;
                width: 15%;
                height: 100%;
                position: relative;
                padding-top: 0px;
                background-color: #f1f1f1;
                overflow-x: hidden;
                transition: 0.5s;
             }
            .vertical a {
                padding: 8px 8px 8px 32px;
                text-decoration: none;
                font-size: 25px;
                color: #000;
                display: block;
                transition: 0.3s;
                /**/

            }
            .closebtn {
                margin-left: 60%;
                font-size: 30px;
                /*margin-right: 10px;*/
            }
            .vertical  a.active {
                background-color: #4CAF50;
                color: white;
            }
            .vertical a:hover{
                background-color: #555;
                color: whitesmoke;
            }
            .ham{
                font-size: 30px;
                cursor: pointer;
            }
            .dropdown{

                /*display: block;*/
                /*background-color: blue;*/
                /*position: absolute;*/
                /*padding-top: 10px;*/
                right: 50px;
            }
            .dropdown button{
                border: 1px solid black;
                border-radius: 5px;
                background-color: transparent
            }
            .dropdown-menu-right {
                /* right: 0; */
                left: 47%;
                top: 103%;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                /*background-color: black;*/
                background-color: #f1f1f1;
                min-width: 102px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                top: 103%;
                /*z-index: 1;*/
            }
/*            .dropdown>button:hover{
                background-color: #4CAF50;
                color: white;
            }*/
            .dropdown:hover .dropdown-content {
                display: block;
                
                background-color: #ddd;
          }
            

            /* Links inside the dropdown */
            .dropdown-content a {
                float: none;
                /*color: black;*/
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                text-align: left;
            }
            
        </style>
    </head>

    <body class="bg">
        <div class="navbar nav">
            <div class="r-navlist nav">
                <div class="ham">
                    <p onclick="openNav()">&#9776;</p>
                </div>

                <ul>
                    <li>Banasthalite Online Exchange Market</li>
                </ul>
            </div>
            <div class="dropdown nav">
                <button >Login
                </button>
                <div class="dropdown-content">
                    <a href="S_login.html">Seller</a>
                </div>
            </div>
        </div>
        <div class="bg_container">
            <div id="vertical" class="vertical">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                    <a href="b_index.jsp">Display Item</a>
                    <a href="wishlist.jsp">Wishlist</a>
                    <a>Profile</a>
                    <a href="Logout.jsp">Logout</a>
            </div>
            <div class="display" >
                <div class="row  row-cols-4 row-cols-md-4 g-4 mt-1 mx-1 mb-4" >
                    <%
                        String u=session.getAttribute("userId").toString();
                        try {
                            DbConnection obj=new DbConnection();
                            Statement stmt1 = obj.c.createStatement();
                           ResultSet rs=stmt1.executeQuery("select * from item where itemid in(select itemid from wishlist where uid='"+u+"')");
                     while (rs.next()) {%>
                    <div class="col mb-2">
                        <div class="card h-100 cardh ">
                            <%
                                out.print("<img src=" + rs.getString(4) + " width='100%' height='300px' alt='Tulips'/>");
                            %>
                            <div class="card-body">
                                <h5 class="card-title"><% out.print(rs.getString(2)); %></h5>
                                <h6 class="card-text">&#8377 <%out.print(rs.getString(6));%></h6>
                                <p class="card-text"><%out.print(rs.getString(5));%></p> </div>
                                <form>
                                <button class="btn btn-primary card-text"  name="btn_remove" value="<%out.print(rs.getString(1));%>">
                                remove
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
   <script>
        
        function openNav() {
//      document.getElementById("vertical").style.width = "250px";
  document.getElementById("vertical").style.display = "block";
}

function closeNav() {
  document.getElementById("vertical").style.display = "none";
}
    </script>

    </body>
</html>
<%
      
    if (request.getParameter("btn_remove") != null) {
       
        String primessage;
        int id = Integer.parseInt(request.getParameter("btn_remove"));
        System.out.print(id);
        DbConnection obj = new DbConnection();
        try {
            
            PreparedStatement ps = obj.c.prepareStatement("delete from wishlist where itemid=?");
           
            ps.setInt(1,id);
            ps.executeUpdate();
            primessage = "Removed from your wishlist!";
            session.setAttribute("message", primessage);
            response.sendRedirect("wishlist_update.jsp");
            
            
            } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    String postmessage = session.getAttribute("message").toString();    
    out.println(postmessage);
    if (postmessage != null) {

%>
<div class="popup alert alert-success alert-dismissible fade show" role="alert">
    <strong>Removed from your wishlist!</strong> 
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
      }
      postmessage="null";
    session.setAttribute("message", postmessage);
%>

