package com.denad;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class UpdatePasswordServlet extends HttpServlet {

    @Override
    public void doPost (HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

        //String newPassword = (String) request.getParameter("NewPassword");
        HttpSession session = request.getSession();
        String stdNo = (String) session.getAttribute("StudentNumber");
        String newPassword = (String) session.getAttribute("NewPassword");
        //The parameter value must have changed.

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        //May not be needed
        
        try {
            String dbURL = "jdbc:mysql://localhost:3306/nad";
            String dbUname = "sean";
            String dbPass = "nalwanga";

            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection( dbURL, dbUname, dbPass);

            Statement st = con.createStatement();

            //The ENCRYPTION SETTINGS
            String keyStr = "SHA2('allanbronsonconrad', 512)";
            String query = "UPDATE Users SET Password=AES_ENCRYPT('" + newPassword + "', " + keyStr + "), IsInitialLogin=0 WHERE StudentNo='"+ stdNo +"';";
            out.println(query);
            int co = st.executeUpdate(query);
            
            if( co == 1 ) {

                RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");

                out.println("<div class='alert alert-success'> Password Upadated Successfully. Please Login with your new Password</div>");
                
                rd.include(request, response);

            }

            else {
                out.println("<h1>Failed....</h1>");
            }
            
        }

        catch ( SQLException | ClassNotFoundException e ){
            out.println(e);
        }


        

            
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        doPost(request, response);
    }


}