<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
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
      <form action="addComplain.jsp" style="text-align:center">
        Complaint Type:
      <input type="text" name="cType"><br/><br/>
      Complaint Description:
       <input type="text" name="cdescription"><br/><br/> 
       Severity:
         <input type="text" name="severity"><br/><br/>
         <input type="submit" value="Insert">
      </form>
     <c:if  test="${param.cType!=null }">
      <sql:query var="compId" dataSource="${con }">
      select ComplaintID from Complaint ORDER BY ComplaintID DESC LIMIT 1
      </sql:query>
      <c:set var="id" value="${compId.rows[0].complaintId }" />
     <c:set var="ctype" value="${param.cType }" />
     <c:set var="cdesc" value="${param.cdescription }" />
     <c:set var="sev" value="${param.severity }" />
      <%
      String id=(String)pageContext.getAttribute("id");
      String complaintId="C"+String.format("%03d",Integer.parseInt(id.substring(1))+1);
      pageContext.setAttribute("complaintId", complaintId);
      %>
       <sql:update var="complain" dataSource="${con }">insert into complaint(ComplaintID,ComplaintType,CDescription,Severity) values(?,?,?,?)
       <sql:param value="${complaintId }" />
       <sql:param value="${ctype }"/>
       <sql:param value="${cdesc }" />
       <sql:param value="${sev }" />
       </sql:update>
      </c:if>
</body>
</html>