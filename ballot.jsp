// Query the Database for candidates and make a result set object

package com.denad;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;




public class LoginServlet extends HttpServlet {
    @Override
    public void doPost ( HttpServletRequest request , HttpServletResponse response ) throws ServletException, IOException {
        
        String stdNo = (String) request.getParameter("StudentNumber");
        String pwd = (String) request.getParameter("Password");
        
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        
        try {
            String dbURL = "jdbc:mysql://localhost:3306/nad";
            String dbUname = "sean";
            String dbPass = "nalwanga";

            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection( dbURL, dbUname, dbPass);

            Statement st = con.createStatement();

            //Check for student Number
            String query = "select * from users where IsCandidate=1 groupby='position';";

            ResultSet rs = st.executeQuery(query);

            if( rs.next() ){
                //if true , this implies that the student number exists.
                //next check if this is an initial Login
                out.println("<form>");
                while( rs.next() ){
                    out.println
                    out.println("")
                } 
                out.println("</form>");
                    
            }
            else {
                String Error = "<div class='alert alert-danger' role='alert'>No Candidates Have Been Added Yet/div>";
                //request.setParameter("Error",  Error );
                RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                rd.forward( request , response);
                
                
            }

        
        }
        catch( SQLException | ClassNotFoundException e) {
            out.println(e);
        }

    
        
       
    }

    public void doGet ( HttpServletRequest request , HttpServletResponse response ) throws ServletException, IOException {
        doPost( request, response );
    }
    








}
