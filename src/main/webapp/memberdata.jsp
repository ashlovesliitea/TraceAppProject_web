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
                                 <div class="personal_data" style="width:100%"><!-- 회원 정보 탭 -->
                       
                                   <h2 id="datatitle">회원 정보</h2>
                                   <div id="memberdata" style="width:100%; display:flex;">
                                       <div style="width:60%; margin-right:10%;">
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
		                                   <div>
		                                    <img src="static/images/img.png" style="width:80%;height:90%;:">
		                                   </div>
                                   </div>
                                 </div>
                              </div>
                              <div class="tab-pane fade" id="tab2">
                                 <h2 style="text-align:center;">측정 결과</h2>
                                 <%
                                  Boolean measureResult=(Boolean)request.getAttribute("measureResult");
                                 String folderpath=null;
                                 if(measureResult==false){
                                	 %><h3>아직 측정 결과가 없습니다.</h3><% 
                                 }else{
                                	 ArrayList<measureDto>measureList=(ArrayList<measureDto>)request.getAttribute("measureList");
                                	 //folderpath=measureDto.getFolderpath();
                                	 Integer count=measureList.size();
                                	 %>
                                	 <table class="table table-striped" style=" margin-left: 10%;width:80%; text-align: center; color:#000000; border: 1px solid #fffff">
                                	 <tr>
                                	    <td>No</td>
                                	   <td>측정 날짜</td>
                                	   <td>아치</td>
                                	   <td>꿈치</td>
                                	  </tr>
                                	 <%
                                	   
                                	   int size=measureList.size();
                                	   for(int i=0;i<size;i++){
                                		  measureDto meDto=measureList.get(i);
                                		   %>
                                		   <tr>
                                		   <td><%=i+1%></td>
                                		   <td><a href="javascript:popupOpen('<%=meDto.getFolderpath()%>')"><%=meDto.getMeasure_date()%></a></td>
                                		   <td><%=meDto.getArch()%></td>
                                		   <td><%=meDto.getHeel() %>
                                		 
                                		   </tr><%
                                	   }
                                	   %>
                                	   </table><%
                                	 }
                                   %>
                                   
                              
                              </div>
                           </div>
                        </div>
                         <!-- The core Firebase JS SDK is always required and must be listed first -->
<script>
function popupOpen(folderpath){

	var popUrl = "/measureImage.jsp?folderpath="+folderpath;	//팝업창에 출력될 페이지 URL

	var popOption = "width=500, height=500, resizable=no, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);

	}

</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> 
</body>
</html>