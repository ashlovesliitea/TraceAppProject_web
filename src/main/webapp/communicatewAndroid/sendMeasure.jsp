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
<%
String id=(String)request.getParameter("id");
   String measure_date=(String)request.getParameter("measure_date");
   String folderpath=(String)request.getParameter("folderpath");
   String arch=(String)request.getParameter("arch");
   String heel=(String)request.getParameter("heel");
   String admin_send=(String)request.getParameter("admin_send");
  
   
   
    PreparedStatement pstmt=null;
    DataSource pool = (DataSource) request.getServletContext().getAttribute("my-pool");
    String SQL="insert into measure_db(id,measure_date,folderpath,arch,heel,admin_send) values (?,?,?,?,?,?)";
    
    try(Connection conn=pool.getConnection()){
		  pstmt=conn.prepareStatement(SQL); 
			 
			 pstmt.setString(1,id);
			 pstmt.setString(2, measure_date);
			 pstmt.setString(3,folderpath);
			 pstmt.setString(4,arch);
			 pstmt.setString(5,heel);
			 pstmt.setString(6,admin_send);
			 int r=pstmt.executeUpdate();
			 System.out.println(r);
			 
			 pstmt.close();
			 conn.close();
			 
			 
		 }catch(SQLException ex) {
			 ex.printStackTrace();
		 }
    %>

</body>
</html>