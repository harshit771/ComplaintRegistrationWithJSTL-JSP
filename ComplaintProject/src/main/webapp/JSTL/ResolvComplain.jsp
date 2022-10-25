<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert tile here</title>
</head>
<body>

<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" 
     url="jdbc:mysql://localhost:3306/cmp"
      user="root"
      password="India@2022"/>
      <sql:query var="complain" dataSource="${con}">
      select * from complaint where ComplaintID=?
      <sql:param value="${param.Id }"></sql:param>
      </sql:query>
<c:set var="flag" value="0"></c:set>
<c:forEach var="c" items="${complain.rows }">
<c:set var="type" value="${c.ComplaintType }" />
<c:set var="cd" value="${c.CDescription }" />
<c:set var="cdate" value="${c.ComplaintDate }" />
<c:set var="severity" value="${c.Severity }" />
<c:set var="status" value="${c.Status }" />

<form action="ResolvComplain.jsp" style="text-align:center">
Complaint Id:
<input type="text" name="Id" value="${param.Id }"  readonly><br/><br/>
Complaint Type:
<input type="text" name="type" value="${type }"  readonly><br/><br/>
Complaint Description:
<input type="text" name="cd" value="${cd }"  readonly><br/><br/>
Complaint Date:
<input type="text" name="cdate" value="${cdate }"  readonly><br/><br/>
Severity:
<input type="text" name="severity" value="${severity } "  readonly><br/><br/>
Status:
<input type="text" name="status" value="${status }" readonly><br/><br/>
Resolve By:
<input type="text" name="resby" ><br/><br/>
Comments:
<input type="text" name="comments" ><br/><br/>
<c:set var="flag" value="1" />
<input type="submit" value="Solve"><br/><br/>

</form>
</c:forEach>
<c:if test="${flag==0 }">
<c:out value="Record not found..."/>
</c:if>


<c:if test="${param.Id!=null && param.cdate!=null}">
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" 
     url="jdbc:mysql://localhost:3306/cmp"
      user="root"
      password="India@2022"/>
      <c:set var="Id" value="${param.Id }" />
 
<c:set var="cdate" value="${param.cdate }" />
<c:set var="resby" value="${param.resby }" />
<c:set var="status" value="${param.status }" />
<c:set var="comments" value="${pqaram.comments }" />

<sql:update var="complain" dataSource="${con }"> insert into resolve(ComplaintID,ComplaintDate,ResolvedBy,Comments) values(?,?,?,?)
 
<sql:param value="${param.Id }" /> 
<sql:param value="${param.cdate }" /> 
<sql:param value="${param.resby }" /> 
<sql:param value="${param.comments}" /> 
<sql:update var="complain" dataSource="${con }"> update complaint set Status='Solve' where ComplaintId=?
<sql:param value="${param.Id }" /> 
</sql:update>

</sql:update>
<c:out value="Complain resolve successfully..." />
<jsp:forward page="ComplaintTable.jsp" />
</c:if>

</body>
</html>