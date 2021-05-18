<%-- 
    Document   : MasterReupdated
    Created on : May 17, 2021, 1:45:32 PM
    Author     : vidya raj
--%>
<!doctype html>
<html>
    <head>
        <title> Master Page </title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="MasterpReupdatd.css" type="text/css" rel="stylesheet"> 
        <style></style>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <a class="navbar-brand" href="#about">About Us</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href=#emailmodal data-toggle="modal" >Contact Us <span class="sr-only">(current)</span></a>
                        </li>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="help.html"  >Help <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Login
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href=#mymodal data-toggle="modal">Seller</a>
                                <a class="dropdown-item" href=#mymodal2 data-toggle="modal" >Buyer</a> 
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                SignUp
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href=#mymodalreg data-toggle="modal">Seller</a>
                                <a class="dropdown-item" href=#mymodalreg2 data-toggle="modal">Buyer</a> 
                            </div>
                        </li>
                    </ul>
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
                    <div class="modal" id="mymodal2">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <img src ="images\Banasthali_Vidyapeeth_Logo.png" height=40px width=40px /> &nbsp;
                                    <h3 class="text-center">Buyer Login</h3>
                                    <button type="button" class="close" data-dismiss="modal"> &times;</button> 
                                </div>
                                <div class="modal-body">
                                    <form action="buyer_login.jsp" method="post">
                                        <div class="form-group row">
                                            <label for="inputPassword" class="col-sm-2 col-form-label"><h6>UserID </h6></label>
                                            <div class="col-sm-10">
                                                <input type="text" name="uid"  class="form-control" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputPassword" class="col-sm-2 col-form-label"><h6>Password </h6></label>
                                            <div class="col-sm-10">
                                                <input type="password" name="password"  class="form-control" size=40 required/>
                                            </div>
                                        </div>
                                        <div class="modal-footer justify-content-center">
                                            <button type="submit" class="btn btn-primary"" > Login</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal" id="mymodalreg">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <img src ="images\Banasthali_Vidyapeeth_Logo.png" height=40px width=40px /> &nbsp;
                                    <h3 class="text-center">Seller Registration</h3>
                                    <button type="button" class="close" data-dismiss="modal"> &times;</button> 
                                </div>
                                <div class="modal-body">
                                    <form action="seller_registration.jsp" onsubmit= "return validate()">
                                        <div class="form-group row">
                                            <label for="name" class="col-sm-2 col-form-label"> <h6> Name </h6></label>
                                            <div class="col-sm-10">	
                                                <input type="text" name="sname" class="form-control" required>
                                            </div> 
                                        </div>
                                        <div class="form-group row">
                                            <label for="user_id" class="col-sm-2 col-form-label" > <h6> UserID </h6></label>
                                            <div class="col-sm-10">	
                                                <input type="text" name="uid" id="userId" class="form-control" required><div id="f1"></div>
                                            </div> 
                                        </div> 
                                        <div class="form-group row">
                                            <label for="password" class="col-sm-2 col-form-label" > <h6> Password </h6></label>
                                            <div class="col-sm-10">	
                                             <input type="password" name="password" id= "pass" class="form-control" size=30 required/><div id="f2"></div>
                                            </div>
                                        </div> 
                                        <div class="form-group row">
                                            <label for="password" class="col-sm-2 col-form-label" > <h6> Re_enter</h6></label>
                                            <div class="col-sm-10">	
                                              <input type="password" name="rpassword" id="cpass" class="form-control" size=30 required/><div id="f3"></div>
                                            </div>
                                        </div> 
                                        <div class="form-group row">
                                            <label for="email" class="col-sm-2 col-form-label" > <h6> Email </h6></label>
                                            <div class="col-sm-10">	
                                                <input type="email" name="emailid" id="email" class="form-control" required>
                                            </div> 
                                        </div> 
                                        <div class="form-group row">
                                            <label for="course" class="col-sm-2 col-form-label" > <h6> Course </h6></label>
                                            <div class="col-sm-10">	
                                                <input type="text" name="course" class="form-control" required>
                                            </div> 
                                        </div> 
                                        <div class="form-group row">
                                            <label for="branch" class="col-sm-2 col-form-label" > <h6> Branch </h6></label>
                                            <div class="col-sm-10">	
                                                <input type="text" name="branch" class="form-control" required>
                                            </div> 
                                        </div> 
                                        <div class="form-group row">
                                            <label for="sem" class="col-sm-2 col-form-label" > <h6> Semester</h6></label>
                                            <div class="col-sm-10">	
                                                <input type="number" name="sem" class="form-control" required>
                                            </div> 
                                        </div> 
                                        <div class="form-group row">
                                            <label for="hostel" class="col-sm-2 col-form-label" > <h6> Hostel </h6></label>
                                            <div class="col-sm-10">	
                                                <input type="text" name="hostel" class="form-control" required>
                                            </div> 
                                        </div> 
                                        <div class="form-group row">
                                            <label for="roomno" class="col-sm-2 col-form-label" > <h6> Room_No </h6></label>
                                            <div class="col-sm-10">	
                                                <input type="number" name="roomno" class="form-control" required>
                                            </div> 
                                        </div> 
                                        <div class="form-group row">
                                            <label for="contact" class="col-sm-2 col-form-label" > <h6> Mobile</h6></label>
                                            <div class="col-sm-10">	
                                                <input type="tel" name="contact" id="contact" class="form-control"  pattern="[1-9]{1}[0-9]{9}" required>
                                            </div> 
                                        </div> 
                                        <div class="modal-footer justify-content-center">
                                            <button type="submit" class="btn btn-primary " onClick="validate(this.form)" > Sign UP</button>
                                        </div>
                                    </form> 
                                </div>
                            </div>
                         </div>
                    </div>
                    <div class="modal" id="mymodalreg2">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <img src ="images\Banasthali_Vidyapeeth_Logo.png" height=40px width=40px /> &nbsp;
                                    <h3 class="text-center">  Buyer Registration</h3>
                                    <button type="button" class="close" data-dismiss="modal"> &times;</button> 
                                </div>
                                <div class="modal-body">
                                    <form action="buyer_registration.jsp" >
                                        <div class="form-group row">
                                            <label for="name" class="col-sm-2 col-form-label"> <h6> Name </h6></label>
                                            <div class="col-sm-10">	
                                                <input type="text" name="bname" class="form-control" required>
                                            </div> 
                                        </div>
                                        <div class="form-group row">
                                            <label for="user_id" class="col-sm-2 col-form-label" > <h6> UserID </h6></label>
                                            <div class="col-sm-10">	
                                                <input type="text" name="uid" id="user" class="form-control" required><div id="f4"></div>
                                            </div> 
                                        </div> 
                                        <div class="form-group row">
                                            <label for="password" class="col-sm-2 col-form-label" > <h6> Password </h6></label>
                                            <div class="col-sm-10">	
                                               <input type="password" name="password" id="pass1" class="form-control" size=30 required/><div id="f5"></div>
                                            </div>
                                        </div> 
                                         <div class="form-group row">
                                            <label for="password" class="col-sm-2 col-form-label" > <h6> Re_enter</h6></label>
                                            <div class="col-sm-10">	
                                              <input type="password" name="rpassword" id="cpass1" class="form-control" size=30 required/><div id="f6"></div>
                                            </div>
                                         </div>
                                        <div class="form-group row">
                                            <label for="email" class="col-sm-2 col-form-label" > <h6> Email </h6></label>
                                            <div class="col-sm-10">	
                                                <input type="email" name="emailid" id="email1" class="form-control" required>
                                            </div> 
                                        </div> 
                                        <div class="form-group row">
                                            <label for="course" class="col-sm-2 col-form-label" > <h6> Course </h6></label>
                                            <div class="col-sm-10">	
                                                <input type="text" name="course" class="form-control" required>
                                            </div> 
                                        </div> 
                                        <div class="form-group row">
                                            <label for="branch" class="col-sm-2 col-form-label" > <h6> Branch </h6></label>
                                            <div class="col-sm-10">	
                                                <input type="text" name="branch" class="form-control" required>
                                            </div> 
                                        </div> 
                                        <div class="form-group row">
                                            <label for="sem" class="col-sm-2 col-form-label" > <h6> Semester</h6></label>
                                            <div class="col-sm-10">	
                                                <input type="number" name="sem" class="form-control" required>
                                            </div> 
                                        </div> 
                                        <div class="form-group row">
                                            <label for="hostel" class="col-sm-2 col-form-label" > <h6> Hostel </h6></label>
                                            <div class="col-sm-10">	
                                                <input type="text" name="hostel" class="form-control" required>
                                            </div> 
                                        </div> 
                                        <div class="form-group row">
                                            <label for="roomno" class="col-sm-2 col-form-label" > <h6> Room_No </h6></label>
                                            <div class="col-sm-10">	
                                                <input type="number" name="roomno" class="form-control" required>
                                            </div> 
                                        </div> 
                                        <div class="form-group row">
                                            <label for="contact" class="col-sm-2 col-form-label" > <h6> Mobile </h6></label>
                                            <div class="col-sm-10">	
                                                <input type="tel" name="contact" id="contact1" class="form-control"  pattern="[1-9]{1}[0-9]{9}" required>
                                            </div> 
                                        </div> 
                                        <div class="modal-footer justify-content-center">
                                                <button type="submit" class="btn btn-primary " onClick="validateform(this.form)"> Sign UP</button>
                                        </div>
                                    </form>
                                            </div>
                                            </div>
                                            </div>
                    </div>
                    <div class="modal" id="emailmodal">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <img src ="images\Banasthali_Vidyapeeth_Logo.png" height=40px width=40px /> &nbsp;
                                    <h3 class="text-center">Drop Your Query</h3>
                                    <button type="button" class="close" data-dismiss="modal"> &times;</button> 
                                </div>
                                <div class="modal-body">
                                    <form action="Email2.jsp">
                                        <div class="form-group row">
                                            <label for="mail" class="col-sm-2 col-form-label"><h6>To</h6></label>
                                            <div class="col-sm-10">
                                                <input type="text" name="mail" class="form-control" placeholder="banasthalitemarket@gmail.com" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="sub" class="col-sm-2 col-form-label"><h6>Subject </h6></label>
                                            <div class="col-sm-10">
                                                <input type="text" name="sub" class="form-control" size=40 required/>
                                            </div>
                                        </div> 
                                        <div class="form-group row">
                                            <label for="sub" class="col-sm-2 col-form-label"><h6>Message</h6></label>
                                            <div class="col-sm-10">
                                                <textarea name="mess" class="form-control" cols="20" rows="5" size=40 required/> </textarea>
                                            </div>
                                        </div>
                                            <div class="modal-footer justify-content-center">
                                                <button class="btn btn-primary" name="btn_email"  > Email</button>
                                            </div>

                                       </form>
                                 </div>
                                            
                                            </div>
                                            </div>
                                            </div>
            </nav>
        </header>
        <div id="bckimg">
            <img src ="images\background-2.jpg" height=850px width=100% /> 
            <div class="wname">Banasthalite Online Exchange Market</div>
            <!--<div class="logo">
                    <img src ="images\Banasthali_Vidyapeeth_Logo.png" height=80px width=80px /> 
            </div> -->
            <div id="about">
                <div class="abouth"> ABOUT US </div>
                <p>Banasthalite Online Exchange Market is a website for easy exchange of goods among students of Banasthali.
                    At present the buyer has no way to search for the second hand goods at feasible price and also the seller
                    has to go hostel to hostel to sell and rent their second hand goods. So, to resolve this issue this website is developed 
                    so that a seller can post their items and buyer can easily find items of their need.</p>
            </div>
        </div> 
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
			function validate(){
				var ID=document.getElementById("userId").value;
				var Pass=document.getElementById("pass").value;
				var CPass=document.getElementById("cpass").value;
                                var Mail=document.getElementById("email").value;
                                var phno=document.getElementById("contact").value;
				var idRGEX=/^[A-Z]{5}[0-9]{5}$/;
                                var mailRGEX=/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
                                            	var phRGEX=/^[1-9][0-9]{9}$/;
				if(idRGEX.test(ID)==false || ID == ""){
					document.getElementById("f1").innerHTML="Please enter your Banasthali id.";
					return false;
				}
				else{
					document.getElementById("f1").innerHTML="";
				}
				if(Pass == ""){
					document.getElementById("f2").innerHTML="Please enter your password." ;
					return false;
				}
				if(Pass.length<8){
					document.getElementById("f2").innerHTML="Password must be of at least 8 characters long." ;
					return false;
				}
				if(Pass.search(/[a-z]/) == -1){
					document.getElementById("f2").innerHTML="There must be at least 1 lowercase character." ;
					return false;
				}
				if(Pass.search(/[A-Z]/) == -1){
					document.getElementById("f2").innerHTML="There must be  at least 1 uppercase character." ;
					return false;
				}
				if(Pass.search(/[!\@\#\$\_\-\~\.]/) == -1){
					document.getElementById("f2").innerHTML="There must be at least 1 special symbol." ;
					return false;
				}
				else{
					document.getElementById("f2").innerHTML="";
				}
				if(CPass!=Pass){
					document.getElementById("f3").innerHTML="Password not matched!! Please re-enter your correct password.";
					return false;
				}
				else{
					document.getElementById("f3").innerHTML="";
				}
                                if(mailRGEX.test(Mail)==false || Mail == ""){
                                                        	alert("Please enter a valid email address.");
                                                        	return false;
                                            	}
                                            	if(phRGEX.test(phno)==false || phno == ""){
                                            	        	alert("Please enter a valid contact number of 10 digits.");
                                                        	return false;
                                            	}
				return true;
			}
		</script>
                 <script>
			function validateform(){
				var ID=document.getElementById("user").value;
				var Pass=document.getElementById("pass1").value;
				var CPass=document.getElementById("cpass1").value;
                                var Mail=document.getElementById("email1").value;
                                var phno=document.getElementById("contact1").value;
				var idRGEX=/^[A-Z]{5}[0-9]{5}$/;
                                var mailRGEX=/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
                                            	var phRGEX=/^[1-9][0-9]{9}$/;
				if(idRGEX.test(ID)==false || ID == ""){
					document.getElementById("f4").innerHTML="Please enter your Banasthali id.";
					return false;
				}
				else{
					document.getElementById("f4").innerHTML="";
				}
				if(Pass == ""){
					document.getElementById("f5").innerHTML="Please enter your password." ;
					return false;
				}
				if(Pass.length<8){
					document.getElementById("f5").innerHTML="Password must be of at least 8 characters long." ;
					return false;
				}
				if(Pass.search(/[a-z]/) == -1){
					document.getElementById("f5").innerHTML="There must be at least 1 lowercase character." ;
					return false;
				}
				if(Pass.search(/[A-Z]/) == -1){
					document.getElementById("f5").innerHTML="There must be  at least 1 uppercase character." ;
					return false;
				}
				if(Pass.search(/[!\@\#\$\_\-\~\.]/) == -1){
					document.getElementById("f5").innerHTML="There must be at least 1 special symbol." ;
					return false;
				}
				else{
					document.getElementById("f5").innerHTML="";
				}
				if(CPass!=Pass){
					document.getElementById("f6").innerHTML="Password not matched!! Please re-enter your correct password.";
					return false;
				}
				else{
					document.getElementById("f6").innerHTML="";
				}
                                if(mailRGEX.test(Mail)==false || Mail == ""){
                                                        	alert("Please enter a valid email address.");
                                                        	return false;
                                            	}
                                            	if(phRGEX.test(phno)==false || phno == ""){
                                            	        	alert("Please enter a valid contact number of 10 digits.");
                                                        	return false;
                                            	}
				return true;
			}
		</script>
    </body>
</html>

