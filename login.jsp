<%@ include file="/menu1.jsp" %>

<div class="container">
    <form action="Login" method="POST">
        <div class="form-group">
            <label for="Student Number">Student Number</label>
            <input type="text"
            class="form-control" name="studentNumber" id="stdNo" aria-describedby="helpId" placeholder="Enter your Student Number">
            <small id="helpId" class="form-text text-muted">Student Number</small>
        </div>

        <div class="form-group">
          <label for="Password">Password</label>
          <input type="password" class="form-control" name="password" id="pwd" placeholder="Enter Your Password">
        </div>

        <button type="submit" class="btn btn-primary">Login In</button>

    </form>
</div>