<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="css/sample.css" rel="stylesheet">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .cardh{
                height: auto;
                /*background-color: red;*/
            }
            .login_btn :hover{
                display: block;
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
            .rent_btn{
                margin-left: -50%;
            }
            .dropdown{

                /*display: block;*/
                /*background-color: blue;*/
                position: absolute;
                padding-top: 10px;
                right: 50px;
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
                /*background-color: #f1f1f1;*/
                min-width: 102px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                /*z-index: 1;*/
            }
            /*            .dropdown:hover {
              background-color: #ddd;
            }*/

            /* Show the dropdown menu on hover */
            .dropdown:hover .dropdown-content {
                background-color: #ddd;
                display: block;
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
            .modal1 {
                    margin: auto;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgb(0,0,0,0.4)
            }
            .modal_body {
                position: relative;
                -ms-flex: 1 1 auto;
                flex: 1 1 auto;
                padding: 1rem;
            }

            /* Modal Content */
            .modal_content {
                   position: fixed;
    background-color: #fefefe;
    margin: auto;
    width: 33%;
    left: 29%;
    top: 20%;
    /* padding: 20px; */
    border: 1px solid #888;
            }
            .modal_header {
                display: -ms-flexbox;
                display: flex;
                -ms-flex-align: start;
                align-items: flex-start;
                -ms-flex-pack: justify;
                /*justify-content: space-between;*/
                padding: 1rem 1rem;
                border-bottom: 1px solid #dee2e6;
                border-top-left-radius: calc(.3rem - 1px);
                border-top-right-radius: calc(.3rem - 1px);
            }

            /* The Close Button */
            .close {
                margin-top: 1%;
                margin-left: 45%;
                /* background-color: red; */
                float: right;
                font-size: 1.5rem;
                font-weight: 700;
                line-height: 1;
                color: #000;
                text-shadow: 0 1px 0 #fff;
                opacity: .5;
            }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
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
            input {
                border-style: none;
                background-color: #eee;
            }
        </style>
    </head>
    <body class="bg" id="body">
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
                <form action="rindex.jsp">
                    <button name="btn" class="rent_btn btn btn-outline-success my-2 my-sm-0">Rent</button>
                </form>
                <button class="btn btn-outline-success my-2 my-sm-0 ">Login</button>
                <div class="dropdown-content dropdown-menu-right login_btn">
                    <a href="#mymodal2" data-toggle="modal">Buyer</a>
                </div>
                <div class="modal" id="mymodal2">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <img src ="images\Banasthali_Vidyapeeth_Logo.png" height=40px width=40px /> &nbsp;
                                <h3 class="text-center ">Buyer Login</h3>
                                <button type="button" class="close" data-dismiss="modal"> &times;</button> 
                            </div>
                            <div class="modal-body">
                                <form action="b login.jsp" method="post">
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
                <a href=#mymodal data-toggle="modal">Add Item</a>
                <a href="Index1.jsp" >Display Item</a>
                <a href="#Profile_Modal" data-toggle="modal">Profile</a>
                <a href="Logout.jsp">Logout</a>
                <!--Modal for displaying Profile-->
                <div class="modal" id="Profile_Modal">
                    <%
                        String u = session.getAttribute("userId").toString();
                        try {
                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/priyanshu");
                            Statement stmt1 = conn.createStatement();
                            ResultSet rs = stmt1.executeQuery("select * from seller where uid='" + u + "'");
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
                                <form action="modify_seller" >

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
                <!--Modal for adding item-->
                <div class="modal" id="mymodal">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <img src ="images\Banasthali_Vidyapeeth_Logo.png" height=40px width=40px /> &nbsp;
                                <h3 class="text-center">Add Item</h3>
                                <button type="button" class="close" data-dismiss="modal"> &times;</button> 
                            </div>
                            <div class="modal-body">
                                <form action="AddItem" method="post" enctype="multipart/form-data" >
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Item Name </h6></label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control form-control-sm"  name="itemname" placeholder="e.g.Cycle" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Add Photo </h6></label>
                                        <div class="col-sm-7">
                                            <input type="file" class="form-control form-control-sm form-control-file" name="itemphotos" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Description </h6></label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control form-control-sm" name="idescription" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Price </h6></label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control form-control-sm" name="price" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Category </h6></label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control form-control-sm" name="category" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer justify-content-center">
                                        <button type="submit" class="btn btn-primary" >Add</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="display" >
                <div class="row  row-cols-4 g-4 mt-0 mx-1" >
                    <%
                        u = session.getAttribute("userId").toString();
                        try {
                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/priyanshu");
                            Statement stmt1 = conn.createStatement();
                            ResultSet rs = stmt1.executeQuery("select * from item where uid='" + u + "'");
                            if (rs.next() == false) {%>
                    <div class="noitem">

                        <i class="fa fa-frown-o" style="font-size:48px;"></i>
                        <h3>Oops!!</h3>
                        <p>No Item Added!!!</p>
                        <p>Go to AddItem Menu</p>
                        <!--                            <a href=#mymodal data-toggle="modal"> Click here to Add Item</a>-->
                    </div>
                    <%} else {
                        rs = stmt1.executeQuery("select * from item where uid='" + u + "'");

                        while (rs.next()) {
                    %>
                    <div class="col ">
                        <div class="card h-100 cardh " >
                            <%
                                int item_id = Integer.parseInt(rs.getString(1));
                                out.print("<img src=" + rs.getString(4) + " width='100%' height='300px' alt='Tulips'/>");
                            %>
                            <div class="card-body">
                                <h5 class="card-title"><% out.print(rs.getString(2)); %></h5>
                                <h6 class="card-text">&#8377 <%out.print(rs.getString(6));%></h6>
                                <p class="card-text"><%out.print(rs.getString(5));%></p> 
                                <!--<p class="card-text"><% //out.print(rs.getString(1));%></p>-->
                                <%
                                if(rs.getBoolean(8)==true){
                                    
                                %>
                                <form action="Enable.jsp">
                                    <button type="submit" class="btn btn-success" name="enable" value="<%=item_id%>"><i class="fa fa-check "></i>Enabled</button>
                                </form>
                                
                                <%
//                                    if(request.getParameter("enable")=="false"){
//                                        out.print("<p>hi</p>");
//                                        Statement stmt = conn.createStatement();
//                                        stmt.executeUpdate("update item set item_available='false' where itemid=" + item_id);
//                                        System.out.print("hi");
//                                         response.sendRedirect("Index1.jsp");
//                                    }
                                    }
                                   if(rs.getBoolean(8)==false){
                                            
                                %>
                                <form action="Disable.jsp">
                                         <button class="btn btn-danger" name="disable" value="<%=item_id%>"><i class="fa fa-times "></i>Disabled</button>
                                    </form>
                                 <%
//                                       if(request.getParameter("disable")=="true"){
//                                        Statement stmt = conn.createStatement();
//                                        stmt.executeUpdate("update item set item_available='true' where itemid=" + Integer.parseInt("rs.getString(1)") + "");
//                                         response.sendRedirect("Index1.jsp");
//                                       }
                                    }
                                            
                                %>
                                <form action="delete" >
                                    
                                    <button name="delete" value="<%out.print(rs.getString(1));%>" class="btn btn-primary indexbutton card-link">
                                        Delete
                                    </button>
                                </form>
                                <br>
                                <form id='modify_form' method="post">
                                    <button   type='submit' value="<%out.print(rs.getString(1));%>" name="modify"  class="btn btn-primary card-link" >
                                        Modify
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>  
                    <%
    //                        }
                                }
                            }
                        }catch (Exception ex) {
                            out.println(ex);
                        }
                    %>
                </div>    
            </div>
        </div>  
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>

                    function openNav() {
                        //      document.getElementById("vertical").style.width = "250px";
                        document.getElementById("vertical").style.display = "block";
                    }

                    function closeNav() {
                        document.getElementById("vertical").style.display = "none";
                    }
                                   
                
        </script>
        <%
    if(request.getParameter("modify")!=null){%>
    <div id="myModal" class="modal1" >
                                        <% int id= Integer.parseInt(request.getParameter("modify"));
                                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                                            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/priyanshu");
                                            Statement stmt1 = conn.createStatement();
                                            ResultSet rs = stmt1.executeQuery("select * from item where itemid=" + id + "");
                                            while(rs.next()){
                                        %>
                                        <!-- Modal content -->
                                        <div class="modal_content">
                                            <div class="modal_header">
                                                <img src ="images\Banasthali_Vidyapeeth_Logo.png" height=40px width=40px /> &nbsp;
                                                <h3 class="text-center mod">Modify Item</h3>                                    
                                                <!--<span class="close" >&times;</span>-->
                                                <a href="Index1.jsp" class="close">&times</a>

                                            </div>
                                            <div class="modal_body">
                                                <form action="modify" method="post" enctype="multipart/form-data" autocomplete="on">
                                                    <div class="form-group row">
                                                        <!--<label for="inputPassword" class="col-sm-3 col-form-label"><h6>Item Name </h6></label>-->
                                                        <div class="col-sm-7">
                                                            <input type="hidden" id="itemid" name="itemid" value="<%out.print(request.getParameter("modify"));%>">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Item Name </h6></label>
                                                        <div class="col-sm-7">
                                                            <input type="text" value="<% out.print(rs.getString(2)); %>" class="form-control form-control-sm"  name="itemname" placeholder="e.g.Cycle" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Add Photo </h6></label>
                                                        <div class="col-sm-7">
                                                            <input type="file" class="form-control form-control-sm form-control-file" name="itemphotos" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Description </h6></label>
                                                        <div class="col-sm-7">
                                                            <input type="text" value="<% out.print(rs.getString(5));%>" class="form-control form-control-sm" name="idescription" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Price </h6></label>
                                                        <div class="col-sm-7">
                                                            <input type="text" value="<% out.print(rs.getString(6));%>" class="form-control form-control-sm" name="price" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Category </h6></label>
                                                        <div class="col-sm-7">
                                                            <input type="text" value="<% out.print(rs.getString(7));%>" class="form-control form-control-sm" name="category" required>
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
                                         }
 }
%>
    </body>
</html>
