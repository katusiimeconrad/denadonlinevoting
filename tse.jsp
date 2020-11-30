<div>
    <p>Testing the BEAN</p>
</div>

<jsp:useBean id="status" class="com.denad.OpenClosedBean" />

<div>
    <p>Closing Date = ${ status.isVotingOpen() }  </p>
</div>