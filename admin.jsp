<!-- This is where the admin updates and deletes candidates -->
<%@ page import="java.sql.*" %>

<form action="admin.jsp" >
    <div class="form-group">
        <label for="StdNo">Enter Candidate's Student Number </label>
        <input type="number" name="StdNo" placeholder="Enter Candidate's Student Number" maxlength="10" required >
    </div>
    <button type="submit" class="btn btn-primary">Find Candidate</button>
</form>

<%
    String stdNo = request.getParameter("StdNo");
    String dbURL = "jdbc:mysql://localhost:3306/nad";
    String dbUname = "sean";
    String dbPass = "nalwanga";

    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection( dbURL, dbUname, dbPass);

    Statement st = con.createStatement();

    //Check for student Number
    String query = "SELECT * FROM Users WHERE StudentNo=" +  stdNo ;

    ResultSet rs = st.executeQuery(query);

    if( rs.next()){
        
%>  
    <div>
        <table>
            <thead>
                <th>Student Number</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>College</th>
                <th>Course</th>
                <th>Candidate</th>
                <th>Post</th>
            </thead>
            <tr>
                <td><%= rs.getString("StudentNo") %></td>
                <td><%= rs.getString("FirstName") %></td>
                <td><%= rs.getString("LastName") %></td>
                <td><%= rs.getString("College") %></td>
                <td><%= rs.getString("Course") %></td>
                <td><%= rs.getString("IsCandidate") %></td>
                <td><%= rs.getString("Post") %></td>

            </tr>
        </table>

    </div>
<%     

    }
    else {
        %>
        <div class="alert alert-danger">
            Student Number does not match any record in the database. 
        </div>




    <%    
    }
    %>

    <div class="container">
        <form action="updatecandidate.jsp">
            <div class="form-group">
                <label for="exampleFormControlSelect1">Select Post</label>
                <select class="form-control" id="Post" name="Post" placeholder="Select a Post" required>
                <option>President</option>
                <option>Vice President</option>
                <option>GRC</option>
                <option>Finance</option>
                <option>Speaker</option>
                </select>
            </div>
            <button type="submit">Make Candidate</button>

            <button onclick="">Remove Candidate</button>
        </form>
    </div>

    
    <!-- Retrieve System Status -->
<%
    String status = "SELECT *" ;

    ResultSet rs1 = st.executeQuery(query);

    if( rs1.next()){

%>

    <div>
        <form>
            Voting Status   

        </form>
    </div>
    
<%

    }


%>
