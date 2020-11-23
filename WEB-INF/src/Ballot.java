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
            String query = "select * from users where IsCandidate=1s;";

            ResultSet rs = st.executeQuery(query);

            
            if( rs.next() ){
                //if true , this implies that the student number exists.
                //next check if this is an initial Login
                if( rs.getBoolean("IsInitialLogin") ) {
                    //If True - we now check if the email address provided is valid for this student number

                    if( pwd.equals( rs.getString("Email") )  ) {
                        //If True, we forward the user to password jsp to create their password

                        RequestDispatcher rd = request.getRequestDispatcher("/password.jsp");
                        rd.forward( request , response);
                        // the password.jsp will also forward the request to login.

                    }
                    else {
                        //We print an error message to the user

                        out.println("<div class='alert alert-danger' role='alert'>Invalid Login Credentials</div>");
                        RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                        rd.include( request , response);
                    }
                }


                else {

                    String queryPassword = "SELECT * FROM Users WHERE StudentNo=" + stdNo ;// + " and Password = AES_ENCRYPT(" + pwd + ", SHA2('allanbronsonconrad', 512))";
                    //select * from users where StudentNo='1800700856' and Password = AES_ENCRYPT('kone', SHA2('allanbronsonconrad', 512));
                    ResultSet rsn = st.executeQuery(queryPassword);


                    //If it's not the initial login i.e. after user has updated their password, then, we check for this password
                    if( rsn.next()){

                        //if true, we create the user's session
                        HttpSession session = request.getSession();

                        //Include User Information in the Session object
                        session.setAttribute("FirstName", rsn.getString("FirstName"));
                        session.setAttribute("LastName", rsn.getString("LastName"));

                        RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
                        rd.forward( request, response );
                        //forward the user to the homepage

                    }

                    else {
                        out.println("<div class='alert alert-danger' role='alert'>Login With Password</div>");
                        RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                        rd.include( request , response);
                    }
                
                
                }

                
            }
            else {
                String Error = "<div class='alert alert-danger' role='alert'>Invalid Login Credentials</div>";
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
