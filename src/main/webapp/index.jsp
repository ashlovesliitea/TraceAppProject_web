<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8" />
    <title>Trace Admin Page</title>
    <script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Alata&display=swap" rel="stylesheet">
    <link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
    <link href="static/css/index.css?after" rel="stylesheet">
</head>
<body>
<c:if test="${sessionID != null }">
		<script>
			alert("이미 로그인 중입니다.");
			location.href = "home.do";
		</script>
	</c:if>
<div class="page-container">
       <div class="login-form-container shadow">
         <div class="login-form-right-side">
           <h1>Trace</h1>
           <h2 >Admin Page</h2>
           <p >당신이 남길 발자국을 위하여.</p> 
         </div>
         <div class="login-form-left-side">
           <div class="login-input-container">
             <form action="login.do" method="post">
                <div class="login-input-wrap input-id">
                <i class="far fa-envelope"></i>
                <input placeholder="ID" name="id" type="text"/>
                </div>
                <div class="login-input-wrap input-password">
                  <i class="fas fa-key"></i>
                  <input placeholder="password" name="pw" type="password"/>
                </div>
                <div class="login-btn-wrap">
                 <button type="submit" class="login-btn">Login</button>
              </div>
             </form>
           </div>
         </div>
       </div>
     </div>
</body>
</html>