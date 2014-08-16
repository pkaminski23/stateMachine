<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>State Machine</title>
</head>
<body>
<a href="list?page=0">list</a>|  
<a href="beginState">beginState</a>
<h2>Verify document</h2>
<form:form commandName="command" method="POST" action="/StateMachine/verifyState">
   <table>
    <tr>
       	<td></td>
        <td><form:hidden path="id" hidden="hidden"/></td>
    </tr>
    <tr>
        <td><form:label path="name">Name</form:label></td>
        <td><form:input path="name"/></td>
    </tr>
    <tr>
        <td><form:label path="content">Content</form:label></td>
        <td><form:input path="content"/></td>
    </tr>
    <tr>
        <td><form:label path="reason">Reason</form:label></td>
        <td><form:input path="reason" disabled="true"/></td>
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
            <input type="submit" value="Submit"/>
        </td>
    </tr>
</table>  
</form:form>
<form method="POST" action="/StateMachine/deleteState/${command.id}">
<input type="submit" value="Delete"/>
</form>
</body>
</html>