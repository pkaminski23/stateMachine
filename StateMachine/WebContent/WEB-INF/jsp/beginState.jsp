<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>State Machine</title>
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
<form:form commandName="command" id="actionForm" method="POST" action="/StateMachine/createState">
   <table>
    <div class="form-group">
        <td><form:hidden path="id" hidden="hidden"/></td>
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
        <form:input id="reason" path="reason" disabled="true" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <form:label path="created" class="col-sm-2 control-label">Created At</form:label>
        <div class="col-sm-10">
        <form:input path="created" disabled="true" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <form:label path="verified" class="col-sm-2 control-label">Verfified At</form:label>
        <div class="col-sm-10">
        <form:input path="verified" disabled="true" class="form-control"/>
        </d>
    </div>
    <div class="form-group">
        <form:label path="accepted" class="col-sm-2 control-label">Accepted At</form:label>
        <div class="col-sm-10">
        <form:input path="accepted" disabled="true" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
           <button class="btn btn-default" onclick="checkValues();">Submit</button>
        </div>
    </div>
</table>  
</form:form>
</div>
</div>
</div>
<script type="text/javascript">
	function checkValues(){
		var nameValue = document.getElementById('name').value;
		var contentValue = document.getElementById('content').value;
		if (nameValue == '' || contentValue == '') {
			alert("Pole Name i Content nie moga byc puste.");
		} else {
			document.getElementById('actionForm').submit();
		}
	}
</script>
<%@include file="footer.jsp" %>
</body>
</html>