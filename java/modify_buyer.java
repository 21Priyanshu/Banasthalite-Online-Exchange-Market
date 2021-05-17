/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import myproject.DbConnection;

/**
 *
 * @author Lenovo
 */
public class modify_buyer extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String bname=request.getParameter("sname");
            String bvid=request.getParameter("uid");
//            String p=request.getParameter("password");
            String eid=request.getParameter("emailid");
            String course=request.getParameter("course");
            String b=request.getParameter("branch");
            int sem=Integer.parseInt(request.getParameter("sem"));
            String hostel=request.getParameter("hostel");
            int rno=Integer.parseInt(request.getParameter("roomno"));
            String cno=request.getParameter("contact");
            DbConnection obj=new DbConnection();
            try{
            PreparedStatement ps=obj.c.prepareStatement("update buyer set bname=?,email=?,course=?,branch=?,sem=?,hostel=?,roomno=?,contact=? where uid=?");
//            PreparedStatement ps=obj.c.prepareStatement("insert into seller values(?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, bname);
            ps.setString(2, eid);
            ps.setString(3, course);
            ps.setString(4, b);
            ps.setInt(5, sem);
            ps.setString(6, hostel);
            ps.setInt(7, rno);
            ps.setString(8, cno);
            ps.setString(9,bvid);
            int i=ps.executeUpdate();
            if(i==1)
                response.sendRedirect("b_index.jsp");
            else
                response.sendRedirect("error.jsp");
          }catch(Exception e){
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
