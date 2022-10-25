<%@page import="infinite.complaintproject.Complain"%>
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
<form action="Search.jsp" style="text-align:center">
  Complaint Id:
  <input type="text" name="cmp"><br/><br/>
  <input type="submit" value="Search"><br/><br/>
</form>
<%
String cmpid=request.getParameter("cmp");
ComplainDAO dao=new ComplainDAO();
Complain comp=dao.searchById(cmpid);
if(comp!=null){
	%>
	<table border="3" align="center">
<tr>
    <th>Complaint ID</th>
    <th>Complaint Type</th>
    <th>Description</th>
    <th>Complaint Date</th>
    <th>Severity</th>
    <th>Status</th>
    
</tr>
<tr>
<td><%=comp.getComplaintId() %></td>
<td><%=comp.getComplaintType() %></td>
<td><%=comp.getcDescription() %></td>
<td><%=comp.getComplaintDate() %></td>
<td><%=comp.getSeverity() %></td>
<td><%=comp.getStatus() %></td>
</tr>

	
	<%}
%>

</table>
</body>
</html>