<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*,tracewebproject.*,javax.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%String id=(String)request.getParameter("id");
   String pw=(String)request.getParameter("pw");
   String name=(String)request.getParameter("name");
   String phone=(String)request.getParameter("phone");
   String address=(String)request.getParameter("address");
   String footsize=(String)request.getParameter("footsize");
   String weight=(String)request.getParameter("weight");
   String height=(String)request.getParameter("height");
   String gender=(String)request.getParameter("gender");

   System.out.println(id+" "+pw+" "+name+" "+phone+" "+address+" "+footsize+" "+weight+" "+height+" "+gender);
   
   Connection con = null; 
   PreparedStatement pstmt = null; 
   
   DataSource pool = (DataSource) request.getServletContext().getAttribute("my-pool");
   String SQL="insert into user_db(id,pw,name,address,phone,feet_size,gender,weight,height) values (?,?,?,?,?,?,?,?,?)";
	 try(Connection conn=pool.getConnection()){
		  pstmt=conn.prepareStatement(SQL);
		 pstmt.setString(1,id);
		 pstmt.setString(2, pw);
		 pstmt.setString(3,name);
		 pstmt.setString(4,address);
		 pstmt.setString(5,phone);
		 pstmt.setString(6,footsize);
		 pstmt.setString(7,gender);
		 pstmt.setString(8,weight);
		 pstmt.setString(9,height);
		 
		 int r=pstmt.executeUpdate();
		 System.out.println(r);
		 
		 pstmt.close();
		 con.close();
		 

		 
		 
	 }catch(SQLException ex) {
		 ex.printStackTrace();
	 }
%>

</body>
</html>