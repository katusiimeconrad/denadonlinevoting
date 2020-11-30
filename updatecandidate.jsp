<%@ page import="java.sql.*" %>
<%
    String stdNo = request.getParameter("StdNo");
    String dbURL = "jdbc:mysql://localhost:3306/nad";
    String dbUname = "sean";
    String dbPass = "nalwanga";

    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection( dbURL, dbUname, dbPass);

    Statement st = con.createStatement();

    //Check for student Number
    


    String query = "UPDATE Users SET Post='" + request.getParameter("Post") + "' , IsCandidate=true WHERE StudentNo='" + stdNo +"';";
    //String que = "update nad.users set IsCandidate=true , Post='President' where StudentNo=1800700855;";

    //int x = st.executeUpdate(query);
    out.print(query);

    
%> 