package com.denad;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class Ballot extends HttpServlet {

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
            int counter = 0;
            String[] dbPosts = new String[13];
            dpPosts.length = 0;

            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection( dbURL, dbUname, dbPass);
            Statement st = con.createStatement();

            String getPosts = "SELECT DISTINCT POST FROM USERS;";

            ResultSet rs1 = st.executeQuery(getPosts);

            while( rs1.next()){
                dbPosts[counter] = rs1.getString("Post");
                counter = counter + 1;
            }
            
            out.println("<form method='POST' action='tally.jsp'>");

            for(counter = 0; counter < dbPosts.length; counter = counter + 1 ){
                String query = "SELECT * FROM USERS WHERE IsCandidate=1 AND POST='"+dbPosts[counter]+"';";
                ResultSet rs = st.executeQuery(query);
                out.println("<h1>"+dbPosts[counter]+"</h1>");
                out.println("<table class='table-responsive'>");
                out.println("<thead>");
                out.println("<tr>");
                out.println("<th>Candidate StudentNo</th>");
                out.println("<th>Candidate Name</th>");
                out.println("<th>Candidate Course</th>");
                out.println("<th>Candidate College</th>");
                out.println("<th>Candidate Post</th>");
                out.println("<th>Vote</th>");
                out.println("</tr>");
                out.println("</thead>");
                out.println("<tbody>");

                while(rs.next()){
                    out.println("<tr>");
                    out.println("<td>"+rs.getString("StudentNo")+"</td>");
                    out.println("<td>"+rs.getString("FirstName")+" "+rs.getString("LastName")+"</td>");
                    out.println("<td>"+rs.getString("Course")+"</td>");
                    out.println("<td>"+rs.getString("College")+"</td>");
                    out.println("<td>"+rs.getString("Post")+"</td>");
                    out.println("<td><input type='radio' name='"+rs.getString("Post")+"'></td>");
                    out.println("</tr>");
                }

                out.println("</tbody>");
                out.println("</table>");
                
            }
            out.println("<button>Submit</button>");
            out.println("</form>");

        }

        catch ( SQLException | ClassNotFoundException e ){
            out.println(e);
        }


        

            
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        doPost(request, response);
    }


}