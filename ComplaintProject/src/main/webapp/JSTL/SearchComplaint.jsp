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
<form action="SearchComplaint.jsp" style="text-align:center">
  Complaint Id:
  <input type="text" name="Id" ><br/><br>
  <input type="submit" value="Search" ><br/><br/>
</form>
<c:if test="${param.Id!=null }">
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" 
     url="jdbc:mysql://localhost:3306/cmp"
      user="root"
      password="India@2022"/>
       <sql:query var="comp" dataSource="${con }">select * from complaint where ComplaintID=?
       <sql:param value="${param.Id }" />
       </sql:query>   
      <c:set var="flag" value="0"></c:set>
      <c:forEach var="complain" items="${comp.rows}">
      <center>
      Complaint Id:
      <c:out value="${complain.ComplaintID }" /><br/><br/>
      Complaint Type:
       <c:out value="${complain.ComplaintType }" /><br/><br/>
       Complaint Description:
       <c:out value="${complain.CDescription }" /><br/><br/>
       Complaint Date:
       <c:out value="${complain.ComplaintDate }" /><br/><br/>
       Severity:
        <c:out value="${complain.Severity }" /><br/><br/>
       Status:
     <c:out value="${complain.Status }" /><br/><br/>
     <c:set var="flag" value="1"></c:set>
     </center>
      </c:forEach>
     
     <c:if test="${flag==0 }">
       <c:out value="Record not found..."/>
     </c:if></c:if>
</body>
</html>