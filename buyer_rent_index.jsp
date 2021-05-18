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
        <title>Buyer Rent Page</title>
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
            .searchcat{
                margin-left:35%;
            }
           
            .cardh{
                height: auto;
                /*background-color: red;*/
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
/*            .dropdown button{
                border: 1px solid black;
                border-radius: 5px;
                background-color: transparent
            }*/
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
            .loginbutton{
              padding-top: 0px;  
            }
            .adjust_button{
                display: inline;
            }
            .noitem{
                position: fixed;
                /*width: 1000px;*/
                text-align: center;
                background-color: rgba(0,0,0,0.4);
                /*background-color: #555;*/
                color: white;
                padding: 30px;
                margin-top: 15%;
                margin-left: 30%;
            }
            .btn_rent{
                right:10px;
              
            }
            .navbar nav{
                justify-content:flex-end;
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
            
            <div class="dropdown nav loginbutton">
                <form action="b_index.jsp">
                    <button name="btn" class="btn_buy btn btn-outline-success my-2 mr-4 my-sm-0">Buy Items</button>
            </form>
               <button type="button" class="btn btn-outline-success my-2 my-sm-0 " data-toggle="modal" data-target="#mymodal">Seller</button>
              
                <div class="modal" id="mymodal">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <img src ="images\Banasthali_Vidyapeeth_Logo.png" height=40px width=40px /> &nbsp;
                                    <h3 class="text-center">Seller Login</h3>
                                    <button type="button" class="close" data-dismiss="modal"> &times;</button> 
                                </div>
                                <div class="modal-body">
                                    <form action="seller_login.jsp" >
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
            <div class="vertical" id="vertical">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <a href="buyer_rent_index.jsp">Display Item</a>
                <a href="#Profile_Modal" data-toggle="modal">Profile</a>
                <a href="Logout.jsp">Logout</a>
           
                       <!--Modal for displaying Profile-->
                <div class="modal" id="Profile_Modal">
                    <%
                        String u = session.getAttribute("userId").toString();
                        try {
                            DbConnection obj = new DbConnection();
                            Statement stmt1 = obj.c.createStatement();
                            ResultSet rs = stmt1.executeQuery("select * from buyer where uid='" + u + "'");
                            while (rs.next()) {
                    %>
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <img src ="images\Banasthali_Vidyapeeth_Logo.png" height=40px width=40px /> &nbsp;
                                <h3 class="text-center">Profile</h3>
                                <button type="button" class="close" data-dismiss="modal"> &times;</button> 
                            </div>
                            <div class="modal-body">
                                <form action="modify_buyer" >

                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Name </h6></label>
                                        <div class="col-sm-7">
                                            <input type="text" name="sname" value="<% out.print(rs.getString(1)); %>" class="form-control form-control-sm"  name="itemname" placeholder="e.g.Cycle"  required >
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>ID </h6></label>
                                        <div class="col-sm-7">
                                            <input type="text" name="uid" value="<% out.print(rs.getString(2)); %>" class="form-control form-control-sm"  name="itemname" placeholder="e.g.Cycle" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Email </h6></label>
                                        <div class="col-sm-7">
                                            <input type="text" name="emailid" value="<%out.print(rs.getString(4));%>" class="form-control form-control-sm" name="idescription" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Course </h6></label>
                                        <div class="col-sm-7">
                                            <input type="text" name="course" value="<%out.print(rs.getString(5));%>" class="form-control form-control-sm" name="price" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Branch </h6></label>
                                        <div class="col-sm-7">
                                            <input type="text" name="branch" value="<%out.print(rs.getString(6));%>" class="form-control form-control-sm" name="category" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Semester </h6></label>
                                        <div class="col-sm-7">
                                            <input type="text" name="sem" value="<%out.print(rs.getString(7));%>" class="form-control form-control-sm" name="category" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Hostel </h6></label>
                                        <div class="col-sm-7">
                                            <input type="text" name="hostel" value="<%out.print(rs.getString(8));%>" class="form-control form-control-sm" name="category" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Room No. </h6></label>
                                        <div class="col-sm-7">
                                            <input type="text" name="roomno" value="<%out.print(rs.getString(9));%>" class="form-control form-control-sm" name="category" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Contact No. </h6></label>
                                        <div class="col-sm-7">
                                            <input type="text" name="contact" value="<%out.print(rs.getString(10));%>" class="form-control form-control-sm" name="category" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer justify-content-center">
                                        <button type="submit" class="btn btn-primary" >Modify</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%
//                        }
                            }
                        } catch (Exception ex) {
                                                                out.println(ex);
                                                            }%>
                </div>
            </div>
            <div class="display" >
                <div class="row  row-cols-4 row-cols-md-4 g-4 mt-1 mx-1 mb-4" >
                    <%
                        try {
                            DbConnection obj=new DbConnection();
                            Statement stmt1 = obj.c.createStatement();
                            ResultSet rs = stmt1.executeQuery("select * from rent ");
                            if (rs.next() == false) {%>
                    <div class="noitem">

                        <i class="fa fa-frown-o" style="font-size:48px;"></i>
                        <h3>Oops!!</h3>
                        <p>No Item Added!!!</p>
                        <p>Go to AddItem Menu</p>
                        <!--                            <a href=#mymodal data-toggle="modal"> Click here to Add Item</a>-->
                    </div>
                    <%} else {
                    rs = stmt1.executeQuery("select * from rent ");
        while (rs.next()) {%>
                    <div class="col mb-2">
                        <div class="card h-100 cardh ">
                            <%
                                out.print("<img src=" + rs.getString(4) + " width='100%' height='300px' alt='Tulips'/>");
                            %>
                            <div class="card-body">
                             
                                <h5 class="card-title d-inline "><% out.print(rs.getString(2)); %></h5>
                               <% if(rs.getBoolean(10)==false)
                                {
                                   %>
                                   <h5 class="d-inline"><span class="badge rounded-pill bg-danger">Not Available</span></h5>                              <%  }
                               else{%>
                               <h5 class="d-inline "><span class="badge rounded-pill bg-success">Available</span>  </h5>
                           <%} %> 
                          
                                <h6 class="card-text">&#8377 <%out.print(rs.getString(6));%></h6>
                                <p class="card-text"><%out.print(rs.getString(5));%></p> 
                                    
                            <%
                                int item_id = Integer.parseInt(rs.getString(1));
                                if(rs.getBoolean(10)==false){%>
                            
                                <p style="font-weight:600;color:green" class="card-text"> Issue Date: <%out.print(rs.getString(8));%></p> 
                                    <p style="font-weight:600;color:red" class="card-text">Due Date : <%out.print(rs.getString(9));%></p> 
                                 
                              <%  }
                               else{%>
                                <p  class="card-text"> Issue Date:Not Rented yet</p> 
                                    <p  class="card-text">Due Date : Not Rented yet</p>
                                  
                           <%} %>
                             
                                
                                 
                                <form class="adjust_button" action="rcontactup.jsp">
                                    <button class="btn btn-primary card-text" name="btn_buy" value="<% out.print(rs.getString(1)); %>">
                                        Contact
                                    </button>

                                </form>
                                
                            </div>
                        </div>
                    </div>
                    <%}%>
                    <%
                        }
                        } catch (Exception ex) {
                            out.println(ex);
                        }
                    %> 

                </div>
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

<!--Wishlist button code-->

<%

    if (request.getParameter("btn_wish") != null) {
        
        String primessage = "null";
        int id = Integer.parseInt(request.getParameter("btn_wish"));
        DbConnection obj = new DbConnection();
        try {
            PreparedStatement ps = obj.c.prepareStatement("insert into wishlist values (?,?)");
            ps.setString(1, u);
            ps.setInt(2, id);
            ps.executeUpdate();
            primessage = "Added Succesfully";
 //           request.setAttribute("btn_wish",null);
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

