<%@page import="myproject.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
             h1{
        margin: 0px;
    color:black;
    
    }
	.container{
            background-color: white;
            margin-top: 5%;
	width:30%;
	height:350px;
	border:solid;
	border-width:1px;
	border-color:blue;
	box-shadow:2px #808080;
	}
        h4{
        padding: 20px;
    }
	input[type=text], input[type=password], input[type=number]{
  width: 50%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
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
        <script>
		function validate(){
                var password=document.getElementById('pass').value;
		var c_password=document.getElementById('c_pass').value;
                if(password !== c_password)
		{
			alert('password does not match ');
			return false;
		}
                return true;
		}
	</script>
</head>
<body>
    <form method="Post" onsubmit="return validate()">
        <div class="nav">
	<h1 align="center"> Password Reset</h1>
        </div>
		<center>
	<div class="container">
	<h4> Enter New Password</h4>
	<h5>Password</h5>
	<input type="password" id="pass" name="password" placeholder="Enter password" required/></br>
	<h5>Re-type Passsword</h5>
	<input type="password" id="c_pass"  name="c_password" placeholder="Enter password" required/></br>
	<button class="button1" name="submitbtn"><span>Submit</span></button></br> </br>
	
	</div>
	</center>
<%
    try{
        if(request.getParameter("submitbtn")!=null)
        {
            String pass=request.getParameter("password");
            String user=session.getAttribute("userid").toString();
            DbConnection obj = new DbConnection();
            String sql1="update seller set password=? where uid='"+user+"'";
            PreparedStatement ps=obj.c.prepareStatement(sql1);
            ps.setString(1,pass);
            if(ps.executeUpdate()>0)
            {
                response.sendRedirect("MasterReupdatd.jsp");
            }
        }
}catch (Exception e) {
        e.printStackTrace();
    }
  %>      
    </form>
</body>
</html>