<%@page import="myproject.DbConnection"%>
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
             h1{
        margin: 0px;
    color:black;
    
    }
    h2{
        padding-top: 20px;
    }
    h4{
        padding: 20px;
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
</head>
<body>
    <form method="Post">
          <div class="nav">
	<h1 align="center"> Password Reset</h1>
        </div>
	
		<center>
	<div class="container">
	<h4> We found your account </h4>

<%
    try{
             String userid=session.getAttribute("User_Id").toString();
            
            session.setAttribute("userid",userid);
            DbConnection obj = new DbConnection();
            Statement st = obj.c.createStatement();
            
            ResultSet rs=st.executeQuery("select * from buyer where uid='"+userid+"'");
            rs.next();
            out.println(rs.getString(1));
            %>
            <h4> Kindly enter the answer to the given security question you have entered while registering</h4></br>
            Question:
            <%
            out.print(rs.getString("security_question"));
            %>
            </br> <input type="text" name="answer" placeholder="Enter answer" required/></br>
	<button class="button1" name="submitbtn"><span>Submit</span></button></br> </br>
	
	</div>
	</center>
<%
    try{
        if(request.getParameter("submitbtn")!=null)
        {
           String ans=request.getParameter("answer"); 
           if(rs.getString("security_answer").equalsIgnoreCase(ans))
            {
                response.sendRedirect("password_set_buyer.jsp");
            }
            else
            {
                out.println("<script>alert('Wrong Answer')</script> ");
            }
        }
}catch (Exception e) {
        e.printStackTrace();
    }
    rs.close();
    st.close();
    obj.c.close();
    }catch (Exception ex) {
        ex.printStackTrace();
    }
  %>       
    </form>
</body>
</html>
