<%@page language="java" pageEncoding="utf8" contentType="text/html;charset=UTF-8" %>
<%@page import="org.springframework.beans.support.PagedListHolder"%>
<%@page import="sample.StateMachine.Document"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Documents</title>
    <%@include file="head.jsp" %>
</head>
<body>
    <%@include file="top.jsp" %>
    		<div class="container bs-docs-container">
			<div class="row">
		    	<div class="col-md-12">
		    	<ul class="pagination">
					<%
					PagedListHolder pagedListHolder = (PagedListHolder)request.getAttribute("pagedListHolder");
					for (int i = 0; i < pagedListHolder.getPageCount(); i++) {
						if (i == pagedListHolder.getPage()) {
							out.println("<li class=\"active\"><a href=\"#\">" + i + "</a></li>");
						} else {
							out.println("<li><a href=/StateMachine/list?page=" + i + ">"+ i + "</a></li>");
						} 
					}
					%>
				</ul>
<div class="panel panel-default">
  <div class="panel-heading">List of documents</div>
	<table class="table">
		<thead>
			<th width="100;">Id</th>
			<th width="200;">Name</th>
			<th width="300;">Content</th>
			<th width="200;">Reason</th>
			<th width="100;">Rejected At</th>
			<th width="100;">Created At</th>
			<th width="100;">Verified At</th>
			<th width="100;">Accepted At</th>
			<th width="100;"></th>
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
</div>
<ul class="pagination">
<%
for (int i = 0; i < pagedListHolder.getPageCount(); i++) {
	if (i == pagedListHolder.getPage()) {
		out.println("<li class=\"active\"><a href=\"#\">" + i + "</a></li>");
	} else {
		out.println("<li><a href=/StateMachine/list?page=" + i + ">"+ i + "</a></li>");
	} 
}
%>
</ul>
<form:form method="POST" action="/StateMachine/deleteState">
	<form:input id="reason" path="reason" disabled/>
	<form:input id="state_id" type="hidden" path="state_id"/>
</form:form>
</div>
</div>
</div>
<script type="text/javascript">
	function enableReason(id){
		document.getElementById('reason').disabled = false;
		document.getElementById('state_id').value = id;
	}
</script>
<%@include file="footer.jsp" %>
</body>
</html>