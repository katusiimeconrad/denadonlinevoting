<%@ page import="java.sql.*" %>

<%

    try {
        String dbURL = "jdbc:mysql://localhost:3306/nad";
        String dbUname = "sean";
        String dbPass = "nalwanga";
        int counter = 0;
        String[] dbPosts = new String[13];

        Class.forName("com.mysql.jdbc.Driver");
        
        Connection con = DriverManager.getConnection( dbURL, dbUname, dbPass);
        Statement st = con.createStatement();
        Statement st1 = con.createStatement();
        Statement st2 = con.createStatement();
        Statement st3 = con.createStatement();

        String getPosts = "SELECT DISTINCT POST FROM USERS;";
        ResultSet rs1 = st.executeQuery(getPosts);

        while( rs1.next()){
            dbPosts[counter] = rs1.getString("Post");
            counter = counter + 1;
        }
        
        out.println("<div class='container'>");
        out.println("<h1 class='text-center mb-2'>Voting Results</h1>");

        for(counter = 0; counter < dbPosts.length; counter = counter + 1 ){
            if( dbPosts[counter] != null ){
                String query = "SELECT MAX(VOTES) FROM VOTING WHERE POST ='"+dbPosts[counter]+"';";
                ResultSet rs = st1.executeQuery(query);
                out.println("<h4 class='text-center'>"+dbPosts[counter]+"</h4>");
                out.println("<table class='table table-striped'>");
                out.println("<thead class='thead-dark'>");
                out.println("<tr>");
                out.println("<th>Leader StudentNo</th>");
                out.println("<th>Leader Name</th>");
                out.println("<th>Leader Course</th>");
                out.println("<th>Leader College</th>");
                out.println("<th>Leader Post</th>");
                out.println("<th>Votes</th>");
                out.println("</tr>");
                out.println("</thead>");
                out.println("<tbody>");

                while(rs.next()){

                    int votes = rs.getInt("MAX(VOTES)");
                    String winner = "SELECT StudentNo FROM VOTING WHERE VOTES ="+votes+" AND POST = '"+dbPosts[counter]+"';";
                    ResultSet rs2 = st2.executeQuery(winner);

                    while(rs2.next()){
                        String winnerInfo = "SELECT * FROM USERS WHERE StudentNo ="+rs2.getString("StudentNo")+";";
                        ResultSet rs3 = st3.executeQuery(winnerInfo);
                        
                        while(rs3.next()){
                            out.println("<tr>");
                                out.println("<td>"+rs3.getString("StudentNo")+"</td>");
                                out.println("<td>"+rs3.getString("FirstName")+" "+rs3.getString("LastName")+"</td>");
                                out.println("<td>"+rs3.getString("Course")+"</td>");
                                out.println("<td>"+rs3.getString("College")+"</td>");
                                out.println("<td>"+rs3.getString("Post")+"</td>");
                                out.println("<td>"+votes+"</td>");
                            out.println("</tr>");
                        }
                        
                    }

                }

                out.println("</tbody>");
                out.println("</table>");
            }
            
        }
        out.println("</div>");

    }

    catch ( SQLException | ClassNotFoundException e ){
        out.println(e);
    }

%>