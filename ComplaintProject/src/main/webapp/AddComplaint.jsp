<%@page import="java.sql.Date"%>


<%@page import="infinite.complaintproject.ComplainDAO"%>
<%@page import="infinite.complaintproject.Complain"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

   <form method="get" action="AddComplaint.jsp" style="text-align:center">
     
      Complaint Type:
      <input type="text" name="complaintType"><br/><br/>
      Complaint Description:
       <input type="text" name="cdescription"><br/><br/> 
       Severity:
         <input type="text" name="severity"><br/><br/>
         <input type="submit" value="Insert">
   </form>
   <%
   if(request.getParameter("complaintType")!=null){
	   Complain cmp=new Complain();
	   ComplainDAO dao=new ComplainDAO();
	   cmp.setComplaintType(request.getParameter("complaintType"));
	   cmp.setcDescription(request.getParameter("cdescription"));
	   cmp.setSeverity(request.getParameter("severity"));
	   out.println(dao.addComplaint(cmp));
	   %>
	  <jsp:forward page="ShowComplaint.jsp" />
   <%}
   %>
   
</body>
</html>