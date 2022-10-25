<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="bean" class="infinite.jstlcomplaint.ComplaintDAO" scope="page" />

<table border="3" align="center">
<caption> <h2>Complaint Record</h2> </caption>
<tr>
    <th>Complaint ID</th>
    <th>Complaint Type</th>
    <th>Description</th>
    <th>Complaint Date</th>
    <th>Severity</th>
    <th>Status</th>
   
    
</tr>
<c:forEach var="comp" items="${bean.showComplain() }">
<tr>
<td><c:out value="${comp.complaintId }"/></td>
<td><c:out value="${comp.complaintType }"/></td>
<td><c:out value="${comp.cDescription }"/></td>
<td><c:out value="${comp.complaintDate }"/></td>
<td><c:out value="${comp.severity }"/></td>
<td><c:out value="${comp.status }"/></td>
</tr>

</c:forEach>
</table>
</body>
</html> 