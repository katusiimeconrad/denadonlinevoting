<%@ include file="menu2.jsp" %>
<%
  
  java.sql.ResultSet rs = (java.sql.ResultSet) session.getAttribute("UserInfo");
  
%>


<div class="container">
    <div class="alert alert-success">
        <p>Welcome <%= session.getAttribute("FirstName") %></p>
    </div>



    <div>
        <h4>Your Info</h4>
        <table class="table table-striped">
            <thead>
              <tr>
                <th scope="col">Property</th>
                <th scope="col">Value</th>
               
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Student Number</td>
                <td><%= rs.getString("StudentNo") %></td>
              </tr>
              <tr>
                <td>First Name</td>
                <td><%= rs.getString("FirstName") %></td>
              </tr>
              <tr>
                <td>Last Name </td>
                <td><%= rs.getString("LastName") %></td>
              </tr>
              <tr>
                <td>Email </td>
                <td><%= rs.getString("Email") %></td>
              </tr>
              <tr>
                <td>College </td>
                <td><%= rs.getString("College") %></td>
              </tr>
              <tr>
                <td>Course</td>
                <td><%= rs.getString("Course") %></td>
              </tr>
            </tbody>
          </table>
    </div>
</div>

<!-- This is the user lands after logging in succcessfully and where they are redirected on finishing voting -->
