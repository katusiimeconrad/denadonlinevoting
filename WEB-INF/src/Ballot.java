package com.denad;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class UpdatePasswordServlet extends HttpServlet {

    @Override
    public void doPost (HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

        String newPassword = (String) request.getParameter("NewPassword");
        String stdNo = (String) request.getParameter("StudentNumber");
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

            
            /* Get the candidates */
            String query = "SELECT"




            





















        }

        catch ( SQLException | ClassNotFoundException e ){
            out.println(e);
        }


        

            
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        doPost(request, response);
    }


}