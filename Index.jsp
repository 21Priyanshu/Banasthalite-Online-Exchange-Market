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
            <form action="rindex.jsp">
                 <button name="btn">Rent</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </form>
            <button >Login</button>
            <div class="dropdown-content dropdown-menu-right">
                <a href="#mymodal2" data-toggle="modal">Buyer</a>
            </div>
            <div class="modal" id="mymodal2">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <img src ="images\Banasthali_Vidyapeeth_Logo.png" height=40px width=40px /> &nbsp;
                            <h3 class="text-center">Buyer Login</h3>
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
            <a href="#modify_modal" data-toggle="modal">Display Item</a>
            <a>Profile</a>
            <a href="Logout.jsp">Logout</a>
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
        <div class="display" >
            <div class="row  row-cols-4 g-4 mt-0 mx-1" >
                <%
                    String u = session.getAttribute("userId").toString();
                    try {
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Bolx");
                        Statement stmt1 = conn.createStatement();
                        ResultSet rs = stmt1.executeQuery("select * from item where uid='" + u + "'");
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
                           <form action="delete" >
                                <button name="delete" value="<%out.print(rs.getString(1));%>" class="btn btn-primary indexbutton">
                                    Delete
                                </button>
                            </form>
                            <br>
                            <form >
                                <button data-target="#modify_modal" data-toggle="modal" type="button" name="modify" >
                                    Modify
                                </button>
                            </form>
                        </div>
                    </div>
                </div>  
                <%
//                   if (request.getParameter("modify")!= null){
                %>
                <div class="modal" id="modify_modal">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <img src ="images\Banasthali_Vidyapeeth_Logo.png" height=40px width=40px /> &nbsp;
                                <h3 class="text-center">Modify Item</h3>
                                <button type="button" class="close" data-dismiss="modal"> &times;</button> 
                            </div>
                            <div class="modal-body">
                                <form action="modify" method="post" enctype="multipart/form-data" >
                                    
                                    </div>
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
                                        <button type="submit" class="btn btn-primary" >Modify</button>
                                    </div>
                                </form>
                            </div>
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