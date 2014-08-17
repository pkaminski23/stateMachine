<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Document Verification</title>
    <%@include file="head.jsp" %>
</head>
<body>
    <%@include file="top.jsp" %>
    		<div class="container bs-docs-container">
			<div class="row">
		    	<div class="col-md-12">
				<a href="list">list</a>|  
				<a href="beginState">beginState</a>
				<h2>Accept document</h2>
				<form:form method="POST" id="actionForm" action="/StateMachine/acceptState">
				    <div class="form-group">
				        <form:hidden path="id" hidden="hidden"/>
				    </div>
				    <div class="form-group">
				        <form:label path="name" class="col-sm-2 control-label">Name</form:label>
				        <div class="col-sm-10">
				        	<form:input path="name" class="form-control"/>
				        </div>
				    </div>
				    <div class="form-group">
				        <form:label path="content" class="col-sm-2 control-label">Content</form:label>
				        <div class="col-sm-10">
				            <form:input path="content" class="form-control"/>
				        </div>
				    </div>
				    <div class="form-group">
				        <form:label path="reason" class="col-sm-2 control-label">Reason</form:label>
				        <div class="col-sm-10">
				        	<form:input id="reason" path="reason" class="form-control"/>
				        </div>
				    </div>
				    <div class="form-group">
				        <form:label path="created" class="col-sm-2 control-label">Created</form:label>
				        <div class="col-sm-10">
				        	<form:input path="created" disabled="true" class="form-control"/>
				        </div>
				    </div>
				    <div class="form-group">
				        <form:label path="verified" class="col-sm-2 control-label">Verified</form:label>
				        <div class="col-sm-10">
				            <form:input path="verified" disabled="true" class="form-control"/>
				        </div>
				    </div>
				    <div class="form-group">
				        <form:label path="accepted" class="col-sm-2 control-label">Accepted</form:label>
				        <div class="col-sm-10">
				            <form:input path="accepted" disabled="true" class="form-control"/>
				        </div>
				    </div>
				    <div class="form-group">
				        <div class="col-sm-offset-2 col-sm-10">
				            <button onclick="submit()" class="btn btn-default">Submit</button>
				            <button onclick="enableReason();" class="btn btn-default">Reject</button>
				        </div>
				    </div>
				</table>  
				</form:form>
			</div>
		</div>
	</div>
<script type="text/javascript">
	function enableReason(){
		if (document.getElementById('reason').value == '') {
			alert("Pole Reason nie mozy byc puste.");
		} else {
			document.getElementById('actionForm').action = "/StateMachine/rejectState";
			document.getElementById('actionForm').submit();
		}
	}
</script>
<%@include file="footer.jsp" %>
</body>
</html>