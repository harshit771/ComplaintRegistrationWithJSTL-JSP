
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="infinite.complaintproject.ResolveDAO"%>
<%@page import="infinite.complaintproject.Resolve"%>
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

<%
ComplainDAO dao=new ComplainDAO();
String cmpid=request.getParameter("cid");
Complain comp=dao.searchById(cmpid);

if(comp!=null){
	String status=comp.getStatus();
%>
<form method="get" action="ResolveComplaint.jsp" style="text-align:center">
  <br/><br/>
  Complaint Id:
  <input type="text" name="cmpid" value=<%=comp.getComplaintId() %> readonly><br/><br/>
   Complaint Type:
   <input type="text" name="complaintType" value="<%=comp.getComplaintType() %>" ><br/><br/>
   Complaint Description:
   <input type="text" name="cdescription" value="<%=comp.getcDescription() %>"><br/><br/> 
   Complaint Date:
   <input type="text" name="cmpdate" value="<%=comp.getComplaintDate() %>"><br/><br/>
   Severity:
   <input type="text" name="severity" value="<%=comp.getSeverity() %>"><br/><br/>
   Status:
   <input type="text" name="status" value="<%=comp.getStatus() %>"><br/><br/>
  <%
    if(status.equals("Pending")){
  %>
   <input type="submit" value="Solve"><br/><br/>
   <%} %>
</form>
<%} %>
<%
if(request.getParameter("cmpid")!=null){
	String id=request.getParameter("cmpid");
	String date=request.getParameter("cmpdate");
	%>
	<form method="get" action="ResolveComplaint.jsp" style="text-align:center">
	 <br/><br/>
	 Complaint Id:
  <input type="text" name="cid" value=<%=id %> readonly><br/><br/>
     Complaint Date:
   <input type="text" name="date" value=<%=date%> readonly><br/><br/>
	Resolve By:
	<input type="text" name="resby"><br/><br/>
	Comments:
	<input type="text" name="comments"><br/><br/>
	<input type="submit" value="Submit"><br/><br/>
	</form>
	<%} %>
   <%
   if(request.getParameter("cid")!=null && request.getParameter("date")!=null){
	   Resolve res=new Resolve();
	   ResolveDAO da=new ResolveDAO();
	   res.setComplaintId(request.getParameter("cid"));
	   String cdate = request.getParameter("date");
	 
		Date cd = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(cdate).getTime());
		res.setComplaintDate(cd);
		res.setResolvedBy(request.getParameter("resby"));
		res.setComments(request.getParameter("comments"));
		out.println(da.resComp(res));
	 %>
	 <jsp:forward page="ShowComplaint.jsp" />
	 <%} %>  
 

</body>
</html>