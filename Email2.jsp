<%-- 
    Document   : Email2
    Created on : Apr 19, 2021, 8:53:25 PM
    Author     : Lenovo
--%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    if (request.getParameter("btn_email") != null)
{
//Creating a result for getting status that messsage is delivered or not!
String result;

// Get recipient's email-ID, message & subject-line from mail.html page
final String to = request.getParameter("mail");
final String subject = request.getParameter("sub");
final String messg = request.getParameter("mess");

// Sender's email ID and password needs to be mentioned
final String from = "banasthalitemarket@gmail.com";
final String pass = "banasthalite1234@";

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


    </body>
</html>
