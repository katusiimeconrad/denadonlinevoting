package com.kon;
import java.io.*;
import java.sql.*;
import com.kon.DB.*;

import javax.servlet.*; 
import javax.servlet.http.*; 

public class LoginDB extends HttpServlet { 
    /*
    public Boolean works() throws SQLException, InstantiationException, IllegalAccessException {
        String dbURL = "jdbc:mysql://localhost:3306/kone";
        String username = "sean";
        String password = "nalwanga";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch( ClassNotFoundException e ) {
            e.printStackTrace();
        }

        
        Connection con = DriverManager.getConnection( dbURL, username, password );

       if ( con != null ) {
           return true ;
       }
       else return false;
    } */

    public void doGet ( HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            DB a = new DB();

            try {
                if( a.initiateConnection() != null ) {
                    out.println("Connected!");
                }
            } catch( SQLException e ){
                out.println(e);
            } catch ( InstantiationException b) {
                out.println(b);
            } catch ( IllegalAccessException x) {
                out.println(x);
            }
            
    }

    public void doPost ( HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
            doGet(request, response);
            
    }
     
}