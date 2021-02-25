<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="member.*,java.util.*,java.sql.*,tracewebproject.*" %>
    <jsp:useBean id="mDao" class="member.memberDao"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
<%
 ArrayList<String>memberlist=(ArrayList<String>)request.getAttribute("list");
 for(String id: memberlist){
	 String name=mDao.findName(id,request);
	 System.out.println(name);
 
%>
 <li><a href="login.do?name=<%=id%>"><%=name%></a></li>
 <%} %>
 </ul>


</body>
</html>