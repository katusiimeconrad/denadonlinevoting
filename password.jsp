<div class="container">
    <!-- Verify Password Before Submission
    1. Check that the values match
    2. Check that the new password is not similar to the email.
    
    
    
    
    -->
    <%= session.getAttribute("StudentNumber") %>
    <form method="POST" action="checkpassword.jsp">
        <div class="form-group">
            <label for="Password">Password</label>
            <input type="password" class="form-control" id="Password" placeholder="Enter New Password" name="NewPassword" required>
          </div>
          <div class="form-group">
            <label for="Verify Password">Verify Password</label>
            <input type="password" class="form-control" id="VerifyPassword" placeholder="Verify Password" name="Verify" required>
          </div>
          <button type="submit" class="btn btn-primary">Update Password</button>
    </form>
</div>

