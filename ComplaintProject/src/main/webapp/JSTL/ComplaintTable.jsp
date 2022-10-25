<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
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

<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" 
     url="jdbc:mysql://localhost:3306/cmp"
      user="root"
      password="India@2022"/>
   <sql:query var="comp" dataSource="${con }">select * from complaint</sql:query>   
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
<c:forEach var="complain" items="${comp.rows}">
<c:set var="cdate" value="${complain.ComplaintDate }"/>
<c:set var="Date" value="<%=new java.util.Date()%>" />  
<c:set var="ms" value="${Date.getTime()-cdate.getTime() }"></c:set>
<c:set var="day" value="${ms/(1000*60*60*24)}"></c:set>
<c:set var="Id" value="${complain.ComplaintID }" />
<c:choose>
<c:when test="${day>7 && day<10  && complain.Status=='Pending' }">
<tr style="background-color: pink;">
<td><c:out value="${complain.ComplaintID }" /></td>
<td><c:out value="${complain.ComplaintType }" /></td>
<td><c:out value="${complain.CDescription }" /></td>
<td><c:out value="${complain.ComplaintDate }" /></td>
<td><c:out value="${complain.Severity}" /></td>
<td><c:out value="${complain.Status }" /></td>
<c:if test="${complain.Status=='Pending' }">
<td><a href="ResolvComplain.jsp?Id=${Id }">Resolve</a></td>
</c:if>

</tr>
</c:when>
<c:when test="${day>=10  && complain.Status=='Pending' }">
<tr  style="background-color: red;">
<td><c:out value="${complain.ComplaintID }" /></td>
<td><c:out value="${complain.ComplaintType }" /></td>
<td><c:out value="${complain.CDescription }" /></td>
<td><c:out value="${complain.ComplaintDate }" /></td>
<td><c:out value="${complain.Severity}" /></td>
<td><c:out value="${complain.Status }" /></td>
<c:if test="${complain.Status=='Pending' }">
<td><a href="ResolvComplain.jsp?Id=${Id }">Resolve</a></td>
</c:if>

</tr>
</c:when>
<c:otherwise>
<tr>
<td><c:out value="${complain.ComplaintID }" /></td>
<td><c:out value="${complain.ComplaintType }" /></td>
<td><c:out value="${complain.CDescription }" /></td>
<td><c:out value="${complain.ComplaintDate }" /></td>
<td><c:out value="${complain.Severity}" /></td>
<td><c:out value="${complain.Status }" /></td>
<c:if test="${complain.Status=='Pending' }">
<td><a href="ResolvComplain.jsp?Id=${Id }">Resolve</a></td>
</c:if>

</tr>
</c:otherwise>
</c:choose>


</c:forEach>
</table>
</body>
</html>