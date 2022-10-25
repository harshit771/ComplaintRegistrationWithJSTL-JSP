<%@page import="infinite.jstlcomplaint.ComplaintDAO"%>
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

 <form method="get" action="AddComplaint.jsp" style="text-align:center">
     
      Complaint Type:
      <input type="text" name="complainttype"><br/><br/>
      Complaint Description:
       <input type="text" name="cdescription"><br/><br/> 
       Severity:
         <input type="text" name="severity"><br/><br/>
         <input type="submit" value="Insert">
   </form>
   <c:if test="${param.complainttype!=null }">
    <jsp:useBean id="comp" class="infinite.jstlcomplaint.Complaint"/>
   	   <jsp:setProperty property="*" name="comp"/>
	   <jsp:useBean id="dao" class="infinite.jstlcomplaint.ComplaintDAO" scope="page" />
   		<c:out value="${dao.addComplaint(comp)}"/>
   </c:if>
   	  
</body>
</html>