<%@page import="infinite.complaintproject.Complain"%>
<%@page import="java.util.List"%>
<%@page import="infinite.complaintproject.ComplainDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
ComplainDAO dao=new ComplainDAO();
List<Complain> cmpList=dao.showComplain();

%>
<table border="3" align="center">
<caption> <h2>Complaint Record</h2> </caption>
<tr>
    <th>Complaint ID</th>
    <th>Complaint Type</th>
    <th>Description</th>
    <th>Complaint Date</th>
    <th>Severity</th>
    <th>Status</th>
    <th>Resolve</th>
    
</tr>
<% for(Complain cmp : cmpList){
	int day=dao.day(cmp.getComplaintDate());
	if(day>7 && day<10 && cmp.getStatus().equals("Pending")){
	%>
	<tr style="background-color:pink;">
   <td><%=cmp.getComplaintId() %></td>
   <td><%=cmp.getComplaintType() %></td>
   <td><%=cmp.getcDescription() %></td>
   <td><%=cmp.getComplaintDate() %></td>
   <td><%=cmp.getSeverity() %></td>
   <td><%=cmp.getStatus() %></td>
   <td>
     <%if(cmp.getStatus().equals("Pending")){ %>
   	<a href=ResolveComplaint.jsp?cid=<%=cmp.getComplaintId() %>>Resolve</a>
   	<%} %>
   </td>
 
</tr>
<%}
	else if(day>=10 && cmp.getStatus().equals("Pending")){
	%>
	<tr style="background-color:red;">
   <td><%=cmp.getComplaintId() %></td>
   <td><%=cmp.getComplaintType() %></td>
   <td><%=cmp.getcDescription() %></td>
   <td><%=cmp.getComplaintDate() %></td>
   <td><%=cmp.getSeverity() %></td>
   <td><%=cmp.getStatus() %></td>
     <td>
     <%if(cmp.getStatus().equals("Pending")){ %>
   	<a href=ResolveComplaint.jsp?cid=<%=cmp.getComplaintId() %>>Resolve</a>
   	<%} %>
   </td>
</tr>
	<%} else{
		
	%>	
	<tr>
   <td><%=cmp.getComplaintId() %></td>
   <td><%=cmp.getComplaintType() %></td>
   <td><%=cmp.getcDescription() %></td>
   <td><%=cmp.getComplaintDate() %></td>
   <td><%=cmp.getSeverity() %></td>
   <td><%=cmp.getStatus() %></td>
  <td>
     <%if(cmp.getStatus().equals("Pending")){ %>
   	<a href=ResolveComplaint.jsp?cid=<%=cmp.getComplaintId() %>>Resolve</a>
   	<%} %>
   </td>
</tr>
	<%} %>

	<%} %>

</table>
</body>
</html>