<%@page contentType="text/html; charset=iso-8859-2"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Document accepted</title>
    <%@include file="head.jsp" %>
</head>
<body>
    <%@include file="top.jsp" %>
    		<div class="container bs-docs-container">
			<div class="row">
		    	<div class="col-md-12">
<a href="list">list</a>| 
<a href="beginState">beginState</a>
<h2>Create document</h2>
<form:form commandName="command" id="actionForm" method="GET" action="/StateMachine/list?page=0">
    <div class="form-group">
       <form:hidden path="id" hidden="hidden"/>
    </div>
    <div class="form-group">
        <form:label path="name" class="col-sm-2 control-label">Name</form:label>
        <div class="col-sm-10">
        	<form:input path="name" disabled="true" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <form:label path="content" class="col-sm-2 control-label">Content</form:label>
        <div class="col-sm-10">
        	<form:input path="content" disabled="true" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <form:label path="reason" class="col-sm-2 control-label">Reason</form:label>
        <div class="col-sm-10">
        	<form:input id="reason" path="reason" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <form:label path="created" class="col-sm-2 control-label">Created At</form:label>
        <div class="col-sm-10">
        	<form:input path="created" disabled="true" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <form:label path="verified" class="col-sm-2 control-label">Verified At</form:label>
        <div class="col-sm-10">
        	<form:input path="verified" disabled="true" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <form:label path="accepted" class="col-sm-2 control-label">Accepted At</form:label>
        <div class="col-sm-10">
        	<form:input path="accepted" disabled="true" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
        	<button class="btn btn-default" onclick="enableReason();">Reject</button>
        </div>
    </div>
</form:form>
<a href="list">list</a>
</div>
</div>
</div>
<script type="text/javascript">
	function enableReason(){
		if (document.getElementById('reason').value == '') {
			alert("Pole Reason nie mozy byc puste.");
		} else {
			document.getElementById('actionForm').action = "/StateMachine/rejectState";
			document.getElementById('actionForm').method = "POST";
			document.getElementById('actionForm').submit();
		}
	}
</script>
<%@include file="footer.jsp" %>
</body>
</html>