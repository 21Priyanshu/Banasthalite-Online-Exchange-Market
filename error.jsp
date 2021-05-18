<%-- 
    Document   : error
    Created on : 17 Nov, 2020, 7:42:19 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <style>
             .noitem{
                position: fixed;
                /*width: 1000px;*/
                text-align: center;
                background-color: rgba(0,0,0,0.4);
                /*background-color: #555;*/
                color: white;
                padding: 30px;
                margin-top: 15%;
                margin-left: 45%;
            }
            a
            {
                position:absolute;
                top:63%;
                left:45%;
                font-size: 20px;
                
            }
         </style>
    </head>
    <body>
         <div class="noitem">

                        <i class="fa fa-frown-o" style="font-size:48px;"></i>
                        <h3>Oops!!</h3>
                        <p>Error Occured!!!</p>
                        <p>Invalid Username or Password</p>
                        <!--                            <a href=#mymodal data-toggle="modal"> Click here to Add Item</a>-->
                    </div>
        <a href="MasterReupdatd.jsp">Login again</a>
        
    </body>
</html>
