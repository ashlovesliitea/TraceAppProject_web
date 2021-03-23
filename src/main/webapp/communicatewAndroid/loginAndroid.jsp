<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*,java.util.*,member.*,tracewebproject.*,javax.sql.*,java.io.*,org.json.simple.*"%>
 <jsp:useBean id="mDao" class="member.memberDao"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id=(String)request.getParameter("id");
   String pw=(String)request.getParameter("pw");
   System.out.println(id+","+pw);

   Integer success=null;

   PreparedStatement pstmt = null; 
   ResultSet rs=null;
   
   DataSource pool = (DataSource) request.getServletContext().getAttribute("my-pool");
   String query="SELECT pw,name FROM user_db WHERE  id=?";
   String dbpw=null;
   String username=null;
   Integer measureCount=0;//측정 결과 개수
   try(Connection conn=pool.getConnection()){
	   pstmt=conn.prepareStatement(query);
	   pstmt.setString(1,id);
	   rs=pstmt.executeQuery();
	   if(rs.next()){
		   dbpw=rs.getString("pw");
		   if(dbpw.equals(pw)) {
			   username=rs.getString("name");
			   success=1;}
		   else success=0;
		    
	   }
	   else{success=-1;//해당 아이디가 존재하지 않음}
   }}
   catch(SQLException e){e.printStackTrace();}
   


   JSONObject MainJson=new JSONObject();
   JSONObject Json=new JSONObject();
   JSONArray jArray=new JSONArray();
   
   Json.put("id",id);
   Json.put("pw",pw);
   Json.put("name",username);
    Json.put("success",success);
   Json.put("measureCount",measureCount);
   

   jArray.add(0,Json);
   

   

  MainJson.put("dataSend",jArray);
   out.print(MainJson.toJSONString());
   out.flush();
 %>

</body>
</html>