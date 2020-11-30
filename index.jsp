<%@ taglib prefix="c" uri="jstl-api-1.2.jar" %>

<!-- 
    The main page content here
-->
<jsp:useBean id="status" class="com.denad.OpenClosedBean" />

<c:if ${ status.isVotingOpen() }>
    <p>It works! ${ status.isVotingOpen() } </p>
</c:if>

















<div class="container">
    <h3>Welcome     ,vnv,nv,nvn,v,nv,nv,nv, </h3>

</div>






<!--
    The content ends here.
-->
