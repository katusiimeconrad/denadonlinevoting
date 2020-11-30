<%@ include file="/menu1.jsp" %>

<%
    if( request.getSession() != null ){
        session.invalidate();
    }
%>

<div class="container">

    <%
        if( request.getParameter("Error") != null ) {
            out.println(request.getParameter("Error"));
        }
    %>

    <form action="Login" method="POST">
        <div class="form-group">
            <label for="Student Number">Student Number</label>
            <input type="number"
            class="form-control" name="StudentNumber" id="stdNo" aria-describedby="helpId" placeholder="Enter your Student Number">
            <small id="helpId" class="form-text text-muted">Student Number</small>
        </div>

        <div class="form-group">
          <label for="Password">Password</label>
          <input type="password" class="form-control" name="Password" id="pwd" placeholder="Enter Your Password">
        </div>

        <button type="submit" class="btn btn-primary">Log In</button>

    </form>
</div>