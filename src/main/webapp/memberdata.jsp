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
   String address=mDto.getAddress();
   String gender=mDto.getGender();
   String weight=mDto.getWeight();
   String height=mDto.getHeight();
   String joindate=mDto.getJoin_date();%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Alata&display=swap" rel="stylesheet">
<link rel="stylesheet" href="static/css/memberdata.css?after"/>

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
                       
                                   <h2 id="datatitle">회원 정보</h2>
                                   <ol id="datalist">
                                  <li class="data">  이름: <%=name %></li>
                                   <li class="data">발 사이즈: <%=feet_size %></li>
                                   <li  class="data">전화번호: <%=phone %></li>
                                   <li  class="data"> 주소: <%=address %></li>
                                   <li class="data"> 성별: <%=gender %></li>
                                   <li class="data"> 체중/ 키: <%=weight%>, <%=height %></li>
                                   <li  class="data">가입 일자: <%=joindate%></li>
                            
                                   </ol>
                                   
                                 </div>
                              </div>
                              <div class="tab-pane fade" id="tab2">
                                 <h1>측정 결과</h1>
                                 <img id="img" width="400" height="500"></div>
                              </div>
                           </div>
                        </div>
                         <!-- The core Firebase JS SDK is always required and must be listed first -->

<script src="https://www.gstatic.com/firebasejs/8.2.9/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.2.9/firebase-analytics.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.2.1/firebase.js"></script>
<script>
  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  var firebaseConfig = {
    apiKey: "AIzaSyCrvvW1xaCI3Vlh76AxsaXzqrn1H4CojPE",
    authDomain: "tracemobileapp-de9b1.firebaseapp.com",
    databaseURL: "https://tracemobileapp-de9b1-default-rtdb.firebaseio.com",
    projectId: "tracemobileapp-de9b1",
    storageBucket: "tracemobileapp-de9b1.appspot.com",
    messagingSenderId: "51128598053",
    appId: "1:51128598053:web:edc12f4d3e9bdfc146c9cc",
    measurementId: "G-4405168J95"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);

  var storage=firebase.storage();
  var storageRef=storage.ref();
  var tangRef=storageRef.child('snowball.png');
 
  
//First we sign in the user anonymously
  firebase.auth().signInAnonymously().then(function() {
    // Once the sign in completed, we get the download URL of the image
    tangRef.getDownloadURL().then(function(url)                             {
      // Once we have the download URL, we set it to our img element
      document.querySelector('img').src = url;
      
    }).catch(function(error) {
      // If anything goes wrong while getting the download URL, log the error
      console.error(error);
    });
  });
</script>    
          

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> 
</body>
</html>