package com.denad;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.http.*;

import com.denad.DB.*;

public class LoginDB extends HttpServlet { 
    /*
        This class servlet is for testing connection. It uses the DB class to connect.
        Configure DB.java .
        **********Yet to fix

    */

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