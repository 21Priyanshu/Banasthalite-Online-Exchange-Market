/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import myproject.DbConnection;

@MultipartConfig
public class RntAddItem extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String name=request.getParameter("ritemname");
           Part img =request.getPart("ritemphotos");
           String desc=request.getParameter("rdescription");
            int price=Integer.parseInt(request.getParameter("rprice"));
            String category=request.getParameter("rcategory");
            
            
            try{
            String savePath="";
            String SAVE_DIR="images";
            String path="C:\\Users\\vidya raj\\Documents\\NetBeansProjects\\sellerReg\\web" + File.separator+ SAVE_DIR;
            File file=new File(path);
            file.mkdir();
            String fileName = img.getSubmittedFileName();
            OutputStream out1 = null;
            InputStream filecontent = null;
            out1 = new FileOutputStream(new File(path + File.separator
                + fileName));
            filecontent = img.getInputStream();
            int read = 0;
            final byte[] bytes = new byte[1024];
            while ((read = filecontent.read(bytes)) != -1)
            {
                out1.write(bytes, 0, read);
                savePath=path+File.separator+fileName;
            }
            String DirPlusFileName=null;
            DirPlusFileName=SAVE_DIR+File.separator+fileName;
            DbConnection obj=new DbConnection();
            PreparedStatement ps=obj.c.prepareStatement("insert into rent(ritemname,uid,ritemphotos,rdescription,rprice,rcategory,ritem_available) values(?,?,?,?,?,?,?)");
            System.out.println(path);
//            String u=session.getAttribute("userId").toString();
            HttpSession session=request.getSession(false);  
            String id=(String)session.getAttribute("userId");  
            ps.setString(1, name);
            ps.setString(2,id);
            ps.setBoolean(7, true);
            ps.setInt(5, price); 
            ps.setString(6,category);
            ps.setString(4,desc);
            ps.setString(3,DirPlusFileName);
            int i=ps.executeUpdate();
        System.out.println("Inserted Successfully");
            if(i==1)
            {
                System.out.println("Item added successfully");
                 response.sendRedirect("rindex.jsp");
                out.print("<h1>Item Added Successfully</h1>");
            }
            else
                System.out.println("Error occured");
            }
            catch(Exception e)
            {
             e.printStackTrace();
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
