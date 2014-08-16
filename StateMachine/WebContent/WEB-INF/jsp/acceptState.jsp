<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>State Machine</title>
</head>
<body>
<a href="list?page=0">list</a>| 
<a href="beginState">beginState</a>
<h2>Create document</h2>
<form:form commandName="command" id="actionForm" method="GET" action="/StateMachine/list?page=0">
   <table>
    <tr>
    	<td></td>
        <td><form:hidden path="id" hidden="hidden"/></td>
    </tr>
    <tr>
        <td><form:label path="name">Name</form:label></td>
        <td><form:input path="name" disabled="true"/></td>
    </tr>
    <tr>
        <td><form:label path="content">Content</form:label></td>
        <td><form:input path="content" disabled="true"/></td>
    </tr>
    <tr>
        <td><form:label path="reason">Reason</form:label></td>
        <td><form:input id="reason" path="reason"/></td>
    </tr>
    <tr>
        <td><form:label path="created">Created At</form:label></td>
        <td><form:input path="created" disabled="true"/></td>
    </tr>
    <tr>
        <td><form:label path="verified">Verified At</form:label></td>
        <td><form:input path="verified" disabled="true"/></td>
    </tr>
    <tr>
        <td><form:label path="accepted">Accepted At</form:label></td>
        <td><form:input path="accepted" disabled="true"/></td>
    </tr>
    <tr>
        <td colspan="2">
        <a href="list?page=0">list</a>
        <input type="button" onclick="enableReason();" value="Reject"/>
        </td>
    </tr>
</table>  
</form:form>
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
</body>
</html>