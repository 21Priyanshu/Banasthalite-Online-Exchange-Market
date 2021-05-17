<%-- 
    Document   : rindex
    Created on : Apr 26, 2021, 10:06:18 AM
    Author     : vidya raj
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
        <title>Home</title>
        <link href="css/sample.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
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
                <form action="Index.jsp">
                    <button name="btn" class="btn_buy btn btn-outline-success my-2 mr-4 my-sm-0">Sell Items</button>
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
                <a href="rindex.jsp">Display Item</a>
                <a href="#Profile_Modal" data-toggle="modal">Profile</a>
                <a href="Logout.jsp">Logout</a>
                <!--Modal for displaying Profile-->
                <div class="modal" id="Profile_Modal">
                    <%
                        String u = session.getAttribute("userId").toString();
                        try {
                            DbConnection obj = new DbConnection();
                            Statement stmt1 = obj.c.createStatement();
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
            </div>  
              <div class="modal" id="mymodal">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <img src ="images\Banasthali_Vidyapeeth_Logo.png" height=40px width=40px /> &nbsp;
                                <h3 class="text-center">Add Item</h3>
                                <button type="button" class="close" data-dismiss="modal"> &times;</button> 
                            </div>
                            <div class="modal-body">
                                <form action="RntAddItem" method="post" enctype="multipart/form-data" >
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Item Name </h6></label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control form-control-sm"  name="ritemname" placeholder="e.g.Cycle" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Add Photo </h6></label>
                                        <div class="col-sm-7">
                                            <input type="file" class="form-control form-control-sm form-control-file" name="ritemphotos" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Description </h6></label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control form-control-sm" name="rdescription" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Price </h6></label>
                                        <div class="col-sm-7">
                                            <input type="number" class="form-control form-control-sm" name="rprice" required>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="inputPassword" class="col-sm-3 col-form-label"><h6>Category </h6></label>
                                        <div class="col-sm-7">
                                            <select class="form-control form-control-sm" name="category" required>
                                                <option value="None">Enter a category</option>
                                                <option value="Books">Books</option>
                                                <option value="Fan">Fan</option>
                                                <option value="Cycle">Cycle</option>
                                                <option value="Ed Items">Ed Items</option>
                                                <option value="Others">Others</option>
                                            </select>
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
    
          
        <div class="display" >
            <div class="row  row-cols-4 g-4 mt-0 mx-1" >
             <%
                   
                try{
                    DbConnection obj=new DbConnection();
                    Statement stmt1=obj.c.createStatement();
                    ResultSet rs=stmt1.executeQuery("select * from rent where uid='"+u+"'");
                    while(rs.next()){
             %>
                 <div class="col ">
                     <div class="card h-100 cardh " >
                        <% 
                                           out.print("<img src="+rs.getString(4)+" width='100%' height='300px' alt='Tulips'/>");
                       %>
                        <div class="card-body">
                            <h5 class="card-title"><% out.print(rs.getString(2)); %></h5>
                            <h6 class="card-text">&#8377 <%out.print(rs.getString(6));%></h6>
                            <p class="card-text"><%out.print(rs.getString(5));%></p> 
                            
                            <%
                                int item_id = Integer.parseInt(rs.getString(1));
                                if(rs.getBoolean(10)==false)
                                {%>
                                <p style="font-weight:600;color:green" class="card-text"> Issue Date: <%out.print(rs.getString(8));%></p> 
                                    <p style="font-weight:600;color:red" class="card-text">Due Date : <%out.print(rs.getString(9));%></p> 
                                  
                              <%  }
                               else{%>
                                <p  class="card-text"> Issue Date:Not Rented yet</p> 
                                    <p  class="card-text">Due Date : Not Rented yet</p>
                                    
                           <%} %>
                             <div style="display:flex">
                            <form action="rdelete" class="card-link">
                                <button name="delete" value="<%out.print(rs.getString(1));%>" class="btn btn-primary d-inline-flex">
                                    Delete
                                </button>
                            </form>
                                    
                                    <% if(rs.getBoolean(10)==true)
                                    {
                                    %>
                               <form class="card-link" action="rent.jsp">
                                    <button type="submit" class="btn btn-primary" name="rent" value="<%=item_id%>"> Rent</button>
                                </form>    
                             
                            <%
                                }
                            else
                            {
                                
                            %>
                            <form class="card-link" action="rented.jsp">
                                    <button type="submit" class="btn btn-success" name="rented" value="<%=item_id%>"> Rented</button>
                                </form>
                             <%
                                }%>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                           }
                              }
                    catch(Exception ex){
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
    
        
    </body>
</html>

