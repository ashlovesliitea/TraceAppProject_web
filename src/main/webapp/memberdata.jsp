<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="member.*,java.util.*,java.sql.*,tracewebproject.*" %>
    <jsp:useBean id="mDao" class="member.memberDao"/>
<!DOCTYPE html>
<%
   memberDto mDto=(memberDto)request.getAttribute("mDto");
   String name=mDto.getName();
   String id=mDto.getId();
   String feet_size=mDto.getFeet_size();
   String phone=mDto.getPhone();
   String address=mDto.getAddress();%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
     <div id="adminpage">
                       
                        <div id="memberdata">
                           <ul class="nav nav-tabs">
                              <li class="nav-item">
                                 <a class="nav-link active" data-toggle="tab" href="#tab1">회원 정보</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" data-toggle="tab" href="#tab2">측정 결과</a>
                              </li>
                           </ul>
                           <div class="tab-content">
                              <div class="tab-pane fade show active" id="tab1">
                                 <div class="personal_data"><!-- 회원 정보 탭 -->
                                   <h2>회원 정보</h2>
                                   이름: <%=name %>
                                   발 사이즈: <%=feet_size %>
                                   전화번호: <%=phone %>
                                   주소: <%=address %>
                                   
                                   
                                 </div>
                              </div>
                              <div class="tab-pane fade" id="tab2">
                                 <h1>측정 결과</h1>
                              </div>
                           </div>
                        </div>
                     </div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> 
</body>
</html>