<%@ page import="java.sql.*" %>
<%@page import="java.util.*" %>

<%
    String dbURL = "jdbc:mysql://localhost:3306/nad";
    String dbUname = "sean";
    String dbPass = "nalwanga";
    int counter = 0;

    Class.forName("com.mysql.jdbc.Driver");

    Connection con = DriverManager.getConnection( dbURL, dbUname, dbPass);
    Statement st = con.createStatement();

    //Prepared statement for getting the user 
    String query = "UPDATE VOTING SET POST = ?, StudentNo = ?, VOTES = VOTES + 1 WHERE StudentNo = ?;";
    PreparedStatement st1 = con.prepareStatement(query);
    Enumeration posts = request.getParameterNames();
        
    while(posts.hasMoreElements()){
        String pName = (String) posts.nextElement();
        String[] pValues = request.getParameterValues(pName);
        for(int i = 0; i < pValues.length; i++){
            out.println(pName);
            out.print(pValues[i]);
            st1.setString(1, pName);
            st1.setInt(2, Integer.parseInt(pValues[i]));
            st1.setInt(3, Integer.parseInt(pValues[i]));
            int rowsAffected = st1.executeUpdate();
            out.println(rowsAffected);
        }

        out.print("<br>");
    }

%>

