<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> Password Reset </title>
	<style>
            *{
                margin: 0px;
            }
            body{
                background-color: blanchedalmond;
            }
            .nav{
                background-color: #99ffcc;
                padding: 15px;
            }
	.container{
            background-color: white;
	width:30%;
	height:350px;
	border:solid;
	border-width:1px;
	border-color:blue;
	box-shadow:2px #808080;
	}
	input[type=text], input[type=password], input[type=number]{
            width: 40%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }
    h1{
        margin: 0px;
    color:black;
    
    }
    h2{
        padding-top: 20px;
    }
.button1 {
  background-color: dodgerblue;
  color: white;
  padding: 12px 15px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 25%;
  opacity: 0.9;
}

.button1:hover {
  opacity: 1;
}
	</style>
</head>
<body>
    <form method="Post">
        <div class="nav">
	<h1 align="center"> Lets Find Your Account</h1>
	
        </div>
	</br></br>
	<center>
	<div class="container">
	<h2> Forgot Password</h2></br>
	No Problem! Enter your User ID below</br></br>
	<input type="text" name="uid" placeholder="Enter User ID" required/></br>
	<button class="button1" name="submit"><span>Submit</span></button></br> </br>
	Back to <a href="seller_login.jsp">Login</a>
	</div>
	</center>
<%
    try{
        if(request.getParameter("submit")!=null)
        {
            String userid=request.getParameter("uid");
            session.setAttribute("User_Id",userid);
            Class.forName("org.apache.derby.jdbc.ClientDriver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/priyanshu");
     Statement st= con.createStatement();
            ResultSet rs=st.executeQuery("select * from buyer where uid='"+userid+"'");
            if(rs.next())
            {
                response.sendRedirect("security_answer_buyer.jsp");
            }
            else
            {
                out.println("<script>alert('Email not found')</script> ");
            }
        }
}catch (Exception e) {
        e.printStackTrace();
    }
  %>          
    </form>
</body>
</html>
