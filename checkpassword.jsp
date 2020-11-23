
<div class="container">
<%
    String pass1 = request.getParameter("Password");
    String pass2 = request.getParameter("NewPassword");
    String verify = request.getParameter("Verify");


    if( pass2.equals(pass1) ){
        out.println("<div class='alert alert-danger'>Create New Password</div>");
        %>
        <%@ include file="password.jsp" %>
        <%

    }

    else if( pass2.equals(verify)){
        response.sendRedirect("UpdatePassword");
    }
    else {
        out.println("<div class='alert alert-danger'>Passwords Don't Match</div>");

        %>
        <%@ include file="password.jsp" %>

        <%

    }
  


%>

</div>