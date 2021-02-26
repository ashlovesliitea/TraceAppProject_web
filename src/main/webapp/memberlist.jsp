<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="member.*,java.util.*,java.sql.*,tracewebproject.*" %>
    <jsp:useBean id="mDao" class="member.memberDao"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="static/css/memberlist.css?after"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>
<body>
<ul id="listul">
<%
 ArrayList<String>memberlist=(ArrayList<String>)request.getAttribute("list");
 for(String id: memberlist){
	 String name=mDao.findName(id,request);
	 System.out.println(name);
 
%>
 <li class="li"><i class="fa fa-user-circle-o" aria-hidden="true"></i>
       &nbsp;&nbsp;<a href="login.do?name=<%=id%>"><%=name%></a></li>
 <%} %>
 </ul>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> 

</body>
</html>