<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); 
    %>

      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Trace Admin Page</title>
</head>
<body>
<c:if test="${sessionID == null }">
		<script>
			alert("접근 권한이 없습니다!");
			location.href = "/";
		</script>
	</c:if>
<%
  String user_name=request.getParameter("name");
if(user_name==null){
	 user_name="윤정한";//회원 리스트에서 첫 이름 뽑는 함수 만들기
}
%>	

	
<button onclick="location.href=('/logout.jsp')">Logout</button>
<div class="container">
         <div class="row">
               <div class="col-md-3">
               <jsp:include page="/memberlist.jsp"/>
               </div>
               <div class="col-md-9">
                 <jsp:include page="/memberdata" flush="false">
                 <jsp:param name="id" value="<%=user_name %>" />

                 </jsp:include>
               </div>   
         </div>   
         <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> 
</div>
</div>
</body>
</html>