<%-- 
    Document   : storeimg
    Created on : 9 Mar, 2021, 4:45:51 PM
    Author     : HP
--%>
import javax.servlet.annotation.MultipartConfig;
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="myprojectdb.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
@MultipartConfig(fileSizeThreshold=1024*1024*2,
                   maxFileSize = 1024*1024*10,
                   maxRequestSize =1024*1024*50);

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   <%-- <body>
        <%
            String itemid=request.getParameter("itemid");
            File smallFile = new File("Photos");
      int smallFileLength = (int) smallFile.length();
      InputStream smallStream = (InputStream) new FileInputStream(smallFile);
            DbConnection obj=new DbConnection();
            PreparedStatement ps=obj.c.prepareStatement("insert into photo values(?,?)");
            
            ps.setString(1, itemid);
            ps.setBinaryStream(2, smallStream, smallFileLength);
            int i=ps.executeUpdate();
            if(i==1)
                out.println("Welcome "+itemid);
            else
                response.sendRedirect("error.jsp");
        %>
        
    </body>--%>
   
    <body>
    <%
            String itemid=request.getParameter("itemid");
            InputStream inputStream = null;
            Part filePart = request.getPart("Photos");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
              
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
           
            DbConnection obj=new DbConnection();
            PreparedStatement ps=obj.c.prepareStatement("insert into photo values(?,?)");
            
            ps.setString(1, itemid);
            if(inputStream!= null) {
                // fetches input stream of the upload file for the blob column
                ps.setBlob(3, inputStream);
            }
 
            // sends the statement to the database server
           
            int i=ps.executeUpdate();
            if(i==1)
                out.println("Welcome "+itemid);
            else
                response.sendRedirect("error.jsp");
        %>
    </body>
</html>
