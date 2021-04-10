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
        <title>buyer home</title>
        <link href="css/sample.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-growl/1.0.0/jquery.bootstrap-growl.min.js" integrity="sha512-pBoUgBw+mK85IYWlMTSeBQ0Djx3u23anXFNQfBiIm2D8MbVT9lr+IxUccP8AMMQ6LCvgnlhUCK3ZCThaBCr8Ng==" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
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
            <div class="dropdown nav">
                <button >Login
                </button>
                <div class="dropdown-content">
                    <a href="#">Seller</a>
                </div>
            </div>
        </div>
        <div class="bg_container">
            <div class="vertical">
                <ul>
                    <li><a href="b_index.jsp">Display Item</li>
                    <li><a href="wishlist.jsp">Wishlist</a></li>
                    <li>Profile</li>
                    <li>Logout</li>
                </ul>
            </div>
            <div class="display" >
                <%
                      
                    try {
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/project");
                        Statement stmt1 = conn.createStatement();
                        ResultSet rs = stmt1.executeQuery("select * from item where item_available='True" + "'");
                        while (rs.next()) {%>
                <div class="container">
                    <div class="item">
                        <div class="img">
                            <%
                                out.print("<img src=" + rs.getString(4) + " width='100%' height='100%' alt='Tulips'/>");
                            %>
                        </div>
                        <div>
                            <%
                                out.print("<p>" + rs.getString(2) + "<p>");
                                out.print("<p>" + rs.getString(6) + "</p>");
                                out.print("<p>" + rs.getString(5) + "</p>");
                            %>
                        </div>
<!--                        <form action="addwishlist">-->
<!--                            <form>-->
                        
                        <button class="btn btn-primary" onclick="bootstrapAlert()" name="addwishlist" value="<%out.print(rs.getString(1));%>">
                                add to wishlist
                        </button>
<!--                        </form>-->

                        
                        <form action="buy">
                            <button name="buy" value="<%out.print(rs.getString(1));%>">
                                Buy
                            </button>
                        </form>
                        <%}%>
                    </div>
                </div>
                <%
                    } catch (Exception ex) {
                        out.println(ex);
                    }
                %> 

            </div>
        </div>  
      <script>
        function bootstrapAlert(){
            $(".bootstrap-growl").remove();
            // $.bootstrapGrowl("another message, yay!");
    $.bootstrapGrowl("Added successfully", {

  type: 'success', // (null, 'info', 'danger', 'success')
  offset: {from: 'top', amount: 25}, // 'top', or 'bottom'
  align: 'center', // ('left', 'right', or 'center')
  width: 250, // (integer, or 'auto')
  delay: 10000, // Time while the message will be displayed. It's not equivalent to the *demo* timeOut!
  allow_dismiss: true, // If true then will display a cross to close the popup.
  stackup_spacing: 10 // spacing between consecutively stacked growls.
});
}

    </script>  
    </body>
</html>

<%
    if (request.getParameter("addwishlist") != null)
{
//response.setContentType("text/html;charset=UTF-8");
      //  HttpSession session=request.getSession(false);
         String u=session.getAttribute("userId").toString();
//         String n=(String)session.getAttribute("uname");  
//        try (PrintWriter out = response.getWriter()) {

            int id=Integer.parseInt(request.getParameter("addwishlist"));
            System.out.print(id);
            DbConnection obj=new DbConnection();
            try {
                PreparedStatement ps=obj.c.prepareStatement("insert into wishlist values (?,?)");
                ps.setString(1,u);
                ps.setInt(2, id);
                ps.executeUpdate();
//                String primessage="Added Succesfully";
//                session.setAttribute("msg",primessage);
//                response.sendRedirect("b_index.jsp");
                } 
catch (SQLException ex) {
                Logger.getLogger(delete.class.getName()).log(Level.SEVERE, null, ex);
            }
      
}
       
}
 %>
