



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %> 


<html>
    <head>
        <title>Email</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="emailupdated.css" type="text/css" rel="stylesheet">
    </head>
    <body>
	<section>
		<div id="logo">
	<img src ="images\Banasthali_Vidyapeeth_Logo.png" height=80px width=80px /> 
	</div>
		<div class="container">
		<form action="" method="post">
				<div class="form-group">
					<label for="name">  To: </label>
					<input type="text" id="mail" name="mail" required>
				</div>
				<div class="form-group">
					<label for="name">  Subject: </label>
					<input type="text" id="sub" name="sub" required>
				</div>
				<div class="form-group">
					<label for="message">Message</label>
					<textarea name="mess" id="mess" cols="20" rows="5"> </textarea>
				</div>
				<!-- <button type="submit">Submit</button>
      <div>TODO write content</div>
        <form name="emailForm" method="post"> -->


</br>
<input type="submit" value="Send" name="btn1">&nbsp
<input type="reset" value="Reset">

</form> </div> </section>
</body>
</html>



<%
    if (request.getParameter("btn1") != null)
{
//Creating a result for getting status that messsage is delivered or not!
String result;

// Get recipient's email-ID, message & subject-line from mail.html page
final String to = request.getParameter("mail");
final String subject = request.getParameter("sub");
final String messg = request.getParameter("mess");

// Sender's email ID and password needs to be mentioned
final String from = "priyanshusingh0872@gmail.com";
final String pass = "";

// Defining the gmail host
String host = "smtp.gmail.com";

// Creating Properties object
Properties props = new Properties();

// Defining properties
props.put("mail.smtp.ssl.enable", "true");
props.put("mail.smtp.host", host);
props.put("mail.transport.protocol", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.user", from);
props.put("mail.password", pass);
props.put("mail.port", "465"); // there are some other ports also available

// Authorized the Session object.
Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
@Override
protected PasswordAuthentication getPasswordAuthentication() {
return new PasswordAuthentication(from, pass);
}
});

try {
// Create a default MimeMessage object.
MimeMessage message = new MimeMessage(mailSession);

// Set From: header field of the header.
message.setFrom(new InternetAddress(from));

// Set To: header field of the header.
message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

// Set Subject: header field
message.setSubject(subject);

// Now set the actual message
message.setText(messg);

// Send message
Transport.send(message);
result = "Your mail sent successfully....";
out.println(result);
} catch (MessagingException mex) {
mex.printStackTrace();
result = "Error: unable to send mail....";
out.println(mex);
out.println(result);}
}

 %>

