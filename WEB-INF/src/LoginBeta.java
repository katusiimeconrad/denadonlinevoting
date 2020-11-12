package com.kon;
import java.io.*; 
import javax.servlet.*; 
import javax.servlet.http.*; 
import java.sql.*;

public class LoginBeta extends HttpServlet { 
    public void doPost ( HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
            
            String email =(String) request.getParameter("email");
            String password = (String) request.getParameter("password");
            
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            
            try {
                String dbURL = "jdbc:mysql://localhost:3306/kone";
                String dbUname = "sean";
                String dbPass = "nalwanga";

                Class.forName("com.mysql.jdbc.Driver");

                Connection con = DriverManager.getConnection( dbURL, dbUname, dbPass );
                Statement st = con.createStatement();

                String query = "SELECT * FROM users WHERE email='"+ email +"' AND password='"+ password +"'";

                ResultSet rs = st.executeQuery(query);

                if( rs.next()){
                   // out.println("Howdy , " + rs.getString("name"));
                    String username = rs.getString("name");
                    HttpSession session = request.getSession();

                    session.setAttribute("username" , username );


                    RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
                    rd.forward( request, response );


                }
                else {
                    //out.println("Invalid Login Credentials");
                    RequestDispatcher rd = request.getRequestDispatcher("/Login.htm");
                    rd.forward( request, response );

                }
            }   catch( SQLException | ClassNotFoundException e ){
                out.println(e);
            } 
    }

    public void doGet ( HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

            doPost(request, response);
            
    }
     
}