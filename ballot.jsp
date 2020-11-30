<%@ page import="java.sql.*" %>

<%
    String dbURL = "jdbc:mysql://localhost:3306/nad";
    String dbUname = "sean";
    String dbPass = "nalwanga";
    int counter = 0;
    String[] dbPosts = new String[13];

    Class.forName("com.mysql.jdbc.Driver");

    Connection con = DriverManager.getConnection( dbURL, dbUname, dbPass);
    Statement st = con.createStatement();

    String getPosts = "SELECT DISTINCT POST FROM USERS;";

    ResultSet rs1 = st.executeQuery(getPosts);

    while( rs1.next()){
        dbPosts[counter] = rs1.getString("Post");
        counter = counter + 1;
    }
%>

<div class="container">
    <form method='POST' action='tally.jsp'>
        <%
            for(counter = 0; counter < dbPosts.length; counter = counter + 1 ){
                if( dbPosts[counter] != null ){
                    String query = "SELECT * FROM USERS WHERE IsCandidate=1 AND POST='"+dbPosts[counter]+"';";
                    ResultSet rs = st.executeQuery(query);
                    out.println("<h4 class='text-center'>"+dbPosts[counter]+"</h4>");
                    out.println("<table class='table table-striped'>");
                    out.println("<thead class='thead-dark'>");
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
                        out.println("<td><input type='radio' name='"+rs.getString("Post")+"' value='"+rs.getString("StudentNo")+"'></td>");
                        out.println("</tr>");
                    }
        
                    out.println("</tbody>");
                    out.println("</table>");
                    
                }
            }
            out.println("<button class='btn btn-dark'>Submit</button><a href='./ballot.jsp' class='btn btn-dark ml-5'>Reset</a>");
        %>
    </form>
</div>