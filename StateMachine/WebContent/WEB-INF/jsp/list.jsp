<%@page import="org.springframework.beans.support.PagedListHolder"%>
<%@page import="sample.StateMachine.Document"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
PagedListHolder pagedListHolder = (PagedListHolder)request.getAttribute("pagedListHolder");
for (int i = 0; i < pagedListHolder.getPageCount(); i++) {
	if (i == pagedListHolder.getPage()) {
		out.println(i);
	} else {
		out.println("<a href=/StateMachine/list?page=" + i + ">"+ i + "</a>");
	} 
}
%>

	<table>
		<thead>
			<td width="100;">Id</td>
			<td width="200;">Name</td>
			<td width="300;">Content</td>
			<td width="200;">Reason</td>
			<td width="100;">Rejected At</td>
			<td width="100;">Created At</td>
			<td width="100;">Verified At</td>
			<td width="100;">Accepted At</td>
			<td width="100;"></td>
		</thead>
		<tbody>
<%
PagedListHolder pagedListHolder2 = (PagedListHolder)request.getAttribute("pagedListHolder");
List<Document> states = (List)pagedListHolder2.getPageList();
for (Document state: states) {
	out.println("<tr>");
	out.println("<td width=\"100;\">" + state.getStateId() + "</td>");
	out.println("<td width=\"200;\">" + state.getStateName() + "</td>");
	out.println("<td width=\"300;\">" + state.getStateContent() + "</td>");
	out.println("<td width=\"200;\">" + state.getStateReason() + "</td>");
	out.println("<td width=\"100;\">" + state.getRejectedAt() + "</td>");
	out.println("<td width=\"100;\">" + state.getCreatedAt() + "</td>");
	out.println("<td width=\"100;\">" + state.getVerifiedAt() + "</td>");
	out.println("<td width=\"100;\">" + state.getAcceptedAt() + "</td>");
	out.println("<td width=\"100;\">");
	out.println("<form method=\"POST\" action=\"/StateMachine/deleteState/" + state.getStateId() + "\">");
	out.println("<input type=\"button\" onclick=\"submit()\" value=\"Delete\">");
	out.println("</form></td>");
}
%>
	</tbody>
	</table>

<%
for (int i = 0; i < pagedListHolder.getPageCount(); i++) {
	if (i == pagedListHolder.getPage()) {
		out.println(i);
	} else {
		out.println("<a href=/StateMachine/list?page=" + i + ">"+ i + "</a>");
	} 
}
%>
<form:form method="POST" action="/StateMachine/deleteState">
	<form:input id="reason" path="reason" disabled/>
	<form:input id="state_id" type="hidden" path="state_id"/>
</form:form>
<script type="text/javascript">
	function enableReason(id){
		document.getElementById('reason').disabled = false;
		document.getElementById('state_id').value = id;
	}
</script>
</body>
</html>