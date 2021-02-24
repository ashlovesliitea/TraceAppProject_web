<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trace Admin Page</title>
</head>
<body>
<c:if test="${sessionID == null }">
		<script>
			alert("접근 권한이 없습니다!");
			location.href = "/";
		</script>
	</c:if>
<c:if test="${sessionID!=null }">
   ${sessionID} 로그인 중
</c:if>	
	
<button onclick="location.href=('/logout.jsp')">Logout</button>
</body>
</html>